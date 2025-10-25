# Brian's Home Salt config

# Installing

## Bootstrap

```bash
sudo apt install -y curl
curl -o bootstrap-salt.sh -L https://github.com/saltstack/salt-bootstrap/releases/latest/download/bootstrap-salt.sh
sudo sh bootstrap-salt.sh
sudo echo "master: nacl.hjedi.net" | sudo tee -a /etc/salt/minion.d/master.conf
sudo systemctl restart salt-minion
sudo systemctl status salt-minion
```

# First time setup

## Fetch setup configs
```
cd /srv
sudo git clone https://gitlab.com/techblotter/home_salt.git
sudo mv home_salt/* ./
sudo rm -rf home_salt
```

## First run

```
sudo salt 'hub' state.sls users
sudo salt 'hub' state.sls salt
sudo su - salt
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
exit
```

Copy the contents as a new SSH key for Gitlab

```
sudo su - salt
./initialize.sh
```

## Initialize Backups

```
sudo su - backups
aws configure
```
