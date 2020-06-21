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
      // const ul = document.querySelector(`[data-neighborhood-businesses="${this.neighborhood}"]`);
      
      // let li = document.createElement("li");
      
      // li.dataset.businessId = this.id;
      // li.className = "text-justify"
      
      // li.innerHTML += `<br><strong>${this.name}</strong><br>Ph: ${this.phone}<br>IG: ${this.instagram}<br><a href="${this.website}" target="_blank">Go to website</a>`;
      // debugger

      return `<li class="text-justify" data-business-id=${this.id}>
         <strong>${this.name}</strong><br>
         Ph: ${this.phone}<br>
         IG: ${this.instagram}<br>
         <a href="${this.website}" target="_blank">Go to website</a>
      </li><br>`
   }



}

Business.all = [];