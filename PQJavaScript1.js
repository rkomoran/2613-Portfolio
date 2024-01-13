const prompt = require('prompt-sync')();

const input = prompt();
var inputArray = input.split(",")

// have to use trim() here in order for the string comparasion later to work
const person = {age: inputArray[0], height: inputArray[1], weight: inputArray[2], mood: inputArray[3].trim(), view: inputArray[4].trim()}
let {age, height, weight, mood, view} = person;

// console.log(recommender(age,height,weight,mood,view));



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

const isParkOpen = () => {
    let result = false;
    let currentDate = "2024-05-06";
    let currentTime = "11:00:01 a.m.";
    if (currentDate >= "2024-05-01" && currentDate < "2024-09-30") {
        if (currentTime >= "11:00:00 a.m." && currentTime <= "11:00:00 p.m.") {
            result = true;
        }
    }
    return result;
}

function date() {
    let date = new Date().toLocaleString();
    let stringArray = date.split(",");
    // removes any whitespace
    // accesses date from toLocaleString
    return stringArray[0].trim();
}

function time() {
    let time1 = new Date().toLocaleString();
    let stringArray = time1.split(",");
    // removes any whitespace
    // accesses time from toLocaleString
    return stringArray[1].trim();
}

