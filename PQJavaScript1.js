const prompt = require('prompt-sync')();
const input = prompt();

// have to add a space after , to avoid comparasion errors later
var inputArray = input.split(", ")

const person = {age: inputArray[0], height: inputArray[1], weight: inputArray[2], mood: inputArray[3], view: inputArray[4]}
let {age, height, weight, mood, view} = person;

function recommender(age, height, weight, mood, view) {
    let recommendation = "";

    if (Number(age) > 4 && Number(age) < 12) {
        console.log("Success");
        if (mood === "Calm") {
            console.log("Success");
            recommendation += "\tMerry-Go-Round\n";
        }
    }
    if (Number(age) > 4 && Number(height) >= 152.4 && Number(weight) >= 36.29) {
        if (mood === "Exciting") {
            recommendation += "\tTilt-A-Whirl\n";
        }
    }
    
    if (Number(age) > 10 && Number(height) >= 152.4) {
        if (mood === "Calm" || view == "Yes") {
            recommendation += "\tFerris Wheel\n";
        }
        if (mood === "Exciting" || view == "Yes") {
            recommendation += "\tRollercoaster\n";
        }
    }
    if (Number(age) > 14 && Number(height) >= 152.4 && Number(weight) >= 36.29) {
        if (mood === "Exciting") {
            recommendation += "\tBumper Cars\n";
        }
    }
    
    return recommendation;
}

function date() {
    let date = new Date().toLocaleString();
    let stringArray = date.split(",");
    // removes any whitespace
    // accesses date from toLocaleString
    return stringArray[0].trim();
}

function time() {
    let time = new Date().toLocaleString();
    let stringArray = time.split(",");
    // removes any whitespace
    // accesses time from toLocaleString, cuts off seconds and a.m or p.m
    return stringArray[1].trim().substring(0,5);
}

const isParkOpen = () => {
    let result = false;
    let currentDateObject = new Date();
    // tested if this works with 2024-05-06
    let currentDate = date();
    let currentTime = currentDateObject.getHours();
    if (currentDate >= "2024-05-01" && currentDate < "2024-09-30") {
        if (currentTime >= 11 && currentTime <= 23) {
            result = true;
        }
    }
    return result;
}

const printResults = () => {
    let sentence = ""
    sentence += `${time()} - `
    sentence += "The Amusement Park is " + (isParkOpen() ? "OPEN." : "CLOSED.") + " Recommended Rides\n"

    sentence += recommender(age, height, weight, mood, view) === "" ? 
    "Sorry, there are no suitable rides at this moment\n" : recommender(age, height, weight, mood, view)
    
    sentence += isParkOpen() ? "We hope to see you soon!\n" : "We hope to see you when our park opens, every day 11AM-11PM from May 1st to September 30th.\n"
    return sentence
}

console.log(printResults())
