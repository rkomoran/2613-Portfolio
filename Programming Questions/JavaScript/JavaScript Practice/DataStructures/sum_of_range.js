function range (start, end) {
    let array = []
    for (start; start <= end; start++) {
        array.push(start)
    }
    return array
}

function range (start, end, step) {
    let array = []
    if (step > 0) {
        for (start; start <= end; start+= step) {
            array.push(start)
        }
    }
    else {
        for (start; start >= end; start += step) {
            array.push(start)
        }
    }
    return array
}

function sum (numbers) {
    let sum = 0
    for (num of numbers) {
        sum += num
    }
    return sum
}

console.log(range(5, 2, -1));

// console.log(sum(range(1, 10)));
// 55