const url = "http://localhost:3000/api/v1/businesses"

function onLoad() {
  fetchBusinesses();
}

function fetchBusinesses() {
  fetch(url)
    .then(resp => resp.json())
    .then(json => {
      console.log(typeof json)
      debugger
    })   
}

onLoad();