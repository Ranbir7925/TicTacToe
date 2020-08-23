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
 resettingBoard
