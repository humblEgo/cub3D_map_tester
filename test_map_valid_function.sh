#! /bin/bash

#../cub3D ./maps/map_no_texture.cub

CUB3D=../cub3D
MAPS_FOLDER=./maps/
LEAKS_FOLDER=leaks
LIBMLX_DYLIB=libmlx.dylib

MAIN_BG="\033[46;30m"
ALERT_BG="\033[41;4;30m"
SUCCESS_BG="\033[42;1;37m"
EXAMPLE_BG="\033[32m"
FAIL_BG="\033[41;5;11m"
END_BG="\033[41;5;30m"
CLEAR_COLOR="\033[m"

# Meaning of test_{blabla}
# R : Rendering size info		--> 8 tests
# W : Wall texture info			-->	7 tests
# FC : Floor and ceiling info	--> 13 tests
# MAP : Map factor info			--> 33 tests
# I : Item info 				--> 7 tests

TEST_COUNT=(8 7 13 33 7)
VALGRIND=false
ALL_LEAKS=false
RESULT=0
TEST_NB=68

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


if [ ! -e ${LIBMLX_DYLIB} ]
then
	echo "Does your program use dynamic mlx library? (y/n)"
	read answer
	if [ ${answer} == "y" ]
	then
		lib_paths=$(find .. -type f -name ${LIBMLX_DYLIB} | grep ${LIBMLX_DYLIB})
		if [ "${lib_paths}" ]
		then
			for lib_path in ${lib_paths}
			do
				echo "I'll copy your ${lib_path} to this directory."
				cp ${lib_path} .
			done
		else
			echo "Hmm? I can't find your mlx library.. Make sure the ${LIBMLX_DYLIB} exists properly!"
			exit 1
		fi
	fi
fi

echo "Do you have valgrind installed? (y/n)"
read answer
if [ ${answer} == "y" ]
then
	VALGRIND=true
	mkdir leaks
fi

if [ ${VALGRIND} == true ]
then
	echo "Set leaks strictness to the maximum? (y/n)"
	read answer
	if [ ${answer} == "y" ]
	then
		ALL_LEAKS=true
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
	for i in {5..0}
	do
		sleep 1
		echo "$i"
	done
fi

echo -e "--------TEST START--------"

launch_test()
{
	for i in `seq 1 $2`
	do
		TEST_MAP=test_$1${i}.cub
		echo -e "\n\t\t${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n"
		if [ ${VALGRIND} = true ]
		then
			valgrind --leak-check=full --show-leak-kinds=all --log-file="${LEAKS_FOLDER}/leaks_test_$1${i}.txt" ${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
			grep total ${LEAKS_FOLDER}/leaks_test_$1${i}.txt | cut -c 13-
			echo -e "\n${MAIN_BG}${TEST_MAP}${CLEAR_COLOR}\n" >> ${LEAKS_FOLDER}/all_test.txt
			grep total ${LEAKS_FOLDER}/leaks_test_$1${i}.txt | cut -c 13- >> ${LEAKS_FOLDER}/all_test.txt
		else
			${CUB3D} ${MAPS_FOLDER}${TEST_MAP}
		fi
		if [ ${ALL_LEAKS} = true ]
		then
			TOTAL_ALLOC=$(grep total ${LEAKS_FOLDER}/leaks_test_$1${i}.txt | cut -d ' ' -f 7)
			TOTAL_FREE=$(grep total ${LEAKS_FOLDER}/leaks_test_$1${i}.txt | cut -d ' ' -f 9)
			if [ $? ]
				then
					if [ ${TOTAL_ALLOC} == ${TOTAL_FREE} ]
					then
						echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
						RESULT=$(($RESULT+1))
					else
						echo -e "\n${FAIL_BG}-->LEAKS${CLEAR_COLOR}"
					fi
			fi
		else
			if [ $? ]
				then
					echo -e "\n${SUCCESS_BG}-->PASS${CLEAR_COLOR}"
					RESULT=$(($RESULT+1))
				else
					echo -e "\n${FAIL_BG}-->FAIL${CLEAR_COLOR}"
			fi
		fi
	done
}

launch_test "R" ${TEST_COUNT[0]}
launch_test "W" ${TEST_COUNT[1]}
launch_test "FC" ${TEST_COUNT[2]}
launch_test "MAP" ${TEST_COUNT[3]}
launch_test "I" ${TEST_COUNT[4]}

if [ ${RESULT} -eq ${TEST_NB} ]
then
	echo -e "\n${SUCCESS_BG}$RESULT/$TEST_NB You passed all tests${CLEAR_COLOR}"
else
	echo -e "\n${FAIL_BG}$RESULT/$TEST_NB$ You failed some tests{CLEAR_COLOR}"
fi
echo -e "\n--------TEST END--------\n"
echo -e "${END_BG}please check return messages of your program!${CLEAR_COLOR}\n"
echo -e "If you want to skip count down next time, put command like below!"
echo -e "${EXAMPLE_BG}./test_map_valid_function.sh -f${CLEAR_COLOR}\n"

echo -e "If you want to see coverage of test cases, contact link below"
echo -e "${EXAMPLE_BG}https://github.com/humblEgo/cub3D_map_tester${CLEAR_COLOR}\n"
echo -e "or simply send slack DM to 'iwoo' :)\n"
