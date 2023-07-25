# Warriors and Dragons

Create a game where warriors and dragons battle for glory.

## Happy path

When you start the game, the program asks for your username, then it asks you to
choose your character type, and finally asks you to give your character a name.

```bash
What's your name?
> Testino
Choose a character:
1. Warrior
2. Magician
> warrior
Give your character a name:
> Kratos
```

Immediately after, the program starts a Battle between your character and a
random dragon of 'Dragon Master' (the computer). The program announces the start
of the battle and then asks you to select a move:

```bash
--------------------
Testino challenges Dragon Master to a battle.
Testino uses Kratos
Dragon Master uses Drogon
--------------------
Select a move to attack
1. sword attack
2. sword of death
> 
```

When you type a valid move, then the program prints the result of the round
where the computer selects a random move of their character. If either player
has fainted, the battle continues and the program asks you to select another
move.

```bash
> sword attack
--------------------
Drogon uses byte!
Hits Kratos and caused 4 damage
Kratos uses sword attack!
Hits Drogon and caused 40 damage
--------------------
Select a move to attack
1. sword attack
2. sword of death
> 
```

When your or the computer character faints, the battle ends and the result is
printed. Then, the program finishes.

```bash
> sword of death
--------------------
Drogon uses byte!
Hits Kratos and caused 4 damage
Kratos uses sword of death!
Hits Drogon and caused 60 damage
--------------------
Kratos WINS! They experience reached 60.0 points.
$ 
```

## Game mechanics

### Characters

The program has a characters catalog where each character is represented by a
hash:

```ruby
"warrior" => {
      type: "player",
      base_exp: 50,
      base_stats: { hp: 90, speed: 45 },
      moves: ["sword attack", "sword of death"]
    }
```

- type: it could be "player" or "bot". Only the characters with the type
  "player" are available fo the user to choose. And only the "bot" characters
  are available for the computer to choose from.
- base_exp: Each character has experience points that is initialized with this
  number.
- base_stats: hp is the character health points. speed represents how fast the
  character is.
- moves: the available moves of the character.

### Moves

The program has a moves catalog where each move is represented by a hash:

```ruby
"sword attack" => {
      name: "sword attack",
      power: 40,
      accuracy: 100,
      priority: 1
    },
```

- name: the move name
- power: is used to calculate how much damage will cause to the opponent.
- accuracy: is used to calculate if the character hits the opponent or misses.
- priority: is used to calculate who attacks first

### Battle

A battle consists of a match between 2 players and their selected characters.
When the battle starts, each player character starts with their complete health
points.

In each round, each character selects a move. The program calculates which
character attacks first. This is done by comparing the priority of each move.
The bigger priority goes first. If both moves have the same priority, the
character with the biggest speed goes first. If both characters have the same
speed, the order is chosen randomly.

Then, the first character attacks the second with the selected move. The program
calculates if it hits or misses the opponent. This is calculated using the
accuracy of the move. If the accuracy is greater than or equal to a randomly
generated number between 1 and 100, then it is a hit. Otherwise, it is a miss.
The damage caused to the opponent is equal to the move power.

After the first character attacks, if the second character's health points are
greater than 0 (has not fainted), the second character attacks the first one
using the same logic. After that, if the first character has not fainted, the
battle continues with a new round. This is done until one of the characters
faints.

When the battle ends, the program increases the winner's character experience
and then prints a message to the screen.

### Player

A player has a name and a character. To create a new player you need to pass a
name, a character type, and a character name. A player can select a move for
their character by asking input from the user of the program.

### Bot

A bot is a special kind of player. Their name is always "Dragon Master" and
their character is selected randomly.

### Character

A new character is created by passing a name and type. The character keeps track
of their name, type, experience, max_health, speed, moves, health, and
current_move.

When a character prepares for battle, they set their health to the max_health
and set their current move to nil.
When a character receives some damage, they will subtract the damage received to
their health.

When a character is asked if they faint, the response will be true if their
health is not positive and false otherwise.

When a character attacks another character, they will calculate if the attack is
a hit or a miss. If it is a hit, they will call the receive_damage method of the
opponent and pass the inflicted damage. If the attack is a miss, only prints a
message on the screen.

A character can increase their experience when they win a battle. Their
experience is increased by 20% of the defeated character's experience.
