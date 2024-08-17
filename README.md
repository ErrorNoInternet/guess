# guess

Random number guessing game in x86-64 assembly.

```
$ gcc -nostdlib guess.S -o guess
$ ./guess
welcome to the number guessing game!
you have 7 tries to guess a number between 1 and 100.
enter your guess: 50
too low!
you have 6 tries to guess a number between 1 and 100.
enter your guess: 75
too low!
you have 5 tries to guess a number between 1 and 100.
enter your guess: 85
too low!
you have 4 tries to guess a number between 1 and 100.
enter your guess: 95
too low!
you have 3 tries to guess a number between 1 and 100.
enter your guess: 98
congratulations, you won!
```
