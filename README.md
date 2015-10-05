# IOS_Projects
 Final Project Developed by: Seed Zeng, @Jing Lu, @Yilong Hu

#### A. Points worth noticing  
==========================================================

- [ ] 1. 

The hand-drawing functionality is an important part of the app. Users rely on it to practice writing CHinese characters and it is also a main
functionality for three major modes of the app ( SmoothedBIView.h/m under Practice folder)
- initially simply use two GCMake call to approximate one chace. The result is pretty ugly. THe stroke is too sharp to be seen
- To improve the stroke, we increase the number of points (GCmake call) to approximate one line according to the length of the stroke
- Also tried to detect the speed of the stroke

- [ ] 2.   


The voice detection method is a useful functionality where users can speak to the app and the app will return list of Chinese words detected if listed in database. 
- initially only return a list of Chinese words (raw data)
- Eventually we show grids of words where users can click on it and enter practice mode from there
- Utilized kedaxunfei API and JSON package

- [ ] 3.  


To make the app prettier, utilized multiple frame and opensource codes to achive
a. intro slides
b. Siri voice volume detection
c. collection view


####  B. App Descripiton

==========================================================

> C++ is hard, VHDL is worse, Chinese Minus Minus is the best!

This app is developed to help people learn Chinese better and faster. It is comprised of four major modes: practice, battle, Mylist and What's This.

###### Practice Mode
> The main place users gonna practice writing Chinese chararcters and learning. 

- At the center is the caligraphy gird where users can practice writing the word following the shaded trace
- the Pronoucne button can be pressed to play the pronounciation of the word
- the info button can be pressed to show a short gif and useful info (meanning ) of the word
- the play button show a short gif about how to correctly writing the word
- share button can be used to share your work to instgram
- favortie button save the word to MYlist

###### MyList
> work collection of Chinese characters

- it displays flash cards of words that were saved via users' pressing favortie button in battle mode and practice mode
- it is designed for users to review their favorite chinese characters :)

###### Battle Mode
> Tired of practicing writing Chinese characters? Time to battle with your friend

- when step into the battle mode, first you have to choose from starting from player 1, player 2, or random.
- when game starts, analert view fires to start the timer for player who goes first, assuming player 1 in this case
- player one will start writing the character and press Done writing when finishing writing
- player one will then choose the meaning of the word
- another alert view then appear to start the timer for player 2. The process repatest
- one point for correct answer, no point deduction for wrong answers
- The final result of the battle is decided based on (1)score (2)time if scores are the same

###### What's This
-- you speak. We understand

- hold the siri like button to speak a chinese sentence, the voice recogination meter will appear.
- the search engine will then spilit your sentence to array of buttons of chinese words
- if the word is in our database, you can press it to invoke the practice mode
- if not, the button will be disabled




#### C. Design Decripition

==========================================================

The app consists of four major groups of view controllers responsible four modes of our app. One more group of viewcontrollers is responsible for the intro views we implemented in the first launch of the game.

###### Practice
- ScoreBoardController
displays the congratulations
- PracticeMainController
Where magic happens. Controlls the main view for practice mode. Reused by battle mode. Impelement the smoothedView

###### Battle
- battle_smoothedBIView 
equal to smoothedview
- battle_Controoler
controlls the game
- Battle_Score
Decisdes the result of the score

###### What's THis
View Ctonroller is the main controller that implement our Waht's This. We used API provided by XUNFEI LTD. Beijing.China


###### Mylist
Controlls the flash card view




#### D. Going further

==========================================================

There are a few aspetcs we want to improve about this app

1. implement an online database to store our data
2. more extendable
3. link mylist to practice Mode
4. not storitng the unsable sound files
5. link to wustl account