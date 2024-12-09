#!/bin/bash

CONFIG_FILE=~/.config/code-server/config.yaml
PASSWORD=$(openssl rand -base64 12)

# code-server 설정 디렉토리 생성
mkdir -p ~/.config/code-server

# 기본 설정 파일 생성
cat > $CONFIG_FILE <<EOL
bind-addr: 0.0.0.0:8080
auth: password
password: $PASSWORD
cert: false
EOL

echo "Code-server 비밀번호: $PASSWORD"

# code-server 시작
exec code-server --bind-addr 0.0.0.0:8080 --user-data-dir ~/.local/share/code-server --config $CONFIG_FILE
