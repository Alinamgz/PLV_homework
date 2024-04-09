#! /bin/bash

CONTAINERS=($1 $2)
IMAGES=($3)
NETWORKS=($4)

if [[ "$#" -ne 4 ]]; then
	echo "Usage:"
	echo "./cleanup.sh <container> <container> <image_name> <network_name> "
	echo

	exit
fi

echo -e "--------------------- Containers: ${CONTAINERS[@]} ---------------------\n";
echo -e "----- Stopped: ------";
sudo docker container stop ${CONTAINERS[@]}
echo -e "----- Removed: ------";
sudo docker container rm ${CONTAINERS[@]}
echo
sudo docker ps -a
echo -e "------------------------------------------------------------------------\n";

echo -e "------------------------- Images: ${IMAGES[@]} -------------------------";
sudo docker image rm ${IMAGES[@]}
echo
sudo docker images
echo -e "------------------------------------------------------------------------\n";

echo -e "----------------------- Networks: ${NETWORKS[@]} -----------------------\n";
sudo docker network rm ${NETWORKS[@]}
echo
sudo docker network ls
echo

echo "------------------------------------------------------------------------"
echo "--------------------------- Cleanup Done -------------------------------"
echo "------------------------------------------------------------------------"
