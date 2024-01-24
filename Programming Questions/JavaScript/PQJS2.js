// including fs module
const fs = require('fs');

// calling the fs.readFileSync() method 
// for reading in the file synchronously

// this reads it in as all strings
// https://www.geeksforgeeks.org/node-js-fs-readfilesync-method/
const data = fs.readFileSync('DataInput.txt',
    { encoding: 'utf8', flag: 'r' }).split('\n');

// output file
const outputFile = 'Q1Output.txt'

// reading in values
let i = 0

while (i < data.length) {
    let operand = data[i].trim()
    let numVal = parseInt(data[i + 1])
    // once EOF is read, break to avoid going into switch again
    if (operand === "END") {
        break
    }

    // store current operand's numbers

    // using `slice` returns an array from a specified indices (1.0 - 2.0 - 3.0 - 4.0 - 5.0)
    // this way, I don't have to use a tradition loop to store each element into an array
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice

    // map returns an array on each element of the nums array and converts them to a number
    // (num) => { return Number(num); } is kinda like the lambda operator in racket
    let nums = (data.slice(i + 2, i + 2 + numVal).map((num) => {
        return parseInt(num);
    }))

    switch (operand) {
        case "SUM":
            fs.appendFileSync(outputFile, formatOutput("SUM", sum(nums)) + '\n');
            break;
        case "AVG":
            fs.appendFileSync(outputFile, formatOutput("AVG", avg(nums)) + '\n');
            break;
        case "MAX":
            fs.appendFileSync(outputFile, formatOutput("MAX", max(nums)) + '\n');
            break;
        case "MIN":
            fs.appendFileSync(outputFile, formatOutput("MIN", min(nums)) + '\n');
            break;
        case "FXP":
            fs.appendFileSync(outputFile, formatOutput("FXP", fxp(nums)) + '\n');
            break;
        case "FPO":
            fs.appendFileSync(outputFile, formatOutput("FPO", fpo(nums)) + '\n');
            break;
        case "FSN":
            fs.appendFileSync(outputFile, formatOutput("FSN", fsn(nums)) + '\n');
            break;
        case "FCS":
            fs.appendFileSync(outputFile, formatOutput("FCS", fcs(nums)) + '\n');
            break;
        default:
            console.log("Didn't catch");
    }

    // i now points at the other operand
    i += numVal + 2
}

function sum(input) {
    sumResult = 0
    for (let num of input) {
        sumResult += num
    }
    return sumResult
}

function avg(input) {
    return sum(input)/input.length
}

function max(input) {
    maxVal = input[0]
    for (let num of input) {
        if (num > maxVal) {
            maxVal = num;
        }
    }
    return maxVal;
}

function min(input) {
    minVal = input[0]
    for (let num of input) {
        if (num < minVal) {
            minVal = num;
        }
    }
    return minVal;
}

function fxp(n) {
    let computedNums = [];
    for (let z of n) {
        let currListNums = [];
        for (let k = 0; k < 50; k++) {
            currListNums.push(Math.pow(z, k) / factorial(k));
        }
        computedNums.push(sum(currListNums));
    }
    return computedNums;
}

function fpo(n) {
    const computedNums = [];
    for (let z of n) {
        let currListNums = [];
        for (let k = 0; k < 50; k++) {
            currListNums.push(k * (Math.pow(z, k) / factorial(k)));
        }
        computedNums.push(sum(currListNums));
    }
    return computedNums;
}

function fsn(n) {
    const computedNums = [];
    for (let z of n) {
        let currListNums = [];
        for (let k = 0; k < 50; k++) {
            currListNums.push((Math.pow(-1, k) * Math.pow(z, (2 * k) + 1)) / factorial((2 * k) + 1));
        }
        computedNums.push(sum(currListNums));
    }
    return computedNums;
}

function fcs(n) {
    const computedNums = [];
    for (let z of n) {
        let currListNums = [];
        for (let k = 0; k < 50; k++) {
            currListNums.push((Math.pow(-1, k) * Math.pow(z, 2 * k)) / factorial(2 * k));
        }
        computedNums.push(sum(currListNums));
    }
    return computedNums;
}

// helper for calculating factorial
function factorial(num) {
    return num <= 1 ? 1 : num * factorial(num - 1);
}

function formatOutput(operation, result) {
    // `object` means array type
    // `join` joins array instances with a specific syntax
    if (typeof(result) === 'object') {
        return `${operation}: [${result.join(', ')}]`;
    }
    return `${operation}: ${result}`
}
