# Console game Hangman on Ruby

The game is written on Ruby version 2.7.1. To play it you need to install the gem [bundler](https://bundler.io/). 

To start the game, you need to do the following:
1. Download the archive with the program, unpack it, go to the folder hangman-master
2. In the console terminal, enter `bundle install` and wait until the installation of the required libraries is completed.
3. Start the game by typing `ruby main.rb`  

[![asciicast](https://asciinema.org/a/378242.svg)](https://asciinema.org/a/378242)

## Game rules
The game rules is described on [Wikipedia](https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D0%B5%D0%BB%D0%B8%D1%86%D0%B0_(%D0%B8%D0%B3%D1%80%D0%B0)) 
1. The console displays a random word from the "words.txt" file located in the "data" folder.
2. The user is given 7 attempts to guess the word.
3. The letters "E" and "Ë", as well as "N" and "Ń" are considered identical in pairs if a russian word guessed.

You can add or remove words for the game by editing the "words.txt" file, which is located in the "data" folder.

## Game feature

Now you can see nicely formatted colored output using the `gem 'colorize'` in Gemfile.
