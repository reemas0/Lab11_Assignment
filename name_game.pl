% Lab 11 - Name Game

:- dynamic letter/1.

% Start a new game with a, b and c.
name_game :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game".'), nl,
    write('Add, delete or move letters to create your name.'), nl,
    menu.

% Display the menu.
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    handle_choice(Choice).

% 1: Display letters in their current order.
handle_choice(1) :-
    !,
    findall(X, letter(X), Letters),
    write('Current letters: '),
    write(Letters), nl,
    menu.

% 2: Add a letter using assert.
handle_choice(2) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    assert(letter(Letter)),
    write('Letter added.'), nl,
    menu.

% 3: Add a letter at the beginning.
handle_choice(3) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    asserta(letter(Letter)),
    write('Letter added at the top.'), nl,
    menu.

% 4: Add a letter at the end.
handle_choice(4) :-
    !,
    write('Enter a letter: '),
    read(Letter),
    assertz(letter(Letter)),
    write('Letter added at the bottom.'), nl,
    menu.

% 5: Delete the first occurrence of a letter.
handle_choice(5) :-
    !,
    write('Enter the letter to delete: '),
    read(Letter),
    (
        retract(letter(Letter))
    ->
        write('Letter deleted.'), nl
    ;
        write('Letter not found.'), nl
    ),
    menu.

% 6: Delete every letter.
handle_choice(6) :-
    !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

% 7: Exit.
handle_choice(7) :-
    !,
    write('Goodbye!'), nl.

% Handle an invalid menu choice.
handle_choice(_) :-
    write('Invalid choice. Try again.'), nl,
    menu.
