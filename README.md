# DogeSitter

## Authors
* Yejia Chen
* Christine Chen

## Purpose
This is an app that challenges users to multitask by playing rotating games with
doge.

## Features
* There are 3 minigames in which the user will play.
    * Balls will fall from the top of the screen, and the player must keep the
      balls from falling to the groud by tilting the iPhone right/left.
    * Doges will appear at the top of the screen and the player must throw the
      frisbee to the Doge by flicking the frisbee towards the Doge.
    * There will be Doges and Grumpy cats displayed on the screen and the player
      must avoid the Grumpy Cats by tapping the Doges in sight
* Show score and keep track of high scores

## Control Flow
* The user will choose "New Game" and then will move to the game screen.
* The first game will begin, and the user will play for a limited time
* After the initial time expires, another minigame will be rotated to the screen
* This rotation continues, with each cycle making each game more difficult
* The player loses if at any point if they lose in any of the minigames:
    1. A ball falls
    2. Frisbee misses dog
    3. Touch grumpy cat/run out of time moving forward
* Games get harder as player progresses
    1. More balls fall from the top of the screen
    2. Doge starts moving back and forth so the player must plan the frisbee
       throw accordingly
    3. Less time to pick the Doge tile
* When player loses, an alert pops up prompting the player to give information
for the high score board and then the screen goes to score/high score view

## Implementation

### Model
* Game1.swift
* Game2.swift
* Game3.swift

### View
* StartNewGameView
* GamesView
* ScoreBoardView

### Controller
* StartNewGameViewController
* GamesViewController
* ScoreBoardViewController
