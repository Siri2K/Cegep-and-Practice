from Question import Question
questions_prompt = [
    "What colors are apples?\n(a) Red/Green\n(b) Orange/Purple\n(c) Pink/Blue\n\n",
    "What colors are bananas?\n(a) Red/Pink\n(b) Orange/Purple\n(c) Yellow/Green\n\n",
    "What colors are mango?\n(a) Red/Green\n(b) Orange/Yellow/Red/Green\n(c) Pink/Blue\n\n",
]

questions = [
    Question(questions_prompt[0],"a"),
    Question(questions_prompt[1],"c"),
    Question(questions_prompt[2],"b"),
]

def run_test(questions):
    score = 0
    for question in questions:
        answer = input(question.prompt)
        if answer == question.answer:
            score+=1
    print("You got "+str(score) +"/"+ str(len(questions)) + " Correct")

run_test(questions)     