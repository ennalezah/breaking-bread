const businessesUrl = "http://localhost:3000/api/v1/businesses"

const citiesUrl = "http://localhost:3000/api/v1/cities"


document.addEventListener("DOMContentLoaded", onLoad)

function onLoad() {    
  fetchCities();  
  fetchBusinesses();
  
  // const x = document.querySelectorAll('h3.neighborhood-name').forEach(name => {
  //   name.addEventListener('click', neighborhoodHandler)
  // })

  document.getElementById("new-business-form").addEventListener("submit", newFormHandler);
}


// displays businesses when neighborhood is clicked on
// function neighborhoodHandler(e) {
//   console.log(e.target);
// } 


/* CITY */
function fetchCities() {
  fetch(citiesUrl)
    .then(resp => resp.json())
    .then(json => {
      // for (const obj of json) {
      //   // debugger
      //   renderCity(obj)
      // }
      return json.forEach(obj => renderCity(obj))
    }) 
}

function renderCity(city) {
  // debugger
  const cityName = document.querySelector(".city-name");
  cityName.innerText = city.name;

  city.neighborhoods.forEach(neighborhood => renderNeighborhood(neighborhood));
}


/* NEIGHBORHOOD - Left Col*/
function renderNeighborhood(neighborhood) {
  const neighborhoods = document.querySelector(".neighborhoods");  

  const neighborhoodContainer = document.createElement("div");
  neighborhoodContainer.className += "neighborhood";
  neighborhoodContainer.dataset.neighborhoodId = `${neighborhood.id}`;

  neighborhoodContainer.innerHTML += `<h3 class="neighborhood-name">${neighborhood.name}</h3>
  <ul data-neighborhood-businesses="${neighborhood.id}"></ul>`

  // const neighborhoodName = document.getElementsByClassName("neighborhood-name");

  neighborhoods.appendChild(neighborhoodContainer);  

  addNeighborhoodstoNewForm(neighborhood);
}

function addNeighborhoodstoNewForm(neighborhood) {
  const dropdown = document.querySelector("select#new-neighborhoods");

  const option = `<option value="${neighborhood.id}">${neighborhood.name}</option>`

  dropdown.innerHTML += option
}


/* BUSINESS */
function fetchBusinesses() {
  fetch(businessesUrl)
    .then(resp => resp.json())
    .then(json => {
      // console.log(json)
      // debugger
      for (const obj of json) {
        renderBusiness(obj)
      }
      // json.forEach(obj => renderBusiness(obj))
      // renderBusinesses(json)
    })
    // .then(json => json)
}

function renderBusiness(business) {  
  const ul = document.querySelector(`[data-neighborhood-businesses="${business.neighborhood.id}"]`);
  // debugger

  const neighborhoodId = ul.dataset.neighborhoodBusinesses;  

  const li = document.createElement("li");

  li.dataset.businessId = business.id;
  // li.innerHTML += `<a href="${business.website}" target="_blank">${business.name}</a>`;
  li.innerHTML += `<strong>${business.name}</strong><br>Ph: ${business.phone}<br>IG: ${business.instagram}<br><a href="${business.website}" target="_blank">Go to website</a>`;

  ul.appendChild(li);
}

function submitNewForm(name, phone, website, instagram, neighborhood_id) {
  let formData = {name, phone, website, instagram, neighborhood_id};

  let configObj = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(formData)
  };

  fetch(businessesUrl, configObj)
    .then(resp => resp.json())
    .then(json => {
      // console.log(json)
      // debugger
      renderBusiness(json);
    })
}

function newFormHandler(e) {

  e.preventDefault();
  // document.getElementById("new-business-form").reset();
  // debugger

  const name = document.getElementById("new-name").value;
  const phone = document.getElementById("new-phone").value;
  const website = document.getElementById("new-website").value;
  const instagram = document.getElementById("new-ig").value;
  const neighborhoodId = parseInt(document.getElementById("new-neighborhoods").value);

  submitNewForm(name, phone, website, instagram, neighborhoodId);
  document.getElementById("new-business-form").reset();
  alert("Thank you for adding to the list!")
  // name.value = '';
  // phone.value = '';
  // website.value = '';
  // instagram.value = '';
  // neighborhoodId.value = '';
  
}






// onLoad();