#! /bin/bash

#../cub3D ./maps/map_no_texture.cub

CUB3D=../cub3D
MAPS_FOLDER=./maps/

MAIN_BG="\033[46;30m"
ALERT_BG="\033[41;4;30m"
SUCCESS_BG="\033[42;1;37m"
FAIL_BG="\033[41;5;11m"
CLEAR_COLOR="\033[m"

TEST_R_COUNT=9
TEST_W_COUNT=9
TEST_F_COUNT=5
TEST_MAP_COUNT=12

if [ ! -e ${CUB3D} ]
then
	echo -e "\t\t${ALERT_BG}Please check if the cub3D file exists in the parent directory${CLEAR_COLOR}"
	exit 1
else
	echo -e "\n\t\t${MAIN_BG}cub3D file exists${CLEAR_COLOR}"
fi

echo -e "\nThere are not valid maps for test. During testing, Your program should be shut down safely.\n"
echo -e "If your program makes a window and put any image, your program is not handilng that map exception.\n"
echo -e "If your program returns unexpected error messages such as segfault, abort, etc..\n" 
echo -e "your program is not handilng that map exception too.\n"
echo -e "So ${ALERT_BG}please check return messages of your program!${CLEAR_COLOR}\n\n"


sleep 1
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

echo -e "--------TEST START--------"

for i in `seq 1 ${TEST_R_COUNT}`
do
	TEST_MAP=test_R${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	echo "${CUB3D} ${MAPS_FOLDER}${TEST_MAP}"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->SUCCESS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_W_COUNT}`
do
	TEST_MAP=test_W${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	echo "${CUB3D} ${MAPS_FOLDER}${TEST_MAP}"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->SUCCESS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_F_COUNT}`
do
	TEST_MAP=test_F${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	echo "${CUB3D} ${MAPS_FOLDER}${TEST_MAP}"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->SUCCESS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_MAP_COUNT}`
do
	TEST_MAP=test_MAP${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	echo "${CUB3D} ${MAPS_FOLDER}${TEST_MAP}"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->SUCCESS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done
