const citiesUrl = "http://localhost:3000/api/v1/cities"
const neighborhoodsUrl = "http://localhost:3000/api/v1/neighborhoods"
const businessesUrl = "http://localhost:3000/api/v1/businesses"


document.addEventListener("DOMContentLoaded", onLoad)

function onLoad() {    
  fetchCities();
  // fetchNeighborhoods();  
  fetchBusinesses();

  document.getElementById("new-business-form").addEventListener("submit", newFormHandler);

  document.getElementById("sort").addEventListener("click", handleSortBtn);
}

function handleSortBtn(e) {
  let items = document.querySelectorAll("li");
  items.forEach(item => item.remove());

  const businesses = Business.all;
  const copyBusinesses = [...businesses]; 

  let sortedBusinesses = copyBusinesses.sort((a, b) => (a.name > b.name) ? 1 : -1)
  // debugger

  for (const business of sortedBusinesses) {    
    business.addBusinessToNeighborhood();
  }

  // for (const neighborhood of neighborhoods) {
  //   let neighborhoodBusinesses = copyBusinesses.filter(business => business.neighborhood_id === neighborhood.id);

  //   let sortedBiz = neighborhoodBusinesses.sort((a, b) => (a.name > b.name) ? 1 : -1)
  //   // debugger

  //   sortedBiz.forEach(biz => {
  //     let newBiz = new Business(biz);
  //     newBiz.addBusinessToNeighborhood();
  //   })    
  // }
}




/****** CITY ******/
function fetchCities() {
  fetch(citiesUrl)
    .then(resp => resp.json())
    .then(cities => { 
      for (const city of cities) {
        let newCity = new City(city);

        const citySection = document.querySelector("#black-owned-businesses");

        citySection.innerHTML += newCity.renderCity();

        newCity.neighborhoods.forEach(neighborhood => {
          let newNeighborhood = new Neighborhood(neighborhood);
          newNeighborhood.renderNeighborhood();
          newNeighborhood.addToNewForm();     
        })
      }
    })
}


/****** BUSINESS ******/
function fetchBusinesses() {
  fetch(businessesUrl)
    .then(resp => resp.json())
    .then(businesses => {
      businesses.forEach(business => {
        let newBusiness = new Business(business);
        newBusiness.addBusinessToNeighborhood();
      })
    })
}

function submitNewForm(name, phone, website, instagram, neighborhood_id) {
  let businessData = {name, phone, website, instagram, neighborhood_id};

  let configObj = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(businessData)
  };

  fetch(businessesUrl, configObj)
    .then(resp => resp.json())
    .then(business => {
      let newBusiness = new Business(business);
      newBusiness.addBusinessToNeighborhood();
    })
}

function newFormHandler(e) {
  e.preventDefault();

  const name = document.getElementById("new-name").value;
  const phone = document.getElementById("new-phone").value;
  const website = document.getElementById("new-website").value;
  const instagram = document.getElementById("new-ig").value;
  const neighborhoodId = parseInt(document.getElementById("new-neighborhood").value);

  submitNewForm(name, phone, website, instagram, neighborhoodId);

  document.getElementById("new-business-form").reset();

  alert(`${name} has been added. Thank you!`);
}