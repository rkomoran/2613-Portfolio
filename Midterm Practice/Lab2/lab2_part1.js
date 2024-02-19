function is_factorial(n) {
    // keep track of current factorial iteration
    factorial = 1

    if (n < 0) {
        return -1
    }

    for (let i = 1; i < n + 1; i++) {
        // 1 * 1 = 1 --> 1 * 2 = 2 --> 2 * 3 = 6 --> 6 * 4 = 24
        factorial *= i;
        if (factorial == n) {
            return i
        }
    }
    return 0
}

console.log(is_factorial(720))