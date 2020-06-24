class Neighborhood {
   constructor(neighborhood) {
      this.id = neighborhood.id;
      this.name = neighborhood.name;
      this.city - neighborhood.city;
      this.businesses = neighborhood.businesses;
      Neighborhood.all.push(this);
   }

   renderNeighborhood() {
      // addNeighborhoodtoNewForm(neighborhood);

      return `<div class="neighborhood" data-neighborhood-id="${this.id}"><h4 class="neighborhood-name text-uppercase mb-4">${this.name}</h4><ul class="list-unstyled" data-neighborhood-businesses="${this.id}"></ul><hr class="my-4"></div>` 
   }
}

Neighborhood.all = [];