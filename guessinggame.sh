#!/bin/bash

# Function to get the number of files in the current directory
get_file_count() {
  echo $(ls -1 | wc -l) # Count the number of files and directories
}

# Welcome message
echo "Welcome to the Guessing Game!"

# Get the correct number of files
correct_count=$(get_file_count)

# Loop until the user guesses correctly
while true; do
  echo -n "How many files are in the current directory? Enter your guess: "
  read user_guess

  # Validate input (ensure it's a number)
  if ! [[ $user_guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  if [[ $user_guess -lt $correct_count ]]; then
    echo "Too low. Try again."
  elif [[ $user_guess -gt $correct_count ]]; then
    echo "Too high. Try again."
  else
    echo "Congratulations! You guessed it right!"
    break
  fi
done
