##### Launch an ubuntu container
docker run -i -t ubuntu /bin/bash
#---from inside the container
apt-get update
apt-get install fortunes
apt-get install cowsay
apt-get install lolcat
export PATH=/usr/games/:$PATH
fortune | cowsay | lolcat
######  -------------  exit the contair

docker ps -a
docker commit ef048ccf6bd0  ubuntu_with_fortune
docker tag ubuntu_with_fortune dcesini/hpqc_2025:ubuntu_with_fortune_1.0
docker push dcesini/hpqc_2025:ubuntu_with_fortune_1.0

docker run  -e PATH=/usr/games/:${PATH} -e LC_ALL=C  dcesini/hpqc_2025:ubuntu_with_fortune_1.0 /bin/bash -c 'fortune | cowsay | lolcat'

#### Alternatively you can use a Dockerfile

cat Dockerfile
#################################
FROM ubuntu

RUN apt-get update && apt-get install -y fortunes cowsay lolcat

ENV PATH=/usr/games:${PATH}
ENV LC_ALL=C

ENTRYPOINT fortune | cowsay | lolcat

###############################


docker build -t ubuntu_with_fortune4 .
docker run  ubuntu_with_fortune4 /bin/bash -c 'fortune | cowsay | lolcat'
# OR SIMPLY

docker run  ubuntu_with_fortune4

#######################

# LOGIN TO LEONARDO

singularity pull docker://dcesini/hpqc_2025:ubuntu_with_fortune_5.0
ls *.sif
singularity run hpqc_2025_ubuntu_with_fortune_5.0.sif
