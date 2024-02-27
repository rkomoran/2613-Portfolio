let function1 = (sentence) => {
    words = sentence.split(" ")
    
    for (let i = 0; i < words.length; i++)
    {
        if (words[i][0] != words[i].toUpperCase()[0])
        {
            return false
        }
    }
    return true
}

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

let function3 = (sentence) => {

    let i = 0
    if (sentence.length > 0)
    {
        for (i; i < sentence.length; i++)
        {
            if (sentence[i] == ' ')
            {
                break
            }
        }

        if (sentence[i - 1].toUpperCase() == sentence[i + 1].toUpperCase())
        {
            return true
        }
        else {
            return false
        }
    }
    else {
        return false
    }
}

let array_of_functions = [
    function1,
    function2,
    function3
]

let array_of_strings = [
    "Test Test",
    "This is a test", 
    "This Is A Test", 
    "Catherine Elaine", 
    "Catherine Elaine Guil", 
    "",
    "Does this pass?", 
    "Question Node.js"]

let filter_function = (arr_string, arr_func) => {
    toReturn = []

    for (let i = 0; i < array_of_strings.length; i++) {
        let count = 0
        for (let j = 0; j < array_of_functions.length; j++) {
            if (array_of_functions[j](array_of_strings[i])) {
                count += 1
            }    
        }
        if (count == 3) {
            toReturn.push(array_of_strings[i])
        }
    }

    return toReturn
}

console.log(filter_function())