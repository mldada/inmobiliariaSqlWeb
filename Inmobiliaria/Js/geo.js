
function findMe(){
    var output = document.getElementById('map');
    if(navigator.geolocation){
        output.innerHTML = "<p> Tu navegador soporta geo </p>"
    }
    else{
        output.innerHTML = "<p> No navegador soporta geo </p>"
    }

    function localizacion(posicion){
        var latitud = posicion.coords.latitud;
        var longitud = posicion.coords.longitud;

        output.innerHTML = "<p> Latitud: " + latitud + "<br>Longitud: " + longitud + "</p>"
        
        var imgURL= "http://maps.googleapis.com/maps/api/staticmap?center=" + latitud + "," + longitud +
                    "&size=600x300&markers=color:red%7C" + latitud + "," + longitud + 
                    "&key=AIzaSyAWvY_lAm4lJad0T55XcmFNRTFIGp5ahOQ";
        
                    output.innerHTML = "<img src='" + imgURL + "'>";
    
    }
    function error(){
        output.innerHTML = "<p> No se pudo abtener tu ubicacion</p>"
    }
    navigator.geolocation.getCurrentPosition(localizacion, error);
}