const fs = require('node:fs')

let abby_score = []
let tyson_score = []
let zack_score = []

function readJSON() {
    let fileExists = true
    try {
        let i = 1

        while (fileExists) {
            let file = `calculations${i}.json`

            // reading in file
            const data = fs.readFileSync(file,
                { encoding: 'utf8', flag: 'r' })
            
            formatted_data = JSON.parse(data).data.calculations;

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

            i += 1
        } 
    }
    catch(err) {
        fileExists = false
    }
}

readJSON()

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
        highest = table[i];
        highestpos = i;
    }
}

// assigning middlepos
for (let i = 0; i < table.length; i++) {
    if (i !== lowestpos && i !== highestpos) {
        middlepos = i;
    }
}

console.log(`1: ${names[lowestpos]} - ${table[lowestpos]}`);
console.log(`2: ${names[middlepos]} - ${table[middlepos]}`);
console.log(`3: ${names[highestpos]} - ${table[highestpos]}`);
