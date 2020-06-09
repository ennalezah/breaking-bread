const url = "http://localhost:3000/api/v1/businesses"

function onLoad() {
  fetchBusinesses();
}

function fetchBusinesses() {
  fetch(url)
    .then(resp => resp.json())
    .then(json => {
      json.forEach(business => renderBusiness(business))
    })   
}

function renderBusiness(business) {  
  const ul = document.getElementById("businessList")

  const li = document.createElement("li");
  li.dataset.id = business.id;
  li.innerHTML = `<a href="${business.website}" target="_blank">${business.name}</a>`;

  const info = document.createElement("p");
  info.innerHTML = `${business.phone}<br>${business.instagram}`
  li.appendChild(info);

  ul.appendChild(li);
}








onLoad();