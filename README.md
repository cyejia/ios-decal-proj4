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
      balls from falling to the bottom of the screen for a duration of time. 
      The player will control an avatar doge by tilting the phone left and 
      right, and the avatar must "bounce" the balls back up. 
    * Doges will appear at the top of the screen and the player must throw the
      frisbee to the Doge by swiping/flicking the frisbee towards the Doge. The
      objective is to throw the Doge a certain amount of frisbees before time 
      is up, without missing.
    * There will be Doges and Grumpy cats displayed in a grid on the screen 
      and the player must avoid the Grumpy Cats by tapping the Doges in sight. 
      The grid will move down as the player taps more Doges. The objective is 
      to tap a certain amount of Doges before time is up.

* Show score and keep track of high scores

## Control Flow
* The user will choose "New Game" and then will move to the game screen.
* The first game will begin, and the user will play for a limited time
* After the initial time expires, another minigame will be rotated to the 
  screen
* This rotation continues, with each cycle making each game more difficult
* The player loses if at any point if they lose in any of the minigames:
    1. A ball falls in minigame 1.
    2. Frisbee misses dog in minigame 2.
    3. Touch grumpy cat in minigame 3.
    4. Fail to reach target when time runs out in minigames 2 and 3.
* Games get harder as player progresses
    1. More balls fall from the top of the screen
    2. Doge starts moving so the player must plan the frisbee throw accordingly
    3. Less time to pick the Doge tile
* When player loses, an alert pops up prompting the player to give a name for 
  the high score board and then the screen goes to score/high score view

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
