# [DogeMaster]

## Authors
* Yejia Chen
* Christine Chen

## Purpose
Raw Text: [Here, you will explain in 1-2 lines why your app exists. Think of this as your "blurb". e.g. Meowtfits is a shopping app that allows users to buy different outfits for their cats.]
    This is an app that challenges users to multitask by taking care of dogs and cats.

## Features
Bullet Points: [List each feature you will implement. e.g. Ability to view outfit pages with photos. Filter by cat size. Users can share outfit page listings with friends.]
    There are 4 minigames in which the user will play.
    - Walking the dog and avoid obstacles while walking
    - Feeding the dogs food before they faint of hunger
    - Playing fetch with the dogs before they become bored
    - Keeping the dogs asleep by petting them

## Control Flow
Bullet Points: [Walk us through how your app would work - how the user would interact with it, starting from the initial screen. e.g. Users are initially presented with a splash screen, where they can log in or browse as a guest. Once done, they see a curated list of some of the newest and coolest cat outfits. Tapping on a cat outfit entry takes you to that cat outfit's listing page.]
    - The user will choose "New Game" and then will move to the game screen.
    - The player loses if at any point if they lose in any of the minigames:
        1. The dogs bump into an obstacle
        2. The dogs faint of hunger
        3. The dogs become bored
        4. The dogs wake up
    - The first game will begin, and the user will play for a limited time
    - After the initial time expires, another minigame will be added to the screen
    - This continues until all minigames are being played at once
    - The speed of each game increases gradually to challenge the user

## Implementation

### Model
Bullet Points: [List the files in your Model, e.g. Item.Swift]

### View
Bullet Points: [List your different Views, e.g. OutfitListTableView]

### Controller
Bullet Points: [List the files in your Controller, e.g. OutfitListTableViewController]
