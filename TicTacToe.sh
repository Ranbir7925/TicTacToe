#!/bin/bash
echo "Weclcome to the tic-tac-toe game"


#constant
TOTAL_CELL=9


#variable
count=0
switchPlayer=1
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
		switchPlayer=0
		echo -e "Player won toss."
		read -p "choose your letter X or O : " letter

		if [[ $letter == $computerLetter ]]
		then
			playerLetter=$letter
			computerLetter=O
		else
			playerLetter=$letter
			computerLetter=X
		fi

	else
		echo -e "Computer won toss\nComputer will play first."
	fi
}


#Funtion to play computer move
function computerPlaying()
{
	echo "========================="
	echo "Computer Turn:"
	computerPlayingToWin
	computerPlayingToBlock
	if [[ $block == 0 ]]
	then
		takeAvailableCorners
	fi
	switchPlayer=0
	displayBoard
}


#Function toswitch between Player and Computer Move
function switchPlayer()
{
	if [[ $switchPlayer == 0 ]]
	then
		playerPlaying
	else
		computerPlaying
	fi
	winningCondition $turnChange
}


#Function for Player playing game
function playerPlaying()
{
	echo "==========================="
	echo "PLayer turn: "
	displayBoard
	echo "Player Letter : $playerLetter"
	echo "Computer Letter : $computerLetter"
	read -p "Enter Position between 1 to 9: " position
	turnChange=$playerLetter
	checkingEmptyCell
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
	else
		echo "Invalid cell Value...!!!"
		switchPlayer
	fi
}


#Function checking winning conditions
function winningCondition()
{
	for(( i=1;i<=$TOTAL_CELL;i=$(($i+3)) ))
	do
		#To check winning condition for row
		if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} == $1 ]]
		then
			winner=1
		fi
	done
	for((i=1;i<=3;i++))
	do
		#To check winning condition for columns
		if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} == $1 ]]
		then
			winner=1
		fi
	done
	#To check winning condition for Diagonal
	if [[ ${board[1]} == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} == $1 ]]
	then
		winner=1
	#To check winning condition for columns
	elif [[ ${board[3]} == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} == $1 ]]
	then
		winner=1
	fi

}


#Function computer playing to win
function computerPlayingToWin()
{
	for((j=1;j<=$TOTAL_CELL;j++))
	do
		if [[ ${board[$j]} == . ]]
		then
			board[$j]=$computerLetter
			winningCondition $computerLetter
			if [[ $winner -eq 1 ]]
			then
				displayBoard
				echo "Winner is Computer"
				exit
			else
				board[$j]="."
				block=0
			fi
		fi
	done
}


#Function computer will play to block the player from getting win
function computerPlayingToBlock() 
{
	for((k=1;k<=$TOTAL_CELL;k++))
	do
		if [[ ${board[$k]} == . ]]
		then
			board[$k]=$playerLetter
			winningCondition $playerLetter
			if [[ $winner -eq 1 ]]
			then
				board[$k]=$computerLetter
				winner=0
				((count++))
				displayBoard
				break
			else
				board[$k]="."
			fi
		fi
	done
}


#Function checking for availavblecorners
function takeAvailableCorners()
{
	for((l=1;l<=$TOTAL_CELL;l=$l+2))
	do
		if [[ $l == 5 ]]
		then
			l=$(($l+2))
		fi

		if [[ ${board[$l]} == . ]]
		then
			board[$l]=$computerLetter
			local center=1
			((count++))
			break
		fi
	done
	takeCenter
}


#Function checking for availavble center
function takeCenter()
{
	if [[ $center -ne 1 ]]
	then
		local middle=$(($TOTAL_CELL+1))/2
		if [[  ${board[$middle]} == . ]]
		then
			board[$middle]=$computerLetter
			((count++))
		else
			takeAvailableSides
		fi
	fi
}


#Function checking Win/Tie
function checkingGameStatus()
{
	if [[ $winner -eq 1 ]]
	then
		displayBoard
		echo "Winner is Player who's Letter was:$turnChange"
		exit
	elif [[ $count -ge $TOTAL_CELL ]]
	then
		echo "============================="
		displayBoard
		echo "TIE...!!"
	fi
}

resettingBoard
tossToPlay

while [[ $count -ne $TOTAL_CELL ]]
do
	switchPlayer
	checkingGameStatus
done
