const businessesUrl = "http://localhost:3000/api/v1/businesses"

const citiesUrl = "http://localhost:3000/api/v1/cities/"

function onLoad() {
    /* 
    if business.neighborhood.id === e.target.dataset.id, then display business info (ul)
  */  
    
  fetchCities();  
  fetchBusinesses();
  // debugger

  const newForm = document.getElementById("new-business-form");
  
  document.addEventListener("click", neighborhoodHandler)

  newForm.addEventListener("submit", newFormHandler);
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
    // .then(json => {
    //   // return json.forEach(obj => renderCity(obj))
    //   for (const obj of json) {

    //   }
    // })
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

  // const neighborhoodContainer = document.createElement("div");

  neighborhoods.innerHTML += `<div class='neighborhood' data-id=${neighborhood.id}><h3 class="neighborhood-name">${neighborhood.name}</h3></div>`

  const neighborhoodName = document.getElementsByClassName("neighborhood-name");

  // const neighborhoodHeader = document.createElement("h3");

  // neighborhoodContainer.className += "neighborhood";
  // neighborhoodContainer.dataset.id  = neighborhood.id;
  
  // neighborhoodName.innerText = neighborhood.name;

  // neighborhoodContainer.append(neighborhoodName);

  // neighborhoods.append(neighborhoodContainer);  
}


/* BUSINESS */
function fetchBusinesses() {
  fetch(businessesUrl)
    .then(resp => resp.json())
    .then(json => {
      json.forEach(obj => renderBusiness(obj))
    })
}

function renderBusiness(business) {  
  // const ul = document.querySelector(".business-list")

  const ul = document.createElement("ul");
  // ul.className = "businesses";
  // const ul = document.getElementsByClassName("businesses");

  const li = document.createElement("li");

  li.dataset.id = business.id;
  li.innerHTML = `<a href="${business.website}" target="_blank">${business.name}</a>`;

  const info = document.createElement("p");
  info.innerHTML = `${business.phone}<br>${business.instagram}`;

  li.append(info);
  ul.append(li);

  let n = document.querySelector(".neighborhood");

  // n.append(ul);
  // debugger
}

function submitFormData(name, phone, website, instagram, neighborhood_id) {
  let formData = {name, phone, website, instagram, neighborhood_id};

  let configObj = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(formData)
  };

  fetch(url, configObj)
    .then(resp => resp.json())
    .then(json => {
      renderBusiness(json);
    })
}

function newFormHandler(e) {
  e.preventDefault();

  const name = document.getElementById("new-name").value;
  const phone = document.getElementById("new-phone").value;
  const website = document.getElementById("new-website").value;
  const instagram = document.getElementById("new-ig").value;
  const neighborhoodId = parseInt(document.getElementById("new-neighborhoods").value);

  submitFormData(name, phone, website, instagram, neighborhoodId);
}






onLoad();