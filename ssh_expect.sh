#!/bin/bash
USER=root
PASS=123.com
IP=192.168.1.120
expect << EOF
set timeout 30
spawn ssh $USER@$IP   
expect {
    "(yes/no)" {send "yes\r"; exp_continue}
    "password:" {send "$PASS\r"}
}
expect "$USER@*"  {send "$1\r"}
expect "$USER@*"  {send "exit\r"}
expect eof
EOF
