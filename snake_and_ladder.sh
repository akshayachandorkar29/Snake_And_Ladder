#!/bin/bash -x

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

#option 1 = No PLAY
#option 2 = LADDER
#option 3 = SNAKE
#changing position according to option value
case $(random_option) in
	0)
		player_position=$player_position
		;;
	1)
		player_position=$(( $player_position + $(die_roll) ))
		;;
	2)
		player_position=$(( $player_position - $(die_roll) ))
		;;
	*)
		echo "Invalid Option"
		;;
esac

