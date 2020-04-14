#!/bin/bash

image="craftassist"
shell="/bin/bash"
default_flags="-p 25565:25565 -e CRAFTASSIST_NO_UPLOAD=1 "

target_script=$1
docker_run_flags=${@:2}

b64=`gzip -c ${target_script} | base64`
#echo $b64
# output=`echo "${b64}" |  base64 --decode | gunzip -c`
#echo $output

docker run -t -e RUN_SH_GZ_B64=${b64} ${default_flags} ${docker_run_flags} ${image} ${shell}




