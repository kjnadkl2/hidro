sudo apt update -y && sudo apt ugprade -y

sudo apt install python3 python3-dev

wget https://github.com/thingsboard/thingsboard-gateway/releases/latest/download/python3-thingsboard-gateway.deb

sudo apt install ./python3-thingsboard-gateway.deb -y

sudo wget -o https://raw.githubusercontent.com/kjnadkl2/hidro/main/gateway/tb_gateway.yaml -O /etc/thingsboard-gateway/config/ && wget https://raw.githubusercontent.com/kjnadkl2/hidro/main/gateway/mqtt.json -O /etc/thingsboard-gateway/config/
