# Xmonka

XChangable Monster Kards

WIP project, started around 05/06/24

The purpose of this project is to implement an online Trading Cards
game to learn how to implement a stateful web application using the
BEAM virtual machine (Elixir), that support concurrent games taking place
while recording the state in either database-less structures or in-memory DB
(Mnesia).
Thanks to the usage of GenServer, the web app should allow for multiple,
independent games taking place simultaneously with a degree of fault tolerance.

The rules of the card game are:

-The objective is defeating a number of monster cards from the opposite team
-Cards might be on the deck, hand, bench or in battle.
-Monster cards have a finite number of healthpoints that will be taken with foe attacks.
-Monsters have elements that increase or decrease damage received.
-Three types of card: Monster, weapon and effect.
-One monster may be in battle at every time
-A monster begins with a base 'attack'
-Weapons add a secondary attack. Weapon and Monster element compatibility is needed.
-Effect cards function as single use moves, or manipulate the hand/deck/bench
