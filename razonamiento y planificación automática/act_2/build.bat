set OLDDIR=%CD%
docker build -t image_with_singularity .
docker run  --privileged -v %OLDDIR%:/usr/local/actividad3 -it -u root  --rm image_with_singularity
docker image prune -f
docker rmi image_with_singularity