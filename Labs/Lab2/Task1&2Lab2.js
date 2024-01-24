function is_factorial(n) {
    var currentFact = 1;
    var stringToReturn = ""

    if (n < 0) {
        stringToReturn += " is a negative number."
        return n + stringToReturn;
    }

    for (var i = 1; currentFact <= n; i++) {
        // needs to be divisible be every number from 1 to that number
        if (currentFact === n) {
            // we found a factorial
            // return the current interation where it was found
            stringToReturn += " is the factorial result of: " 
            return n + stringToReturn + (i - 1);
        }
        // else, keep multiplying in factorial sequence
        currentFact = currentFact * i;
    }
    // if it was never found in the loop, return 0
    stringToReturn += " is not the factorial of another number."
    return n + stringToReturn;
}

console.log("Select a command:\n\t" + "n: Check a value\n\t" + "q: Quit")
const prompt = require('prompt-sync')();
input = prompt();
if (input === 'n') {
    number = prompt()
    console.log(is_factorial(Number(number)))
}

while (!(input === 'q')) {
    console.log("New command: ")
    input = prompt()
    if (input === 'n') {
        number = prompt()
        console.log(is_factorial(Number(number)))
    }
}
