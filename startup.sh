#!/bin/bash
if docker info | grep -q 'daemon'; then
   echo 'please start your docker daemon first...'
fi
while docker info | grep -q 'daemon';
do
	echo 'wating your docker daemon start...'
    sleep 3
done
cd ~/Desktop && /usr/local/bin/docker run -d --rm -h pwndocker --name pwndocker -v $(pwd)/pwndocker:/ctf/work -p 23946:23946 --cap-add=SYS_PTRACE skysider/pwndocker
clear;docker exec -it pwndocker /bin/bash
docker stop pwndocker
exit 0
