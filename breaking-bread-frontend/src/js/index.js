const citiesUrl = "http://localhost:3000/api/v1/cities"
const neighborhoodsUrl = "http://localhost:3000/api/v1/neighborhoods"
const businessesUrl = "http://localhost:3000/api/v1/businesses"


document.addEventListener("DOMContentLoaded", onLoad)

function onLoad() {    
  fetchCities();  
  fetchNeighborhoods();  
  fetchBusinesses();

  document.getElementById("new-business-form").addEventListener("submit", newFormHandler);
}

/****** CITY ******/
function fetchCities() {
  fetch(citiesUrl)
    .then(resp => resp.json())
    .then(json => json.forEach(obj => renderCity(obj))) 
}

function renderCity(city) {
  let citySection = document.querySelector("#black-owned-businesses");

  citySection.dataset.cityId = `${city.id}`
  // citySection.innerHTML += `<h1 class="city-name">${city.name}</h1>
  // <div class="neighborhoods"></div>`
  citySection.innerHTML += `<div class="city-neighborhoods"></div>`

  city.neighborhoods.forEach(neighborhood => renderNeighborhood(neighborhood));
}


/****** NEIGHBORHOOD ******/
function fetchNeighborhoods() {
  fetch(neighborhoodsUrl)
    .then(resp => resp.json())
    .then(json => console.log(json)) 
    // .then(json => json.forEach(obj => renderNeighborhood(obj))) 
}

function renderNeighborhood(neighborhood) {
  addNeighborhoodstoNewForm(neighborhood);

  const neighborhoods = document.querySelector(".city-neighborhoods");
  
  // neighborhoods.innerHTML += '<div class="row"></div>'

  const neighborhoodContainer = document.createElement("div");

  neighborhoodContainer.className += "neighborhood";

  neighborhoodContainer.dataset.neighborhoodId = `${neighborhood.id}`;

  neighborhoodContainer.innerHTML += `<h4 class="neighborhood-name">${neighborhood.name}</h4><ul class="list-unstyled" data-neighborhood-businesses="${neighborhood.id}"></ul><hr class="my-4">`

  neighborhoods.appendChild(neighborhoodContainer);   
}

function addNeighborhoodstoNewForm(neighborhood) {
  const dropdown = document.querySelector("select#new-neighborhood");

  const option = `<option value="${neighborhood.id}">${neighborhood.name}</option>`

  dropdown.innerHTML += option;
}


/****** BUSINESS ******/
function fetchBusinesses() {
  fetch(businessesUrl)
    .then(resp => resp.json())
    .then(json => json.forEach(obj => renderBusiness(obj)))
}

function renderBusiness(business) {  
  const ul = document.querySelector(`[data-neighborhood-businesses="${business.neighborhood.id}"]`);

  let li = document.createElement("li");

  li.dataset.businessId = business.id;

  li.innerHTML += `<br><strong>${business.name}</strong><br>Ph: ${business.phone}<br>IG: ${business.instagram}<br><a href="${business.website}" target="_blank">Go to website</a>`;

  ul.appendChild(li);
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
    .then(json => renderBusiness(json))
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

  alert("Thank you for adding to the list!");
  // name.value = '';
  // phone.value = '';
  // website.value = '';
  // instagram.value = '';
  // neighborhoodId.value = '';  
}






// onLoad();