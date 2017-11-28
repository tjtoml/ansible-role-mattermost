[![Build Status](https://travis-ci.org/tjtoml/ansible-role-mattermost.svg?branch=master)](https://travis-ci.org/tjtoml/ansible-role-mattermost) [![role](https://img.shields.io/badge/Galaxy-tjtoml.mattermost-5bbdbf.svg)](https://galaxy.ansible.com/tjtoml/mattermost/)
# tjtoml.mattermost
This is an ansible role that installs a standalone version of Mattermost, which is an open-source Slack alternative.
This playbook installs Mattermost version 4.4.2 (Team Edition) by default.

It downloads the binary from [mattermost.org](https://www.mattermost.org/download/). If you need to install the Enterprise
edition, consult the Mattermost documentation.

This role is compatible with:
- [x] Ubuntu 14.04.5 LTS, Trusty Tahr (DigitalOcean)
- [x] Ubuntu 16.04.3 LTS, Xenial Xerus (DigitalOcean)
- [x] CentOS 6.9  (DigitalOcean)
- [x] CentOS 7.4 (DigitalOcean)
- [x] Red Hat Enterprise Linux 6.9 (Santiago) (Installed from RedHat DVD on a Vultr VPS)
- [x] Red Hat Enterprise Linux 7.4 (Maipo) (Installed from RedHat DVD on a Vultr VPS)
- [x] Debian 7.11 Wheezy (DigitalOcean)
- [x] Debian 8.9 Jessie (DigitalOcean)
- [x] Debian 9.2 Stretch (DigitalOcean)

## Requirements
* FQDN configured: `mattermost.example.com`, `www.example.com`, etc.
* If you want to use letsencrypt, you will need reverse DNS configured. Check it for your server [here](https://www.whatismyip.com/reverse-dns-lookup/).
* Internet Access

## Role Variables
You can define any of the variables listed in mattermost's `config.json` file. There also several "high level" variables that you will probably want to set:
```
mattermost_version: 4.4.2
db_user: mmost
db_name: mattermost
db_password: notReallyASecurePassword
cert_email_address: abc@123.com
mattermost_user: mattermost
SSL_type: letsencrypt #letsencrypt, snakeoil, nossl
```
For a full list of available variables and their defaults, see `defaults/main.yml`.

## Dependencies
```
tjtoml.nginx
tjtoml.postgresql
tjtoml.letsencrypt
```
Run `ansible-galaxy install -r requirements.yml` from the project directory to install all dependencies.

## Example Playbook
```
---
- hosts: all
  remote_user: root
  gather_facts: no
  pre_tasks:
    - name: Install python (Only needed for Ubuntu 16 and up, but it doesn't hurt other distros)
      raw: test -e /usr/bin/python || (apt -y update && apt install -y python-minimal)
      changed_when: false
    - name: Gather Facts
      setup:
  roles:
    - { role: tjtoml.mattermost }
  vars:
    mattermost_version: 4.4.2
    db_user: mmost
    db_name: mattermost
    db_password: notReallyASecurePassword
    cert_email_address: abc@123.com
    mattermost_user: mattermost
    SSL_type: nossl
```

## License
BSD, MIT

## Author Information
Written by [tjtoml](https://github.com/tjtoml)

## Contributing
Please submit pull requests! They make my day.
