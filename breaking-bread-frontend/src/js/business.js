class Business {
   constructor(business) {
      this.id = business.id
      this.name = business.name
      this.phone = business.phone
      this.website = business.website
      this.instagram = business.instagram
      this.neighborhood_id = business.neighborhood.id
      debugger
      Business.all.push(this)
   }
}

Business.all = [];