const fs = require('node:fs')

// reading in file
const data = fs.readFileSync('journal.json',
    { encoding: 'utf8', flag: 'r' })

dataArray = JSON.parse(data);

function words(array) {
    let totalWords = [];
    for (const element of array) {
        for (const event of element.events) {
            const formatted_words = event.split(" ")
            for (const word of formatted_words) {
                if (!totalWords.includes(word)) {
                    totalWords.push(word);
                }
            }
        }
    }
    return totalWords;
}

console.log(words(dataArray))

// output
// [
//     'carrot',    'exercise', 'weekend',
//     'bread',     'pudding',  'brushed',
//     'teeth',     'touched',  'tree',
//     'nachos',    'cycling',  'brussel',
//     'sprouts',   'ice',      'cream',
//     'computer',  'potatoes', 'candy',
//     'dentist',   'running',  'pizza',
//     'work',      'beer',     'cauliflower',
//     'lasagna',   'lettuce',  'television',
//     'spaghetti', 'reading',  'peanuts'
// ]