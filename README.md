# hello-devops

    - This deploy an stack on an Virtual Machine or EC2 Instance
    - Optional configurations files for support AMI, EC2 and Debian Linux. 

## Usage
    - ansible: hello-devops deploy playbook
    - create_database.sql: sql script to create de database
    - docker-compose.yaml: App stack docker compose
    - hello-node: Nodejs rabbitmq consumer
    - hello-python: Producer rabbitmq
    - instance-dep.sh: Server sh script to deploy solution dependences(Optional)
    - packer: packer json to create an AMI with the solution dependences(Optional)
    - terraform: HCL scripts to deploy an simple EC2 Instance(Optional)

# Requirements

#### User host
    - Ansible 2.0+
    - Terraform 0.11+
    - Packer 1.5+

#### AWS EC2 host or Virtual Machine   
    - debian10+
    - ssh
    - sudo
    - python3
    - python3-apt
    - apt

# Deploy
To deploy de solution:

1. edit the ansible inventory:
    ```console
      # add server host IP or EC2 public DNS
      [server_name]
      192.168.0.13
    ```
1. execute the ansible:
    ```console
    # substitute USER_LOGIN_NAME for the OS user(must be sudo)
    $ ansible-playbook ansible/deploy.yml -i ansible/inventory -b -K -u USER_LOGIN_NAME
    ```
