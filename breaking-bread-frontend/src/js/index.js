const url = "http://localhost:3000/api/v1/businesses"

function onLoad() {
  const newForm = document.getElementById("new-business-form");

  fetchBusinesses();

  newForm.addEventListener("submit", newFormHandler(e));
}

function fetchBusinesses() {
  fetch(url)
    .then(resp => resp.json())
    .then(json => {
      json.forEach(business => renderBusiness(business))
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

function submitFormData(name, phone, website, instagram, neighborhood) {
  let formData = {
    name: name,
    phone: phone,    
    website: website,
    instagram: instagram,
    neighborhood: neighborhood,
  };

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
      console.log(json)
      // debugger
    })
}

function newFormHandler(e) {
  e.preventDefault();

  const name = document.getElementById("new-name").value;
  const phone = document.getElementById("new-phone").value;
  const website = document.getElementById("new-website").value;
  const instagram = document.getElementById("new-ig").value;
  const neighborhood = document.getElementById("new-neighborhood").value;

  submitFormData(name, phone, website, instagram, neighborhood);
}



onLoad();