# Dyla

# Intro

Deckbuilder game in the style of Dominion.

Theme/setting:  Space ship-to-ship(s) battles.  Player commands/captains a battleship, through 3 battles of progressively higher difficulty.  Each of the 3 battles consists of a series of encounters with enemy ships.

Basic game progression: Player starts with a deck of 10 'basic' low power cards, fighting low power enemies represented by Encounter cards.  As play progresses, players acquire more powerful cards to mix into their deck.

## Card layouts

### Encounter cards
- name
- hit points, you must deal this much damage to defeat them.
- damage, if not defeated at the end of the turn, the enemy will retaliate and inflict this amount of damage.
- VP, if defeated, you gain this amount of points towards victory.
- TechPoints, if defeated, gain this amount of TechPoints usable to purchase tech cards.
- special text and flavor text, additional card effects or flavor.

### Attack cards
(purchasable tech cards)

- name
- cost, TechPoint cost to buy this tech card.
- damage, when played you will inflict this much on the enemy when damage resolves.
- special text and flavor text, additional card effects and flavor

### Tactics cards
(purchasable tech cards)

- name
- cost, TechPoint cost to buy this tech card.
- special text and flavor text, additional card effects and flavor


## Initial game setup

Starting TechPoints is 0.
VP starts at 0.

Player’s starting deck cards:
7x basic Igelstellung
3x basic evade

Player hand:
Shuffle and draw 5 for the starting hand.

Game board:
Shuffle all 3 encounter decks.  1 Encounter card is active and placed face up from the lvl 1 encounter deck.
All tech cards are face up and purchasable with no limitations except TechPoints.  The price increases by 1 with each additional copy you buy of the same card.

## Turn order

1. *Encounter phase*: Flip over a new encounter card if none are showing.
2. *Combat phase*: Play any number of tactics cards desired.
3. Play any number of attack cards desired.
4. Resolve tactics cards, then resolve damage done by attack cards.
5. If Encounter card is not defeated, take return damage from the card.  If defeated, flip the next card.
6. *Research phase*: Chance to purchase tech cards.
7. *Draw phase*: If 5 or fewer cards in hand, draw 2 cards.  Else, nothing happens.  Reshuffle deck if necessary.

## Rules details

Victory/lose conditions: Player wins when an arbitrary number of victory points(15?) is accrued from defeating enemies.  Player loses if hit points reach 0.

Player hit points - The player has a maximum health of 10.

Hand size - Max hand size is 8.  You stop drawing cards from your regular draw phase once you hit 6 cards.  At the beginning of any turn you may skip all of your actions (you WILL take enemy damage though) to discard your hand and redraw up to the amount you held.

Tech cards (buy) - When purchased, they go directly on top of your deck.  If you draw cards at the end of the turn you will immediately draw it and have it for the coming turn.

Encounter cards - Split into 3 decks, of level 1, 2, and 3 difficulty enemies.  Each deck will contain ample cards and will be shuffled for randomness each game.  Player completes each deck once 5 VP are obtained from that particular deck.  Encounters are always played one at a time.

Full repair - Players are fully healed to 10 hp after Encounter decks 1 and 2 have each been completed.

Persistent damage - Enemy ships will retain all damage dealt to them turn to turn until they are defeated.

## Example Card assets

```
Attack cards:
name............cost......damage......text.....
Igelstellung    0(basic)   1
Igelstellung    2          2
Helldart        4          3
Valiant Mk.8    6          4
Gottfried Mk.71 8          5
Heavy Missile   10         6
Tubes
Lohengrin       15         9
```

```
Tactics cards:
name....................cost....text..................
Evade                   0(basic)  -1 damage taken this turn
Smoke dispensers        2    -2 damage taken this turn
Anti-beam depth charge  2    -3 damage you deal and take this turn
Emergency repairs       3      regain 1 hp, still max 10 hp
Scavenge supplies       3      gain +1 TechPoint
Targeting computers     4      +1 damage for each attack card
Maximum thrust          5      regain 1 hp, discard current encounter and redraw a new one
Combat veterancy        6      permanently trash 1 card from your hand and gain +1 TechPoint
Combat Information Center 10    +2 damage for each attack card, -1 damage taken this turn
```

```
Encounter cards:
name.....................hp....damage....TechPoints...vp....

LVL 1
Moebius MA squadron       4       2         1         0
Drake class               5       2         1         0
Nelson class              7       3         2         1
Agamemnon class          11       3         4         2

LVL 2
GINN squadron             8       3         2         0
GINN elite squadron      11       4         3         0
Laurasia class            9       4         2         1
Nazca class              12       4         4         1

LVL 3
Strike Dagger squadron   14       3         2         0
GUAIZ squadron           14       4         3         0
Nazca Fleet              16       5         3         1
Vesalius                 14       4         2         1
Dominion                 15       5         4         1
Peacemaker Fleet         20       9         6         2
```

## Information needed to be displayed on the screen

- player current/max hp
- player TP(tech points)
- player VP(victory points)
- player deck cards left
- all of the players current cards in hand
- current active encounter
