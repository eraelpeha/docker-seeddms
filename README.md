# Information

This is a repository for the DMS seeddms (https://www.seeddms.org). It contains the latest available version 6.0.7.

## Quickstart

Get the container running on port 8080 with the command:

`docker run --name seeddms -p 8080:80 eraelpeha/seeddms`

There is also a docker-compose file if you want to run it with a postgresql-database.

## Volumes

There are three paths you can mount:
- `-v data_volume:/var/www/seeddms/data`
- `-v conf_volume:/var/www/seeddms/conf`
- `-v ext_volume:/var/www/seeddms/www/ext`

## Additional information

**Contribute**: If you want to contribute to seeddms, you can do it in the official repository maintained by Uwe Steinmann: https://sourceforge.net/projects/seeddms/.

**Inpired**: This image is inspired by https://github.com/ludwigprager/docker-seeddms.

**Issues**: Feel free to add issues to the repository on github: https://github.com/eraelpeha/docker-seeddms