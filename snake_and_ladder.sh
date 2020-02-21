\#!/bin/bash -x

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
	dice=$(( RANDOM%6 + 1 ))
	echo $dice
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
				;;
			1)
				player_position=$(( $player_position + $(die_roll) ))
				if [[ $player_position -gt  $win_position ]]  #checking if position of player exceeds win position
				then
					player_position=$win_position  #setting player position to 100
				fi
				;;
			2)
				player_position=$(( $player_position - $(die_roll) ))
				if [[ $player_position -lt $start_position ]]  #chekin if pos of player goes below start pos
				then
					player_position=$start_position	#setting player position to 0
				fi
				;;
			*)
				echo "Invalid Option"
				;;
		esac
	done

	echo $player_position
}



