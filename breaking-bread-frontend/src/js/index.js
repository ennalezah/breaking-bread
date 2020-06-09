const url = "http://localhost:3000/api/v1/businesses"

function onLoad() {
  fetchBusinesses();
}

function fetchBusinesses() {
  fetch(url)
    .then(resp => resp.json())
    .then(json => {
      json.forEach(business => {
        renderBusiness(business)
      });
      // console.log(json)
      // debugger
    })   
}

function renderBusiness(business) {  
  const ul = document.getElementById("businessList")

  const li = document.createElement("li");
  li.dataset.id = business.id;
  li.innerText = business.name;

  ul.appendChild(li);


}








onLoad();