A = [
    3  5 -1;
    7  8  5;
    0 -1  2
];

disp('Matrix A:');
disp(A);

# this is saying element 1, 3, then element 2, 3, then element 3, 3
# prints out the third column
disp('Elements in the third column of A:');
disp(A(1:3, 3));

# this is saying show the third element from all the rows
disp('Elements in the third column of A (alternative notation):');
disp(A(:, 3));

# this is saying at the third row, just show all the columns
disp('Elements in the third row of A:');
disp(A(3, :));
