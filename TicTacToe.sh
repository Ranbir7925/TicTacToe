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
function tossToPlay() {
        if [ $((RANDOM%2)) -eq 0 ]
        then
                echo "Player will play first."
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
                echo "Computer will play first."
        fi
}

resettingBoard
displayBoard
tossToPlay
