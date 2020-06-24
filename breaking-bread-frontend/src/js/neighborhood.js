class Neighborhood {
   constructor(neighborhood) {
      this.id = neighborhood.id;
      this.name = neighborhood.name;
      this.city - neighborhood.city;
      this.businesses = neighborhood.businesses;
      Neighborhood.all.push(this);
   }

   renderNeighborhood() {
      const neighborhoodsContainer = document.querySelector(".city-neighborhoods");

      neighborhoodsContainer.innerHTML += `<div class="neighborhood" data-neighborhood-id="${this.id}"><h4 class="neighborhood-name text-uppercase mb-4">${this.name}</h4><ul class="list-unstyled" data-neighborhood-businesses="${this.id}"></ul><hr class="my-4"></div>` 
   }

   addToNewForm() {
      const dropdown = document.querySelector("select#new-neighborhood");

      dropdown.innerHTML += `<option value="${this.id}">${this.name}</option>`;
   }
}

Neighborhood.all = [];