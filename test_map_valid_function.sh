#! /bin/bash

#../cub3D ./maps/map_no_texture.cub

CUB3D=../cub3D
MAPS_FOLDER=./maps/

MAIN_BG="\033[46;30m"
ALERT_BG="\033[41;4;30m"
SUCCESS_BG="\033[42;1;37m"
EXAMPLE_BG="\033[32m"
FAIL_BG="\033[41;5;11m"
END_BG="\033[41;5;30m"
CLEAR_COLOR="\033[m"

# Meaning of test_{blabla}
# R : Rendering size info
# W : Wall texture info
# FC : Floor and ceiling info
# MAP : Map factor info
# I : Item info


TEST_R_COUNT=8
TEST_W_COUNT=7
TEST_FC_COUNT=13
TEST_MAP_COUNT=33
TEST_I_COUNT=7

if [ $# -gt 1 ]
then
	echo -e "${ALERT_BG}Not valid arguments${CLEAR_COLOR}"
	exit 1
elif [ $# -eq 1 ]
then
	if [ $1 != "-f" ]
	then
		echo -e "This shellscript only have '-f' option now."
		echo -e "'-f' option let skip count down before test start."
		echo -e "If you want to skip count down, put command like below"
		echo -e "${EXAMPLE_BG}./test_map_valid_function.sh -f${CLEAR_COLOR}"
		exit 1
	fi
fi


if [ ! -e ${CUB3D} ]
then
	echo -e "\n\t\t${ALERT_BG}Please check if the cub3D file exists in the parent directory${CLEAR_COLOR}"
	exit 1
else
	echo -e "\n\t\t${MAIN_BG}cub3D file exists${CLEAR_COLOR}"
fi

echo -e "\n${ALERT_BG}There are not valid maps for test.${CLEAR_COLOR} During testing, Your program should be shut down ${ALERT_BG}safely${CLEAR_COLOR}.\n"
echo -e "If your program makes a window and put any image, your program is not handilng that map exception.\n"
echo -e "If your program returns unexpected error messages, such as segfault, abort, etc..,\n" 
echo -e "your program is not handilng that map exception too.\n"
echo -e "So ${ALERT_BG}please check return messages of your program! :)${CLEAR_COLOR}\n\n"

if [ $# -eq 1 ] && [ $1 == "-f" ]
then
	echo "Skip count down"
else
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
fi

echo -e "--------TEST START--------"

for i in `seq 1 ${TEST_R_COUNT}`
do
	TEST_MAP=test_R${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_W_COUNT}`
do
	TEST_MAP=test_W${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_FC_COUNT}`
do
	TEST_MAP=test_FC${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_MAP_COUNT}`
do
	TEST_MAP=test_MAP${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

for i in `seq 1 ${TEST_I_COUNT}`
do
	TEST_MAP=test_I${i}.cub
	echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
	${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
	if [ $? ]
	then
		echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
	else
		echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
	fi
done

echo -e "\n--------TEST END--------\n"
echo -e "${END_BG}please check return messages of your program!${CLEAR_COLOR}\n"
echo -e "If you want to skip count down next time, put command like below!"
echo -e "${EXAMPLE_BG}./test_map_valid_function.sh -f${CLEAR_COLOR}\n"

echo -e "If you want to see coverage of test cases, contact link below"
echo -e "${EXAMPLE_BG}https://github.com/humblEgo/cub3D_map_tester${CLEAR_COLOR}\n"
echo -e "or simply send slack DM to 'iwoo' :)\n"
