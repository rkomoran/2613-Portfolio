function reverseArray (array) {
    newArray = []

    for (let i = 0; i < array.length; i++) {
        newArray.unshift(array[i])
    }

    return newArray
}

function reverseArrayInPlace(array) {
    let length = array.length
    for (let i = 0; i < length/2; i++) {
        let temp = array[i]
        array[i] = array[length - 1 - i]
        array[length - 1 - i] = temp
    }
}

console.log(reverseArray(["A", "B", "C"]));
// → ["C", "B", "A"];

let arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]
