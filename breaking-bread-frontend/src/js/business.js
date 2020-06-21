class Business {
   constructor(business) {
      this.id = business.id;
      this.name = business.name;
      this.phone = business.phone;
      this.website = business.website;
      this.instagram = business.instagram;
      this.neighborhood = business.neighborhood.id;
      // debugger
      Business.all.push(this);
   }

   renderBusiness() {  
      return `<li class="text-justify my-4" data-business-id=${this.id} style="width: 300px">
         <span style="font-weight: 600">${this.name}</span><br>
         Ph: ${this.phone}<br>
         IG: ${this.instagram}<br>
         <a href="${this.website}" target="_blank">>> Go to website</a>
      </li>`
   }
}

Business.all = [];