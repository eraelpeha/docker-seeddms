# Information

This is a repository for the DMS seeddms (https://www.seeddms.org). It currently contains only the latest available version, which is not declared as stable (it's a beta-version) and therefore only suited for developer and not for production. Therefore it does not contain a `latest`-tag.

## Get it running

example command to get the container running on port 8080:

`docker run --name seeddms -p 8080:80 eraelpeha/seeddms:6.0.7-beta`

## Volumes

There are three paths you can mount:
- `-v data_volume:/var/www/seeddms/data`
- `-v conf_volume:/var/www/seeddms/conf`
- `-v ext_volume:/var/www/seeddms/www/ext`

## Additional information

This is my first approach to get an image running und hub.docker.com. The image is inspired by https://github.com/ludwigprager/docker-seeddms.

Feel free to add issues to this repo.

## not yet tested / implemented
- postgres-support