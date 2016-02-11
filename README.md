#The Monster App for iOS

##Intro & Goal
The game’s premise is simple: either feed or give heart to the monster to keep him alive. The secondary goal is to execute the task quickly by designing, developing, and launching in the App Store within a week

## Preview
![screencast](http://g.recordit.co/kFM9lqwUdA.gif)

##What is it?

###Glossary
1.	Main View - homepage of “The Monster” with instructions and play game buttons
2.	Instructions View – explanation of the game followed by play game button
3.	Gameplay View – play the game here, options to return to menu and restart

##Main View
This is the main view controller when the app is first loaded. It contains the title, “Instructions” button to lead to the Instructions View, and “Play Game” button to lead to the Gameplay View. Animations are created using the Spring Framework.

##Instructions View
The user only gets to this view when he/she taps the ‘Instructions” button on the Main View. The user sees the instructions to play the game followed by a “Play Game” button leading to the Gameplay View. Animations are created using Spring Framework. 

##Gameplay View
The user only gets to this view either from the Main View or the Instructions View. The user plays the game here and can return to the main menu by pressing the “Menu” button. The user can restart the game by pressing the “Restart” Button. To play the game, the user must drag the heart or the food to the monster within a 1 second time frame. Failure to do so before the timeframe results in a life lost. Once you loose your life 3 times, the monster dies and you have the option to Restart or go to the Menu.

##Push Notifications
Users do not receive any notifications.

##Registration
Users do not need to create an account. No Game Center authentication. 

##Mockups

The Design Specs are located in the Sketch file called TheMonster_Design_Spec

##Product

The iOS App can be installed from the App Store here:
https://itunes.apple.com/us/app/the-monster-game-app/id1079778064?ls=1&mt=8

##Dependencies

Spring Framework.

##Creator

Nicholas Ivanecky ([@ivantr0n](http://twitter.com/ivantr0n)), To visit all my works visit ([www.ivantron.com](http://www.ivantron.com))


