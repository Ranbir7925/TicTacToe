#!/bin/bash
echo "Weclcome to the tic-tac-toe game"

#array declaration of array
declare -a board
board=(. . . . . . . . . .)

#Function to reset the board
function resettingBoard()
{
	echo "***TicTacToe Board***"
	echo "|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |"
	echo "|  ${board[4]}  ||  ${board[5]}  ||  ${board[6]}  |"
	echo "|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"
	echo "**********************"
}

function tossToPlay()
{
	echo "Tossing coin....."
	read -p "Press 1:HEADS or 2:TAILS: " choice
	toss=$((RANDOM%2+1))
	if (( $toss == $choice ))
	then
		echo "You won the toss You will play 1st"
	else
		echo "You lost the toss Computer will play 1st"
	fi
}
resettingBoard
tossToPlay
