def most_common(string):
#     lower_case_string = string.lower()
#     alphabet = [0] * 26
#     individual_chars = list(lower_case_string)

#     # for i in range(len(alphabet)):

#     for char in individual_chars:
#         if (char.isalpha()):
#             alphabet[ord(char)%97] += 1
#     maxVal = 0
#     repeated_words = []
#     # for num in alphabet:
#     #     if (maxVal < num):
#     #         maxVal = num

#     for i in range(len(alphabet)):
#         if alphabet[i] == maxVal:
#             maxVal = i + ord('a')

#     repeated_words.append(chr(maxVal))
#     return repeated_words