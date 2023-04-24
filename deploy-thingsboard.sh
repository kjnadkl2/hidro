wget https://github.com/thingsboard/thingsboard-gateway/releases/latest/download/python3-thingsboard-gateway.deb

sudo apt install ./python3-thingsboard-gateway.deb -y

sudo mv tb_gateway.yaml /etc/thingsboard-gateway/config/ && mv mqtt.json /etc/thingsboard-gateway/config/

sudo systemctl restart thingsborad-gateway

systemctl status thingsboard-gateway
