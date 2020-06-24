class Neighborhood {
   constructor(neighborhood) {
      this.id = neighborhood.id;
      this.name = neighborhood.name;
      this.businesses = neighborhood.businesses;
      Neighborhood.all.push(this);
   }

   renderNeighborhood() {
      
   }
}

Neighborhood.all = [];