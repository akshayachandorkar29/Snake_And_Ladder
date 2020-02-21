#!/bin/bash -x

#declare -A randomCheck
echo "---WELCOME TO THE WORLD OF SNAKE AND LADDER SIMULATOR---"

#USE CASE 1
#taking user input
read -p "Enter Username: " username
echo Welcome $username

#constants
player_position=0
start_position=0
win_position=100

#USE CASE 2
#Rolling a Dice
function die_roll()
{
	randomCheck=$(( RANDOM%6 + 1 ))
	echo $randomCheck
	(( die_roll_count++ ))
}

#USE CASE 3
#random options
function random_option()
{
	option=$(( RANDOM%3 ))
	echo $option
}

#option 0 = No PLAY
#option 1 = LADDER
#option 2 = SNAKE
#changing position according to option value

#USE CASE 4
function decide_player_position()
{
	while [[ $player_position -ne $win_position ]]  #iterating till player wins
	do
		case $(random_option) in
			0)
				player_position=$player_position
				echo player position is jhfj $player_position
				;;
			1)
				die_roll
				player_position=$(( $player_position + $randomCheck ))
				if [[ $player_position -gt $win_position ]]
				then
					player_position=$(( $player_position - $randomCheck ))
				fi
				echo jdfahjfh $player_position

#				if [[ $player_position -gt  $win_position ]]  #checking if position of player exceeds win position
#				then
#					player_position=$win_position  #setting player position to 100
#				fi
				;;
			2)	die_roll
				player_position=$(( $player_position - $randomCheck ))
				if [[ $player_position -lt $start_position ]]  #chekin if pos of player goes below start pos
				then
					player_position=$start_position	#setting player position to 0
				fi
				;;
		esac
	done

	echo final player position $player_position
}

echo $die_roll_count
