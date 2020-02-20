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

#Rolling a Dice
function die_roll()
{
	dice=$(( RANDOM%6 + 1 ))
	echo $dice
}
