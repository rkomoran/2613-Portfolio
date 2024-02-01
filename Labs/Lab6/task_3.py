def given_length(string, n):
    converted_words = string.split()
    toReturn = []
    for word in converted_words:
        if (len(word) == n and word in converted_words):
            toReturn.append(word)
    return toReturn

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

fopen = open("L6_T3_Text.txt", "r")
read_file = fopen.read()

stripped_sentence = read_file.strip()

letter_word_result = given_length(stripped_sentence, 5)

print(f'Result to words in document {len(letter_word_result)}')


common_letter = most_common(stripped_sentence)

print(f'Result to common letter {common_letter}')

longest_word_result = longest_word(stripped_sentence)

print(f'Result to longest words {longest_word_result}')
