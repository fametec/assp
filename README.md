
# What is ASSP?

The Anti-Spam SMTP Proxy (ASSP) Server project aims to create an open source platform-independent SMTP Proxy server which implements auto-whitelists, self learning Hidden-Markov-Model and/or Bayesian, Greylisting, DNSBL, DNSWL, URIBL, SPF, SRS, Backscatter, Virus scanning, attachment blocking, Senderbase and multiple other filter methods. 


## Features

    Multiple Weighted DNSBLs
    Multiple Weighted URIBLs
    Greylisting
    Weighted Regular Expression Filtering
    Bayesian
    Penalty Box
    SenderBase
    SSL/TLS
    SPF/SRS
    Attachment Blocking
    ClamAV and FileScan
    Blocking Reporting
    LDAP support
    Backscatter Detection
    recipient replacement / GUI user access rights management
    MIME charset conversion / DKIM check and signing
    multi DB support for all hashes / level based open plugin support
    transparent TCP proxy support
    Plugins: archive, full attachment check and replacement, OCR
    damping (steal spammers time)
    AUTH to relay host / POP3 collector
    configuration value and file synchronization
    Block Reports design could be customized
    Razor2 and DCC support using Plugin
    SNMP support (monitoring, configuring, controll-API)
    user group import (file or LDAP or command based)
    automatic crash analyzer Hidden Markov Model
    IPv6 socket support
    word stemming (several languages) for Bayesian analyzer
    Perl module autoupdate via PPM or CPAN
    Hidden Markov Model spam detection engine
    full unicode support
    DMARC support
    privat Whitelist (legacy, domain based, user based)
    privat IP and Domain lists (legacy, domain based, user based)
    CPU affinity settings
    web file commander
    graphical statistic output (SVG)
    native SSL support for target hosts
    client SSL-certificate validation
    privat SMIME signing
    corporate SMIME signing, using a single privat certificate
    content based executable attachment blocking
    content based compressed attachment blocking
    BATV check and signing
    Message-ID signing and check FBMTV
    remote support
    Authenticated Received Chain (ARC) processing and signing
    RSS feeds for blocked emails using Plugin
    zero day virus detection
    VirusTotal API

https://sourceforge.net/projects/assp/ 


# How to use this image

## start a ASSP instance

### MariaDB

    docker run -d --rm --name mariadb -e MYSQL_DATABASE=assp -e MYSQL_USER=assp -e MYSQL_PASSWORD=4aae4012 -e MYSQL_RANDOM_ROOT_PASSWORD=1 -p 3306:3306 docker.io/mariadb

### ASSP

    docker run -d --rm --name assp -p 25:25 -p 587:587 -p 465:465 -p 2525:2525 -p 55555:55555 --link mariadb:mariadb fametec/assp


## ... or docker-compose.yaml


    version: '3.2'
    #
    ### Services
    #
    services:
    #
    # ASSP
    #
      assp:
        image: fametec/assp:latest
        restart: unless-stopped
        container_name: assp
        ports:
          - "25:25"
          - "587:587"
          - "465:465"
          - "2525:2525"
          - "55555:55555"
        volumes:
          - assp-volume:/var/db/assp/:rw
        depends_on: 
          - db
    #
    # MYSQL
    #
      db: 
        image: docker.io/mariadb:latest
        restart: unless-stopped
        volumes: 
          - assp-db-volume:/var/www/mysql:rw
        environment: 
          MYSQL_DATABASE: assp
          MYSQL_USER: assp
          MYSQL_PASSWORD: 4aae40121f24c0e9a8ebc1a78d4da966 
          MYSQL_RANDOM_ROOT_PASSWORD: 1 
        ports: 
          - "3306:3306"


    volumes: 
      assp-volume:
      assp-db-volume:



## Login

URL: http://<ip_address>:55555

User: root

Password: nospam4me

## Support

contato@fametec.com.br

## e-Learning

https://www.fametreinamentos.com.br



