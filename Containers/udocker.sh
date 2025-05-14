###################### INSTALL UDOCKER AS A USER ################# 
wget https://github.com/indigo-dc/udocker/releases/download/1.3.17/udocker-1.3.17.tar.gz
tar zxvf udocker-1.3.17.tar.gz
export PATH=`pwd`/udocker-1.3.17/udocker:$PATH
udocker install
#############################

######### PULL A DOCKERHUB IMAGE ##########
udocker pull dcesini/hpqc_2025:ubuntu_with_fortune_5.0
udocker images
#######################

######## RUN THE CONTAINER from that image ###############

udocker run dcesini/hpqc_2025:ubuntu_with_fortune_5.0
