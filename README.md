# DogeSitter

## Authors
* Yejia Chen
* Christine Chen

## Purpose
This is an app that challenges users to multitask by playing games with doge.

## Features
* There are 3 minigames in which the user will play.
    * Keep balls bouncing using tilt
    * Flick the frisbee to your dog
    * Avoid the Grumpy Cats
* Show score and keep track of high scores

## Control Flow
* The user will choose "New Game" and then will move to the game screen.
* The first game will begin, and the user will play for a limited time
* After the initial time expires, another minigame will be added to the screen
* This continues until all minigames are being played at once
* The player loses if at any point if they lose in any of the minigames:
    1. A ball falls
    2. Frisbee misses dog
    3. Touch grumpy cat/run out of time moving forward
* Games get harder as player progresses
    1. More balls appear
    2. Doge starts moving
    3. Less time to pick tile
* When player loses, goes to score/high score view

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
