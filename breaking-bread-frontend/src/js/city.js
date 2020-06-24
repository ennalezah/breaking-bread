class City {
   constructor(city) {
      this.id = city.id;
      this.name = city.name;
      this.abbrev = city.abbrev;
      this.neighborhoods = city.neighborhoods;
      City.all.push(this);
   }

   renderCity() {    
      return `<div class="city-neighborhoods container" data-city-id="${this.id}" align="center"></div>`
   }
}

City.all = []