const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const axios = require("axios");

const key = '7d186bb816mshb129bc7756d0b5fp1b8b9bjsn9b43caf88e7b';

rl.question("City + Province/Territory: ", function(input) {
    searchPopulation(input);
});

async function searchPopulation(input){
    // returns a list of ["City", "Province"]
    let modifiedInput = input.split(",").map(each => each.trim());
    let city = modifiedInput[0]
    let province = modifiedInput[1]

    const options = {
        method: 'GET',
        url: `https://wft-geo-db.p.rapidapi.com/v1/geo/countries/CA/regions/${province}/cities`,
        params: {
            namePrefix: city
        },
        headers: {
            'X-RapidAPI-Key': key,
            'X-RapidAPI-Host': 'wft-geo-db.p.rapidapi.com'
        }
    };
    
    try {
        const response = await axios.request(options)
        let cityData = response.data.data[0]

        let latitude = cityData.latitude
        let longitude = cityData.longitude
        let population = cityData.population
        let id = cityData.id

        population > 0 ? console.log(`${city}, ${province} (${latitude}, ${longitude}) has a population of ${population}`)
                        : console.log(`${city}, ${province} (${latitude}, ${longitude}) does not have population data`)
        
        // call other function for nearby cities
        rl.question("Radius in kilometres: ", function(input) {
            searchCities(input, id)
        });
       
    } catch (error) {
        console.error("City cannot be found")
        // forcefully terminates program
        process.exit(1)
    }
}

async function searchCities(input, id){

    const options = {
        method: 'GET',
        url: `https://wft-geo-db.p.rapidapi.com/v1/geo/cities/${id}/nearbyCities`,
        params: {
            radius: input 
        },
        headers: {
            'X-RapidAPI-Key': key,
            'X-RapidAPI-Host': 'wft-geo-db.p.rapidapi.com'
        }
    };

    try {
        const response = await axios.request(options);

        nearbyCities = response.data.data

        console.log("Some cities close are:")
        for (let i = 0; i < nearbyCities.length; i++) {
            // access each piece of city data
            // and print the city
            console.log(`\t${nearbyCities[i].city}`)
        }
        process.exit(1)

    } catch (error) {
        console.log("No nearby cities")
        process.exit(1)
    }
}
