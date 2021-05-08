is_male = False
is_tall = False

if is_male and is_tall:
    print(" You are a male and tall")
elif is_male and not(is_tall):
     print(" You are a male, but you are short")
elif not(is_male) and is_tall:
    print(" You are not a male, but you are tall")
else:
    print("You are neither male or tall")