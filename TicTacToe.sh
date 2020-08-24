#!/bin/bash
echo "Weclcome to the tic-tac-toe game"


#constant
TOTAL_CELL=9


#variable
count=0
switchPlayer=0
playerLetter=O
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


#Function toswitch between Player and Computer Move
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


#Function for Player playing game
function playerPlaying()
{
	echo "PLayer turn: "
	read -p "Enter Position between 1 to 9: " position
	board[$position]=$playerLetter
	switchPlayer=1
}


#Function for checking empty postion on tic tac toe board
function checkingEmptyCell()
{
	if [[ $position -ge 1 && $position -le 9 ]]
	then
		if [[ ${board[$position]} == . ]]
		then
			echo ".............$turnChange is placed at $position..............."
			(( count++ ))
		else
			echo "Cell is alread occupied...!!!"
			switchPlayer
		fi
	fi
}


#Function checking winning conditions
function winningCondition()
{
	for(( i=1;i<=$TOTAL_CELL;i=$(($i+3)) ))
	do
		#To check winning condition for row
		if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} != "." ]]
		then
			winner=1
		fi
	done
	for((i=1;i<=3;i++))
	do
		#To check winning condition for columns
		if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} != "." ]]
		then
			winner=1
		fi
	done
	#To check winning condition for Diagonal
	if [[ ${board[1]} == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} != "." ]]
	then
		winner=1
	#To check winning condition for columns
	elif [[ ${board[3]} == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} != "." ]]
	then
		winner=1
	fi

}


#Function checking Win/Tie
function checkingGameStatus()
{
	if [[ $winner -eq 1 ]]
	then
		echo "Winner is $turnChnage"
		exit
	elif [[ $count -ge $TOTAL_CELL ]]
	then
		echo "TIE...!!"
	fi
}



resettingBoard
tossToPlay
displayBoard
switchPlayer
displayBoard
checkingGameStatus
