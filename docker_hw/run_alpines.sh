#! /bin/bash

IMAGE_NAME="my_alpine"

NETWORK_NAME="my_alpine_net"

SERVER_CNT_NAME="server"  # CNT stands for container
CLIENT_CNT_NAME="client"  # CNT stands for container

SRC_DIR_HOST="$PWD"
SRC_DIR_CNT="/src"      # CNT stands for container

echo -e "============================= Start =====================================\n"

echo -e "============================= Cleanup ===================================\n"
echo "./cleanup.sh $SERVER_CNT_NAME $CLIENT_CNT_NAME $IMAGE_NAME $NETWORK_NAME"
./cleanup.sh $SERVER_CNT_NAME $CLIENT_CNT_NAME $IMAGE_NAME $NETWORK_NAME

echo -e "\n================== building image $IMAGE_NAME =========================\n"
sudo docker build . -t $IMAGE_NAME
# echo; sudo docker images;
echo -e "\n================== creating network $NETWORK_NAME =====================\n"

sudo docker network create -d bridge $NETWORK_NAME; echo
# echo -e "\n=======================================================================\n"

echo -e "\n===================== running SERVER container ========================\n"
sudo docker run -dit \
	 --network $NETWORK_NAME \
	 --name $SERVER_CNT_NAME \
	 -v $SRC_DIR_HOST:$SRC_DIR_CNT \
	 -w $SRC_DIR_CNT \
	 -e PS1=$"\e[0;43m \e[1;30m @$SERVER_CNT_NAME: \e[0m \e[1;32m\w\e[0m$ " \
	 -e	CONTAINER_NAME="$SERVER_CNT_NAME"\
	 $IMAGE_NAME
echo -e "\n===================== running CLIENT container ========================\n"
sudo docker run -dit \
	 --network $NETWORK_NAME \
	 --name $CLIENT_CNT_NAME \
	 -v $SRC_DIR_HOST:$SRC_DIR_CNT \
	 -w $SRC_DIR_CNT \
	 -e PS1=$"\e[0;43m \e[1;30m @$CLIENT_CNT_NAME: \e[0m \e[1;32m\w\e[0m$ " \
	 -e CONTAINER_NAME="$CLIENT_CNT_NAME"\
	 $IMAGE_NAME
echo -e "\n=======================================================================\n"

echo -e "\n====================== Docker network ls: =============================\n"
sudo docker network ls

echo -e "\n====================== Docker images: =================================\n"
sudo docker images

echo -e "\n====================== Docker ps -a: ==================================\n"
sudo docker ps -a
echo -e "\n============================= Done ====================================\n"
