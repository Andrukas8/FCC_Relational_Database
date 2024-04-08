#! /bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do

  if [[ $YEAR != "year" ]]; then
    # get name from winner
    NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $NAME ]]; then
      # insert name from winner
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]; then
        echo Inserted into teams, $WINNER
      fi
      # get new name winner
      NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    fi

    # get name from opponent
    NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $NAME ]]; then
      # insert name from opponent
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]; then
        echo Inserted into teams, $OPPONENT
      fi
      # get new name opponent
      NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")    
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")   

    #insert game rows
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]; then
      echo Inserted into games, $YEAR $ROUND
    fi

  fi

done
