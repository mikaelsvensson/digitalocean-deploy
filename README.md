# digitalocean-deploy

## Getting Started

0. Get Ansible Vault encryption key from a developer.
0. Install Node 8 (or at least not version 10 because the Achievements application cannot be compiled with Node 10).
0. Install Python 2.
0. Install version 0.3.5 of the Python library `dopy` using `pip install -I dopy==0.3.5`.
0. Install the Python library `six` using `pip install six`.
0. Install Ansible using `pip install ansible`.
0. Install jmespath using `pip install jmespath`.
0. Optional: Install `doctl` from https://github.com/digitalocean/doctl

See https://github.com/ansible/ansible-modules-core/issues/2509 for more information on the specific Python instructions.

## Deploying to Digital Ocean

    $ cd ansible/playbooks/
    $ ansible-playbook \
        --vault-password-file=/PATH/TO/VAULT/PASSWORD.txt \
        --key-file=/PATH/TO/SSH/KEY/CONFIGURED/IN/DIGITALOCEAN/ACCOUNT \
        deploy.yaml 

## Useful doctl Commands

Set or test credentials:

    $ doctl auth init
    
List Droplet distributions:

    $ doctl compute image list-distribution
    
List Droplet sizes:

    $ doctl compute size list
    
List Droplet regions:

    $ doctl compute region list

## Connecting to database

Connect to Droplet over SSH and the run this command (connects to "app" database as user "app"):

    $ psql -U app -h 127.0.0.1 app

## Helpful Links

Ansible

https://docs.ansible.com/ansible/2.5/modules/list_of_cloud_modules.html?highlight=digital_ocean

Let's Encrypt

https://certbot.eff.org/docs/using.html#certbot-command-line-options
https://ivanderevianko.com/2019/03/migrate-letsencrypt-certificates-certbot-to-new-server
https://community.letsencrypt.org/t/move-to-another-server/77985/5
https://community.letsencrypt.org/t/best-way-to-migrate-and-create-letsencrypt-certs-on-new-server/77311