#!/bin/bash
echo "Weclcome to the tic-tac-toe game"

#variable
computerLetter=X

#array declaration of array
declare -a board

#Function to reset the board
function resettingBoard()
{
	board=(. . . . . . . . . .)
}

#Function to display  board
function displayBoard()
{
	echo "***TicTacToe Board***"
	echo "|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |"
	echo "|  ${board[4]}  ||  ${board[5]}  ||  ${board[6]}  |"
	echo "|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"
	echo "**********************"
}


#Function to tossTheCoin
function tossToPlay() 
{
	echo "Tossing Coin....!!"
	if [ $((RANDOM%2)) -eq 0 ]
	then
		echo -e "Player won toss."
		read -p "choose your letter X or O : " letter

		if [[ $letter == $computerLetter ]]
		then
			playerLetter=$letter
			computerLetter=O
			echo "player letter : $playerLetter"
			echo "computer letter : $computerLetter"
		else
			playerLetter=$letter
			computerLetter=X
			echo "player letter : $playerLetter"
			echo "computer letter : $computerLetter"
		fi

	else
		echo -e "Computer won toss\nComputer will play first."
	fi
}


function switchPlayer()
{
	echo "Player Letter: $playerLetter"
	echo "Computer Letter: $computerLetter"
	if [[ $switchPlayer == 0 ]]
	then
		playerPlaying
	else
		computerPlaying
	fi
}


function playerPlaying()
{
	echo "PLayer turn: "
	read -p "Enter Position between 1 to 9: " position
	board[$position]=$playerLetter
	switchPlayer=1
}
resettingBoard
tossToPlay
displayBoard
switchPlayer
displayBoard
