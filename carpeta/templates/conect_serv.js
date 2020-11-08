
function print_data(){
  alert("hasta aqui");
  var xhttp = new XMLHttpRequest();

  xhttp.onreadystatechange = function (){
    if(this.readyState==4 && this.status==200)
    {
      alert(this.responseText);
    }
  };

  data = "nomb="+ document.getElementById("nombre").value;
  alert(data);
  xhttp.open("GET", "/exec_serv?" + data, true);
  xhttp.send();
}
//var oJSON = JSON.parse(this.responseText);

// document.getElementById("nomb").value = oJSON.nombre;
// document.getElementById("apel").value = oJSON.apellido;
// document.getElementById("edad").value = oJSON.edad;
