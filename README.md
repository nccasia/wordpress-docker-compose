
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Deploy Wordpress on Localhost and in Production using Docker Compose

Related blog post:

  - [WordPress Local Development Using Docker
    Compose](https://www.datanovia.com/en/lessons/wordpress-local-development-using-docker-compose/):
    Deploy Wordpress on localhost using docker
  - [Docker WordPress Production
    Deployment](https://www.datanovia.com/en/lessons/docker-wordpress-production-deployment/):
    Step-by-step guide to deploy WordPress online using docker-compose
  - [Using Docker WordPress Cli to Manage WordPress
    Websites](https://www.datanovia.com/en/lessons/using-docker-wordpress-cli-to-manage-wordpress-websites/):
    Commande line interface for managing a WordPress website

The installation tool kit, provided here, include:

  - Nginx web server
  - MariaDB/MySQL used for Wordpress database
  - phpMyAdmin interface to connect to your MySQL database
  - WP-Cli: Wordpress Command Line Interface
  - Makefile directives for automatization.

You can automatically deploy a local docker wordpress site in 5 minutes
using the following commands:

``` bash
# Download a wordpress docker-compose example
git clone https://github.com/nccasia/wordpress-docker-compose
cd wordpress-docker-compose
# Build and start installation
docker-compose up -d --build
```

Visit your site at <http://localhost> and your database via phpMyAdmin
at <http://localhost:8080>.

Default identification for your wordpress website admin:

  - `Username: wordpress` and
  - `Password: wordpress`

Default identification for the phpMyAdmin interface:

  - `Username: root` and
  - `Password: password`

**Useful set of commands to know**:

``` bash
# Stop and remove containers
docker-compose down
# Build, and start the wordpress website
docker-compose up -d --build
# Reset everything
docker-compose down
rm -rf certs/* certs-data/* logs/nginx/* mysql/* wordpress/*
```

## Deploy WordPress in Production

1. prepare your server
- install docker and docker-compose

2. clone this repository
``` bash
git clone https://github.com/nccasia/wordpress-docker-compose
cd wordpress-docker-compose
```

3. create a .env file

modify the `setup-onlinehost.sh` file

```
user_name="wordpress"
pass_word="wordpress"   # no special chars
email="your-email@example.com"
website_title="My Blog"
expose_port=80
website_url="https://www.example.com"
phmyadmin_url="sql.example.com"
backup_aws_s3_key="example"
backup_aws_s3_secret="example"
backup_aws_s3_bucket="example"
```
4. run the script
``` bash
sudo chmod +x setup-onlinehost.sh
./setup-onlinehost.sh
```

5. build and start the wordpress website
``` bash
make autoinstall
``` 

6. visit your site

## Backup and Restore
### Backup
``` bash
make backup
```

### Restore
- list all backups

``` bash
make snaps
```

- restore from a backup

``` bash
make restore file=2020-05-20_12-00-00.tar.gz
```
## References

  - [WordPress: with Nginx web server in
    Docker](https://github.com/mjstealey/wordpress-nginx-docker)
  - [Quickstart: Compose and
    WordPress](https://docs.docker.com/compose/wordpress/)
