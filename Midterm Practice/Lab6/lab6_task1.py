# Only Words of a Given Length:
# Parameter(s): (1) a string representing a sentence with each “word” separated by a space
# and (2) an integer representing a word length.
# Returns: A list of “words” from sentence that have the same length as the integer passed in
# as a parameter. You may treat that any punctuation or special characters as a character in
# the “word”.
# Example:
# given_length("The white cat and the red fox.", 3) = ["The", "cat", "and", "the", "red" ]

def given_length(sentence, length):
    words = sentence.split()
    new_list = [word for word in words if len(word) == length]
    return new_list

def given_length_2(sentence, length):
    words = sentence.split()
    new_list = []
    for word in words:
        if len(word) == length:
            new_list.append(word)
    
    return new_list

test = given_length("The white cat and the red fox.", 3)
test2 = given_length_2("The white cat and the red fox.", 3)

print(test)
print(test2)

# Longest Words:
# Parameter(s): A string representing a sentence with each “word” separated by a space.
# Returns: The longest “word” or “words” from sentence in a list. You may treat that any
# punctuation or special characters as a character in the “word”. If there is more than one
# longest “word”, return a list of all the longest “words”.
# Examples:
# longest_word("Hello CS2613! Python is fun.") = ["CS2613!"]
# longest_word("Hello CS2613 - Python is fun.") = ["CS2613", "Python"]

def longest_word(sentence):
    words = sentence.split()
    # find the longest length
    # puts it in an iterable so max can find it
    longest_length = max(len(word) for word in words)
    # put the longest word(s) in a list
    result = [word for word in words if len(word) == longest_length]
    return result

print(longest_word("Hello CS2613! Python is fun."))
print(longest_word("Hello CS2613 Python is fun."))

# Most Common Letter:
# Parameter(s): A string representing a sentence.
# Returns: The most common letter(s) (a-z) in the sentence in lower case in a list. This is case
# insensitive meaning ‘a’ == ‘A’. Do not consider non-letter characters as letters.
# Hint: To create a list of values of a certain length more efficiently, you can multiple the length
# by a list of only 1 value, i.e., [0] * 26.
# Examples:
# most_common("My name is…") = ['m']
# most_common ("This is!") = ['i', 's']
def most_common(sentence):
    # set sentence to all lowercase
    sentence = sentence.lower()
    alphabet_counter = [0] * 26

    for char in sentence:
        if char.isalpha():
            index = ord(char) - ord('a')
            alphabet_counter[index] += 1

    max_char_count = max(alphabet_counter)
    to_return = []
    for i in range(len(alphabet_counter)):
        if alphabet_counter[i] == max_char_count:
            to_return.append(chr(i + ord('a')))

    return to_return


def most_common_2(sentence):
    # sentence.lower().count(chr(i + ord('a'))): For each character in the lowercase sentence,
    # it counts the occurrences of the letter corresponding to chr(i + ord('a')).

    # constructs a list where each element represents the count of a particular letter in the sentence.
    # This list comprehensively captures the counts of all letters from 'a' to 'z' in the sentence.
    alphabet_counter = [sentence.lower().count(chr(i + ord('a'))) for i in range(26)]
    max_char_count = max(alphabet_counter)
    to_return = [chr(i + ord('a')) for i in range(len(alphabet_counter)) if alphabet_counter[i] == max_char_count]

    return to_return

print(most_common("My name is…"))
print(most_common("This is!"))

print(most_common_2("My name is…"))
print(most_common_2("This is!"))