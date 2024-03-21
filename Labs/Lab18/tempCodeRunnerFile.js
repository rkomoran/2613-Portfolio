	equals(city){
		if (this.name === city.name){
			if (this.population === city.population){
				return true;
			}
		}
		return false;
	}