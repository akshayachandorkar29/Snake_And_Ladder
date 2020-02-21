#!/bin/bash -x

#declare -A randomCheck
echo "---WELCOME TO THE WORLD OF SNAKE AND LADDER SIMULATOR---"

#USE CASE 1
#constants
start_position=0
win_position=100

#variables
player1_position=$start_position
player2_position=$start_position
checkPlayer=1

#USE CASE 2
#Rolling a Dice
function die_roll()
{
	randomCheck=$(( RANDOM%6 + 1 ))
	#echo $randomCheck
	echo got $randomCheck when die rolled
	(( die_roll_count++ ))
}

#USE CASE 3
#random options
#option0=NoPLAY
#option1=LADDER
#option2=SNAKE

function random_option()
{
	option=$(( RANDOM%3 ))
	#echo $option
	echo got $option option

	case $option in
         0)
				if [[ $checkPlayer -eq 1 ]]
				then
            	player1_position=$player1_position
           		echo player1 position is $player1_position
					echo -----------------------------------------------------------------------------------------------------------------
				else
					player2_position=$player2_position
               echo player2 position is $player2_position
					echo -----------------------------------------------------------------------------------------------------------------
				fi
            ;;
         1)
				if [[ $checkPlayer -eq 1 ]]
				then
            	player1_position=$(( $player1_position + $randomCheck ))
            	if [[ $player1_position -gt $win_position ]]
            	then
               	player1_position=$(( $player1_position - $randomCheck ))
            	fi
            	echo player1 position is $player1_position
					echo -------------------------------------------------------------------------------------------------------------------
				else
					player2_position=$(( $player2_position + $randomCheck ))
               if [[ $player2_position -gt $win_position ]]
               then
                  player2_position=$(( $player2_position - $randomCheck ))
               fi
               echo player2 position is $player2_position
					echo -------------------------------------------------------------------------------------------------------------------
				fi
            ;;
			2)
				if [[ $checkPlayer -eq 1 ]]
				then
            	player1_position=$(( $player1_position - $randomCheck ))
            	if [[ $player1_position -lt $start_position ]]  #chekin if pos of player goes below start pos
            	then
               	player1_position=$start_position  #setting player position to 0
            	fi
					echo player1 position is $player1_position
					echo ------------------------------------------------------------------------------------------------------------------
				else
					player2_position=$(( $player2_position - $randomCheck ))
               if [[ $player2_position -lt $start_position ]]  #chekin if pos of player goes below start pos
               then
                  player2_position=$start_position  #setting player position to 0
               fi
               echo player2 position is $player2_position
					echo -------------------------------------------------------------------------------------------------------------------
				fi
            ;;
	esac
}

function player1()
{
	echo "Player 1's turn"
	die_roll
	random_option
}

function player2()
{
	echo "Player 2's turn"
	die_roll
	random_option
}

#USE CASE 4
function game()
{
	while [[ $player1_position -ne $win_position && $player2_position -ne $win_position ]]  #iterating till player wins
	do
		if [[ $checkPlayer -eq 1 ]]
		then
			player1
			checkPlayer=2
		elif [[ $checkPlayer -eq 2 ]]
		then
			player2
			checkPlayer=1
		fi
	done

}

#calling main function game
game

#printing dice count
echo $die_roll_count times dice rolled to get the position 100

#Printing WINNER of the SNAKE_AND_LADDER GAME
if [[ $checkPlayer -eq 1 ]]
then
	echo player 2 won
else
	echo player 1 won
fi
