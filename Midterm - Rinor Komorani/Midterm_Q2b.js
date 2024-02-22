const fs = require("fs")
function writeStrings(array_strings, file_name) {
    new_string = ""
    count = 0

    for (let i = 0; i < array_strings.length; i++) {
        new_string += array_strings[i];
        for (let j = 0; j < new_string.length; j++) {
            count = j - 1
        }
        new_string += '\n'
    }

    fs.writeFileSync('index.txt', new_string)

    return count
}

console.log(writeStrings(["Hello", "world", "test"], "Output.txt"))