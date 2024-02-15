% Strings
string = "hey";

% can access a string the same way in an array
for i = 1:length(string)
    disp(string(i));
endfor
% Output = 
% h
% e
% y

printf("String = %s\n", string);
% can use printf the same was as c
% output = "hey"

% Can create a string array using char
% Values are concatenated vertically
matrixA = [97, 98, 99];
matrixB = ["hell", "o"];
matrixC = ["97 ", " 98 ", " 99"];
disp(char(matrixA, matrixB, matrixC));
% Output
% abc       
% hello     
% 97  98  99

string_matrix = (char(matrixA, matrixB, matrixC));
printf("First string of array = %s\n", string_matrix(1, :));
% Output 'abc' 
% NOTE that string_matrix(1) would only provide 'a'

% This converts a particular character into an ascii value
printf("ASCII Value of 'a' = %d\n", double('a'));
% ASCII Value of 'a' = 97
printf("ASCII Value of sentence 'Hello' = %d\n", double("hello"));
% ASCII Value of sentence 'Hello' = 104
% ASCII Value of sentence 'Hello' = 101
% ASCII Value of sentence 'Hello' = 108
% ASCII Value of sentence 'Hello' = 108
% ASCII Value of sentence 'Hello' = 111

% strcat appends strings horizontally, while char appends vertically
disp(char("an apple", "two pears"));
% Output:
% an apple 
% two pears

disp(strcat("an apple ", "two pairs"));
% Output: an apple two pairs

% to remove leadings & trailing whitespace
disp(strtrim("     test    "));

% strcmp for is two strings are the same
% returns 1 if they are, and 0 if they aren't
disp(strcmp("hi", "hi"));

% can also use end to go to the last entry for a dimension
matrixA = [1, 2, 3, 4, 5];
disp(matrixA(1:end));

% reverse
% Here, we specify a starting point, an increment amount, and an end point
disp(matrixA(end:-1:1));

% We can add matracies together
matrixA = [1, 2, 3];
matrixB = [1, 2, 3];
disp(matrixA + matrixB);

matrixA = [
    1 2 3;
    4 5 6;
    7 8 9;
];

matrixB = [
    1 2 3;
    4 5 6;
    7 8 9;
];

disp(matrixA + matrixB);

% Converts string to a number
string = "12345";
disp(str2num(string));

% Can also go the other way
matrixA = [
    1 2 3 
    4 5 6
    7 8 9
];
disp(num2str(matrixA));

% creates a matrix of ones
matrixA = ones(1,10);
% creates a matrix of zeros
matrixB = zeros(1,10);

disp(matrixA);
disp(matrixB);
