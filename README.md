# digitalocean-deploy

## Getting Started

### Installing Ansible

Documentation: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

0. Get Ansible Vault encryption key from a developer.

0. Install Python 3 in virtual Python environment

    `$ virtualenv -p /usr/local/bin/python3.8 .venv-digitalocean`

0. Activate the virtual environment
   
   `$ source .venv-digitalocean/bin/activate`

0. Install Ansible

    `$ pip install ansible`

0. Install boto3 (required for AWS S3 uploads)

    `$ pip install boto3`

0. Install dopy (required for Digital Ocean)

    `$ pip install dopy`

See https://github.com/ansible/ansible-modules-core/issues/2509 for more information on the specific Python instructions.

## Deploying to Digital Ocean

### Specifying SSH key file and vault password file

Either add this to `ansible/ansible.cfg`:

    private_key_file = /PATH/TO/SSH/KEY/CONFIGURED/IN/DIGITALOCEAN/ACCOUNT
    vault_password_file = /PATH/TO/VAULT/PASSWORD.txt
    
Or add these command-line arguments to the commands:

    --key-file=/PATH/TO/SSH/KEY/CONFIGURED/IN/DIGITALOCEAN/ACCOUNT
    --vault-password-file=/PATH/TO/VAULT/PASSWORD.txt

### All-in-one command

    $ source .venv-digitalocean/bin/activate
    $ cd ansible/playbooks/
    $ ansible-playbook full-redeploy.yaml 

### Step-by-step commands

    $ source .venv-digitalocean/bin/activate
    $ cd ansible/playbooks/
    $ ansible-playbook build-new.yml 
    $ ansible-playbook backup-current.yml 
    $ ansible-playbook --extra-vars "build_id=GET_ID_FROM_PREVIOUS_COMMAND backup_id=GET_ID_FROM_PREVIOUS_COMMAND" deploy-new.yml 
    "msg": "build_id is 20210405181419-i69cdqtzZW. deploy_id is 20210405181941-blxkVWDdQ0. backup_id is 20210405181913-87eybfnI3j."

## Common tasks

### Reading credentials

    $ cd ansible/playbooks/
    $ ansible-vault view group_vars/all/vault

### Connecting to server

    $ ssh mikaelsvensson@minamarken.mikaelsvensson.info
    
Connection rejected because of changed ip address? No problem:
    
    $ ssh-keygen -R minamarken.mikaelsvensson.info

### Connecting to database

Connect to Droplet over SSH and the run this command (connects to "app" database as user "app"):

    $ psql -U app -h 127.0.0.1 app

### Download database backups

    $ scp mikaelsvensson@minamarken.mikaelsvensson.info:database-backups/* database-backups/
    
### Clear Liquibase change log lock

Connect to Droplet over SSH and do this:

    $ sudo -u postgres psql names
    names=# SELECT * FROM DATABASECHANGELOGLOCK;
    names=# UPDATE DATABASECHANGELOGLOCK SET LOCKED=false, LOCKGRANTED=null, LOCKEDBY=null WHERE ID=1;

## Using the Digital Ocean CLI

Installation: See https://github.com/digitalocean/doctl.

Set or test credentials:

    $ doctl auth init
    
List Droplet distributions:

    $ doctl compute image list-distribution
    
List Droplet sizes:

    $ doctl compute size list
    
List Droplet regions:

    $ doctl compute region list

## Helpful Links

Ansible

https://docs.ansible.com/ansible/2.5/modules/list_of_cloud_modules.html?highlight=digital_ocean

Let's Encrypt

https://certbot.eff.org/docs/using.html#certbot-command-line-options
https://ivanderevianko.com/2019/03/migrate-letsencrypt-certificates-certbot-to-new-server
https://community.letsencrypt.org/t/move-to-another-server/77985/5
https://community.letsencrypt.org/t/best-way-to-migrate-and-create-letsencrypt-certs-on-new-server/77311