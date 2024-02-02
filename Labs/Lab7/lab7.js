const fs = require('node:fs')

let abby_score = []
let tyson_score = []
let zack_score = []

function readJSON() {
    try {
        let i = 1

        while (!(i > 4)) {
            let file = `calculations${i}.json`
            // console.log(file)

            // reading in file
            const data = fs.readFileSync(file,
                { encoding: 'utf8', flag: 'r' })
            
                
            formatted_data = JSON.parse(data).data.calculations;
            // data_array.push(formatted_data)
            let true_val = parseFloat(formatted_data[0].calc)
            let performer = ""
            let performer_val = 0
            let current_score = 0

            for (let i = 1; i < formatted_data.length; i++) {
                performer = formatted_data[i].performer
                performer_val = parseFloat(formatted_data[i].calc)
                current_score = Math.abs(true_val - performer_val)

                if (performer === "Abby") {
                    abby_score.push(current_score)
                }
                if (performer === "Tyson") {
                    tyson_score.push(current_score)
                }
                if (performer === "Zack") {
                    zack_score.push(current_score)
                }
            }

            // console.log(true_val)
            // console.log(performer)

            i += 1
        }
        
    }
    catch(err) {

    }
}

readJSON()

// console.log(abby_score)
// console.log(tyson_score)
// console.log(zack_score)

abby_sum = 0
for (let i = 0; i < abby_score.length; i++) {
    abby_sum += abby_score[i]
}

tyson_sum = 0
for (let i = 0; i < tyson_score.length; i++) {
    tyson_sum += tyson_score[i]
}

zack_sum = 0
for (let i = 0; i < zack_score.length; i++) {
    zack_sum += zack_score[i]
}

console.log(`Abby's score: ${abby_sum}`)
console.log(`Tyson's score: ${tyson_sum}`)
console.log(`Zack's sum: ${zack_sum}`)

let table = [abby_sum, tyson_sum, zack_sum];
let names = ["abby", "tyson", "zack"]

let highestpos = 0;
let lowestpos = 0;
let middlepos = 0;

let lowest = Infinity;
let highest = -Infinity

for (let i = 0; i < table.length; i++) {
    if (table[i] < lowest) {
        lowest = table[i];
        lowestpos = i;
    }
    if (table[i] > highest) {
        highest = table[i]
        highestpos = i
    }
    else {
        middlepos = i
    }
}

console.log(lowestpos);
console.log(highestpos);
console.log(middlepos);

console.log(`1: ${names[lowestpos]} - ${table[lowestpos]}`);
console.log(`2: ${names[middlepos]} - ${table[middlepos]}`);
console.log(`3: ${names[highestpos]} - ${table[highestpos]}`);
// console.log(names[highestpos]+table[highestpos]);

// kinda working

// numbers_array = []
// names_array = []

// for (const object of test_array) {
//     for (const nums of object) {
//         numbers_array.push(parseFloat(nums.calc))
//         // console.log(nums.calc)
//     }
//     for (const names of object) {
//         names_array.push(names.performer)
//         // console.log(names.performer)
//     }
// }
// console.log(numbers_array)
// console.log(names_array)


// for (let object = 0; object < test_array.length; object++) {
//     for (let nums = 0; nums < object.length; nums++) {
//         console.log(nums.calc)
//     }
// }

// console.log(test_array)
// console.log(readJSON())


// tyson 53.6
// xack 115.5670
// abby 473