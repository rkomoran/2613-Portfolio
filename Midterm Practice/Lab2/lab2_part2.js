function is_factorial(n) {
    let factorial = 1;

    if (n < 0) {
        console.log(`${n} is a negative number`);
        return;
    }

    for (let i = 1; i <= n; i++) {
        factorial *= i;
        if (factorial === n) {
            console.log(`${n} is the factorial result of: ${i}`);
            return;
        }
    }

    console.log(`${n} is not a factorial of another number.`);
}

console.log('Select a command:\n\tn: Check a value:\n\tq: Quit');
const prompt = require('prompt-sync')();
let command = prompt();

if (command === 'n') {
    let input = parseInt(prompt());
    is_factorial(input);
}