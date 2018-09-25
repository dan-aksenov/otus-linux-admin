# ДЗ 14

Резервное копирование

Вывод list jobs
```
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
| jobid | name          | starttime           | type | level | jobfiles | jobbytes   | jobstatus |
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
|     1 | BackupClient1 | 2018-09-19 11:00:03 | B    | F     |    2,372 | 26,397,234 | T         |
|     2 | BackupClient1 | 2018-09-19 11:05:03 | B    | D     |        0 |          0 | T         |
|     3 | BackupClient1 | 2018-09-19 11:15:02 | B    | I     |        0 |          0 | T         |
|     4 | BackupClient1 | 2018-09-19 11:25:02 | B    | I     |        0 |          0 | T         |
|     5 | BackupClient1 | 2018-09-19 11:35:02 | B    | I     |        0 |          0 | T         |
|     6 | BackupClient1 | 2018-09-19 11:45:02 | B    | I     |        0 |          0 | T         |
|     7 | BackupClient1 | 2018-09-19 11:55:02 | B    | I     |        0 |          0 | T         |
|     8 | BackupClient1 | 2018-09-19 12:00:02 | B    | D     |        0 |          0 | T         |
|     9 | BackupClient1 | 2018-09-19 12:05:02 | B    | D     |        0 |          0 | T         |
|    10 | BackupClient1 | 2018-09-19 12:15:02 | B    | I     |        0 |          0 | T         |
|    11 | BackupClient1 | 2018-09-19 12:25:02 | B    | I     |        0 |          0 | T         |
|    12 | BackupClient1 | 2018-09-19 12:35:02 | B    | I     |        0 |          0 | T         |
|    13 | BackupClient1 | 2018-09-19 12:45:02 | B    | I     |        0 |          0 | T         |
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
```

Вовод list files jobid=1 (фрагмент)
```
| /etc/postfix/main.cf                                   |
| /etc/postfix/master.cf                                 |
| /etc/postfix/relocated                                 |
| /etc/postfix/transport                                 |
| /etc/postfix/virtual                                   |
| /etc/postfix/                                          |
| /etc/rsyslog.conf                                      |
| /etc/rsyncd.conf                                       |
| /etc/qemu-ga/fsfreeze-hook                             |
| /etc/qemu-ga/fsfreeze-hook.d/                          |
| /etc/qemu-ga/                                          |
| /etc/chrony.conf                                       |
| /etc/chrony.keys                                       |
| /etc/screenrc                                          |
| /etc/man_db.conf                                       |
| /etc/e2fsck.conf                                       |
| /etc/mke2fs.conf                                       |
| /etc/sudo-ldap.conf                                    |
| /etc/sudo.conf                                         |
| /etc/sudoers                                           |
| /etc/sudoers.d/vagrant                                 |
| /etc/sudoers.d/                                        |
| /etc/vconsole.conf                                     |
| /etc/locale.conf                                       |
| /etc/hostname                                          |
| /etc/.updated                                          |
| /etc/aliases.db                                        |
| /etc/bacula/bacula-fd.conf                             |
| /etc/bacula/examples/bacula-fd.conf                    |
| /etc/bacula/examples/                                  |
| /etc/bacula/                                           |
| /etc/vimrc                                             |
| /etc/client-inited                                     |
| /etc/                                                  |
+--------------------------------------------------------+
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
| jobid | name          | starttime           | type | level | jobfiles | jobbytes   | jobstatus |
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
|     1 | BackupClient1 | 2018-09-19 11:00:03 | B    | F     |    2,372 | 26,397,234 | T         |
+-------+---------------+---------------------+------+-------+----------+------------+-----------+
```
