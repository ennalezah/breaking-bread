const businessesUrl = "http://localhost:3000/api/v1/businesses"

const citiesUrl = "http://localhost:3000/api/v1/cities/"

function onLoad() {
    
  fetchCities();  
  fetchBusinesses();
  
  document.addEventListener("click", neighborhoodHandler)

  document.getElementById("new-business-form").addEventListener("submit", newFormHandler);
}


function neighborhoodHandler(e) {
  console.log(e.target.dataset.id);
} 



/* CITY */
function fetchCities() {
  fetch(citiesUrl)
    .then(resp => resp.json())
    .then(json => {
      return json.forEach(obj => renderCity(obj))
    })
}

function renderCity(city) {
  // debugger
  const cityName = document.getElementById("city-name");
  cityName.innerText = city.name;

  city.neighborhoods.forEach(neighborhood => renderNeighborhood(neighborhood));
}


/* NEIGHBORHOOD - Left Col*/
function renderNeighborhood(neighborhood) {
  const neighborhoods = document.querySelector(".neighborhoods");  

  const neighborhoodContainer = document.createElement("div");
  neighborhoodContainer.className += "neighborhood";
  neighborhoodContainer.dataset.neighborhoodId = `${neighborhood.id}`;

  neighborhoodContainer.innerHTML += `<h3>${neighborhood.name}</h3><ul data-neighborhood-businesses="${neighborhood.id}"></ul>`

  const neighborhoodName = document.getElementsByClassName("neighborhood-name");

  neighborhoods.append(neighborhoodContainer);  

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
      json.forEach(obj => renderBusiness(obj))
      // renderBusinesses(json)
    })
    // .then(json => json)
}

function renderBusiness(business) {  
  const businessList = document.querySelector(`[data-neighborhood-businesses="${business.neighborhood.id}"]`);

  const neighborhoodId = businessList.getAttribute('data-neighborhood-businesses');  

  const li = document.createElement("li");

  li.dataset.businessId = business.id;
  // li.innerHTML += `<a href="${business.website}" target="_blank">${business.name}</a>`;
  li.innerHTML += `<strong>${business.name}</strong><br>Ph: ${business.phone}<br>IG: ${business.instagram}<br><a href="${business.website}" target="_blank">Go to website</a>`;

  businessList.append(li);
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
}






onLoad();