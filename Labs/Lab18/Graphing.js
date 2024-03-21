//TODO: Create a City class. It should take the name and the population as instance vars.
class City{
	constructor(name, population){
		this.name = name;
		this.population = population;
	}

	//It should have an equals method that takes another city as a parameter
	//and returns true if this city's name and population match the other city's name and population
	equals(city){
		if (this.name === city.name){
			if (this.population === city.population){
				return true;
			}
		}
		return false;
	}
}

class CityMap{
	//TODO: The programmer missed something in the constructor
	constructor(){
		this.adjacencyList = [];
	}

	addConnection(startCity, endCity, dist){
		//Adding first connection
		if(this.adjacencyList.length == 0){
			this.adjacencyList[0] = [startCity, [endCity], [dist]];
			this.adjacencyList[1] = [endCity, [startCity], [dist]];
		}
		else{
			//Check to see if startCity is in list
			let startCityFound = -1;
			for(let i = 0; i < this.adjacencyList.length; i++){
				if(this.adjacencyList[i][0].equals(startCity)){
					startCityFound = i;
					break;
				}
			}
			//startCity already registered in list
			if(startCityFound >= 0){
				this.adjacencyList[startCityFound][1][this.adjacencyList[startCityFound][1].length] = endCity;
				this.adjacencyList[startCityFound][2][this.adjacencyList[startCityFound][2].length] = dist;
			}
			//startCity is not registered
			else{
				this.adjacencyList[this.adjacencyList.length] = [startCity, [endCity], [dist]];
			}


			//TODO: Check to see if endCity is already in the adjacency list
			let endCityFound = -1;
			for(let i = 0; i < this.adjacencyList.length; i++)
			{
				if(this.adjacencyList[i][0].equals(endCity))
				{
					endCityFound = i;
					break;
				}
			}
			//If it is, add a connection to the startCity
			if(endCityFound >= 0){
				this.adjacencyList[endCityFound][1][this.adjacencyList[endCityFound][1].length] = startCity;
				this.adjacencyList[endCityFound][2][this.adjacencyList[endCityFound][2].length] = dist;
			}
			//If it is not, add it to the adjacency list then add its connection to startCity (could be one step)
			else{
				this.adjacencyList[this.adjacencyList.length] = [endCity, [startCity], [dist]];
			}
			//Review the steps above to see how it is done with startCity instead of endCity
		}
	}

	//TODO: Create a printMap() function that takes no parameters and prints the 
		//entire map. It should match the styling from the lab document.
	printMap()
	{
		for (let i = 0; i < this.adjacencyList.length; i++)
		{
			let city = this.adjacencyList[i][0];
			console.log(`${city.name}`);

			for (let j = 0; j < this.adjacencyList[i][1].length; j++)
			{
				let endCity = this.adjacencyList[i][1][j];
				let distance = this.adjacencyList[i][2][j];
				console.log(`\t${endCity.name} ${distance}km`);

			}
		}
	}
}

//Main code goes here...

//TODO: Create the four cities listed on the lab document
let bathurst = new City("Bathurst", 120);
let edmundston = new City("Edmundston", 80);
let campbellton = new City("Campbellton", 200);
let miramichi = new City("Miramichi", 40);

//TODO: Create a map and add connections between Bathurst-Miramichi, Bathurst-Edmundston
//Bathurst-Campbellton, and Edmundston-Campbellton
let cityMap = new CityMap()
cityMap.addConnection(bathurst, miramichi, 75.9);
cityMap.addConnection(bathurst, edmundston, 248);
cityMap.addConnection(bathurst, campbellton, 108);
cityMap.addConnection(edmundston, campbellton, 200);

//TODO: Print the map using your the function you created
cityMap.printMap()



