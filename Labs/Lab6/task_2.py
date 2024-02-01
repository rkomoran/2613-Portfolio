def given_length(string, n):
    converted_words = string.split()
    toReturn = []
    for word in converted_words:
        if (len(word) == 3):
            toReturn.append(word)
    return toReturn


# testList = "The white cat and the red fox."
# newList = given_length(testList, 3)
# print(newList)

def longest_word(string):
    converted_words = string.split()
    max = 0
    longest_word = ""
    longest_words = []
    for word in converted_words:
        if (max < len(word)):
            max = len(word)
            longest_word = word

    longest_words.append(longest_word)

    for word in converted_words:
        if (len(longest_word) == len(word) and longest_word != word):
            longest_words.append(word)

    return longest_words


# newList = longest_word("Hello CS2613 Python is fun.")
# print(newList)

def most_common(string):
    lower_case_string = string.lower().strip()
    alphabet = [0] * 26

    for char in lower_case_string:
        if char.isalpha():
            index = ord(char) - ord('a')
            alphabet[index] += 1

    max_freq = max(alphabet)
    repeated_chars = []
    for i in range(len(alphabet)):
        if alphabet[i] == max_freq:
            repeated_chars.append(chr(i + ord('a')))

    return repeated_chars

result = most_common("My name is...")

print(result)



# driver

def driver():
    print("The white cat and the red fox.")
    string1 = "The white cat and the red fox."
    string1_result = given_length(string1)
    print(string1_result)

    print("This is a sentence, woohoo")
    string2 = "This is a sentence, woohoo"
    string2_result = given_length(string2)
    print(string2_result)

    print("Hello CS2613! Python is fun")
    string3 = "Hello CS2613! Python is fun"
    string3_result = longest_word(string3)
    print(string3_result)

    print("This is a test, woohoo tests")
    string4 = "This is a test, woohoo tests"
    

