# returns string as only alphabets & lowercase
def clean_token(input):
    output = ""
    for letter in input:
        if (letter.isalpha()):
            output = output + letter.lower()
    return output

def repeat_letter(input):
    if len(input) <= 0:
        return False
    else:
        # check if the first character exists in the string after the first character
        if input[0] in input[1:]:
            return True
        else:
            return repeat_letter(input[1:])

def end_start(word1, word2):
    # only do this for words with more than 2 characters
    return len(word1) > 1 and len(word2) > 1 and word1[len(word1) - 1] == word2[0]


# testing

userIn = input("Input a sentence for statistics\n")

# list of strings
words = userIn.split()

num_chars = 0
repeats = 0
matches = 0

for i in range(len(words)):

    word_from_list = clean_token(words[i])

    for char in word_from_list:
        num_chars += 1

    if repeat_letter(word_from_list):
        repeats += 1

    if i + 1 < len(words) and end_start(word_from_list, clean_token(words[i + 1])):
        matches += 1
    


print("Total number of alphabetic characters: " + str(num_chars) + "\n" + "Total number of words with repeated alphabetic characters: " + str(repeats) + "\n" 
      + "Total number of end-start letter matches: " + str(matches) + "\n")
