# This script requires barman to have sudo privileges.
# Database to recover
pg=$1
# Postgresql server version
ver=$(barman status $pg | grep -e "PostgreSQL version" | cut -d " " -f 3 | cut -d "." -f 1,2)
# Current day of week (to read correct log)
dow=$(date --date=${dateinfile#?_} "+%A"|cut -c -3)
# Sandbox directory
dir=/var/lib/pgsql/$ver/stage
# to do: add tablespace part.
# Storage directory for barman backup
storage=/var/lib/barman

# DBA contact to inform
send_to=aksenov_d@tii.ru

# Remove and recreate sandbox directory if exists
sudo -u postgres test -d $dir && sudo -u postgres rm -rf $dir && sudo -u postgres mkdir $dir -p

# Restore from latest barman backup
barman recover $pg latest $dir --remote-ssh-command "ssh postgres@localhost"

# Create simple postgresql.conf.
cat > /tmp/postgresql.conf <<EOF
# Some high number port to avoid confilicts with existing installations
port=54320
# Local timezone for correct logging
log_timezone = 'W-SU'
timezone = 'W-SU'
# Because of "PANIC:  too many replication slots active before shutdown" add some slots to avoid
max_replication_slots=10
EOF
sudo -u postgres cp /tmp/postgresql.conf $dir

# Find .partial wal file for complete recovery
# See http://docs.pgbarman.org/release/1.6.1/ limitations-of-partial-wal-files-with-recovery for more info.
xlog=$(find $storage/$pg/streaming/ -name '*.partial' -exec basename {} \; | cut -d "." -f 1)
sudo find $storage/$pg/streaming/ -type f -name '*.partial' -exec cp {} $dir/pg_xlog/$xlog \;
sudo chown postgres.postgres $dir/pg_xlog/$xlog
sudo chmod 664 $dir/pg_xlog/$xlog

# Starting database using correct binaries
sudo -u postgres /usr/pgsql-$ver/bin/pg_ctl start -D $dir -w -t 10 -l /var/lib/pgsql/$ver/stage/pg_log/postgres-$dow.log

# Wait until database fully starts: ready to "accept" connections.
while true; do
   sudo -u postgres grep accept /var/lib/pgsql/$ver/stage/pg_log/postgres-$dow.log
   if [ $? -eq 0 ]; then
        break
    fi
   sleep 1
done

# Send recovery results to DBA
sudo -u postgres cat /var/lib/pgsql/$ver/stage/pg_log/postgres-$dow.log | mail -s "Barman backup validation for $pg" $send_to

# Shutdown database and remove staging area.
sudo -u postgres /usr/pgsql-$ver/bin/pg_ctl stop -D $dir -m fast
sudo -u postgres test -d $dir && sudo -u postgres rm -rf $dir
