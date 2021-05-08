secret_word = "black"
guess = ""
attempt = 1
hint_limit = 3
limit = 3


while guess != secret_word and attempt<=limit:
    if guess != secret_word and attempt==1:
        guess = input("Enter guess: ")
        attempt += 1
    elif guess != secret_word:
        if attempt == hint_limit-1:
            print("hint : color")
        elif attempt == hint_limit:
            print("hint : shadow")
        guess = input("Enter guess: ")
        attempt += 1

if guess == secret_word  and attempt <=limit+1:
    print("You win")
elif guess != secret_word or attempt >limit+1:
    print("You lose")

