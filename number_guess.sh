#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

GUESSING_GAME(){
  echo -e "\nGuess the secret number between 1 and 1000:"
  READ_NUMBER
  GUESSES=1
  while [[ $NUMBER -ne $RANDOM_NUMBER ]]; 
  do
    if [[ $NUMBER -lt $RANDOM_NUMBER ]]
    then
      READ_NUMBER "It's higher than that, guess again:"
    elif [[ $NUMBER -gt $RANDOM_NUMBER ]]
    then
      READ_NUMBER "It's lower than that, guess again:"
    fi
    GUESSES=$((GUESSES + 1))
  done
  # Add data to DB
  INSERT_GAMES=$($PSQL "INSERT INTO games(user_id,guesses) VALUES($USER_ID,$GUESSES)")
  echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
}

READ_NUMBER(){
  if [[ $1 ]]
  then 
    echo $1
  fi
  read NUMBER
  if [[ ! "$NUMBER" =~ ^-?[0-9]+$ ]]; 
  then
    READ_NUMBER "That is not an integer, guess again:"
  fi
}

echo -e "\nEnter your username:"
read USERNAME
# search user in the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  # add new user to the database
  INSERTED_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # show the stats of the player
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = '$USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = '$USER_ID'")
  printf "\nWelcome back, %s! You have played %d games, and your best game took %d guesses." "$USERNAME" "$GAMES_PLAYED" "$BEST_GAME"
fi

# Random number generation
RANDOM_NUMBER=$(($RANDOM % 1000 +1))
echo -e "\nThe secret number is: $RANDOM_NUMBER"
GUESSING_GAME


