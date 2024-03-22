// Creating an array
let myArray = [1, 2, 3, 4, 5];

// Accessing elements in an array
console.log(myArray[0]); // Output: 1

// Modifying elements in an array
myArray[2] = 10;

// Adding elements to an array
myArray.push(6);

// Removing elements from an array
myArray.pop();

// Creating a nested array
let nestedArray = [[1, 2], [3, 4], [5, 6]];

// Accessing elements in a nested array
console.log(nestedArray[0][1]); // Output: 2

// Modifying elements in a nested array
nestedArray[1][0] = 10;

// Adding elements to a nested array
nestedArray.push([7, 8]);

// Removing elements from a nested array
nestedArray.pop();

// 2D array representing a 3x3 grid
let grid = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
];

// Accessing elements in the grid
console.log(grid[1][2]); // Output: 5



// Testing lists

let adjacencyList = {}

// this adds in a new entry into the object with a empty list.
adjacencyList['A'] = []
adjacencyList['B'] = []

console.log(adjacencyList)