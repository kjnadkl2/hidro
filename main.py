import threading
import requests
import paramiko

user = 'hidro'
password = '12345678'
tb_url = '192.168.110.20'


with open('deploy.sh', 'r') as f:
    commands = [line.strip() for line in f]

with open('gateways.txt', 'r') as f:
    gateways = [line.strip() for line in f]

max_threads = 10
semaphore = threading.BoundedSemaphore(value=max_threads)

def execmd(gateway):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    client.connect(hostname=gateway, username=user, password=password)

    for command in commands:
        stdin, stdout, stderr = client.exec_command(command)
        print(f"Host {gateway} - Error: {stderr.read().decode('utf-8')}")

    client.close()

    semaphore.release()

threads = []
for gateway in gateways:
    semaphore.acquire()

    thread = threading.Thread(target=execmd, args=[gateway])
    thread.start()
    threads.append(thread)

for thread in threads:
    thread.join()
