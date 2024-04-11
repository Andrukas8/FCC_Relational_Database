#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# check if user is in database
PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME';")

if [[ -z $PLAYER_ID ]]; then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  ADD_PLAYER_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME');")
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME';")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id=$PLAYER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE player_id=$PLAYER_ID;")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

NUMBER=$(($RANDOM % 1000))
GUESSES=0
GUESSED=false

echo "Guess the secret number between 1 and 1000:"

while [[ $GUESSED == false ]]; do
  read GUESS
  ((GUESSES++))
  if [[ $((GUESS)) != $GUESS ]]; then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS > $NUMBER ]]; then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS < $NUMBER ]]; then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player_id, guesses) VALUES($PLAYER_ID, $GUESSES);")
      GUESSED=true
    fi
  fi
done
