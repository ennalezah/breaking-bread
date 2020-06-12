const businessesUrl = "http://localhost:3000/api/v1/businesses"

const citiesUrl = "http://localhost:3000/api/v1/cities/"

function onLoad() {
  const newForm = document.getElementById("new-business-form");
  

  fetchBusinesses();
  fetchCities();

  newForm.addEventListener("submit", newFormHandler);
}


/* BUSINESS */

function fetchBusinesses() {
  fetch(businessesUrl)
    .then(resp => resp.json())
    .then(json => {
      return json.forEach(obj => renderBusiness(obj))
    })   
}

function renderBusiness(business) {  
  const ul = document.getElementById("business-list")

  const li = document.createElement("li");
  li.dataset.id = business.id;
  li.innerHTML = `<a href="${business.website}" target="_blank">${business.name}</a>`;

  const info = document.createElement("p");
  info.innerHTML = `${business.phone}<br>${business.instagram}`
  li.appendChild(info);

  ul.appendChild(li);
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
      // console.log(json)
      renderBusiness(json);
      // debugger
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


/* CITY */

function fetchCities() {
  fetch(citiesUrl)
    .then(resp => resp.json())
    .then(json => {
      return json.forEach(obj => renderCity(obj))
    })
}

function renderCity(city) {
  const cityContainer = document.getElementById("city");
  
  const headerName = document.createElement("h1");
  headerName.innerText = city.name;

  cityContainer.appendChild(headerName);
  // debugger 
}





onLoad();