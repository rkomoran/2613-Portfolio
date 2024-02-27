// Only the first letter of the string and the first letter after any space is capital.

// let function1 = (sentence) => {
//     words = sentence.split(" ")
    
//     for (let i = 0; i < words.length; i++)
//     {
//         if (words[i][0] != words[i].toUpperCase()[0])
//         {
//             return false
//         }
//     }
//     return true
// }

// console.log(function1("This Is A Test"))

// Only one space is found in the string.

let function2 = (sentence) => {
    count = 0

    for (let i = 0; i < sentence.length; i++)
    {
        if (sentence[i] == ' ')
        {
            count += 1
        }
    }

    if (count > 1)
    {
        return false
    }
    else if (count == 1) {
        return true
    }
}

console.log(function2("Catherine Elaine Guil"))


// let function3 = (sentence) => {

//     let i = 0
//     for (i; i < sentence.length; i++)
//     {
//         if (sentence[i] == ' ')
//         {
//             console.log(`found space at ${sentence[i]}`)
//             break
//         }
//     }

//     if (sentence[i - 1].toUpperCase() == sentence[i + 1].toUpperCase())
//     {
//         console.log(`Sentence[i - 1] = ${sentence[i - 1]}`)
//         console.log(`Sentence[i + 1] = ${sentence[i + 1]}`)
//         return true
//     }
//     else {
//         return false
//     }
// }

// console.log(function3("Margaret Ryan"))
// console.log(function3("Catherine Elaine Guil"))
