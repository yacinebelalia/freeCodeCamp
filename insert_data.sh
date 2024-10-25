#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear existing data
$PSQL "TRUNCATE TABLE games, teams;"

# Read the CSV file and insert data
cat games.csv | while IFS=',' read YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header
  if [[ $YEAR != "year" ]]; then
    # Insert winner team into teams table if not exists
    WINNER_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER_NAME') ON CONFLICT(name) DO NOTHING RETURNING team_id; SELECT team_id FROM teams WHERE name='$WINNER_NAME';")
    
    # Insert opponent team into teams table if not exists
    OPPONENT_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT_NAME') ON CONFLICT(name) DO NOTHING RETURNING team_id; SELECT team_id FROM teams WHERE name='$OPPONENT_NAME';")
    
    # Insert game details into games table
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);"
  fi
done
