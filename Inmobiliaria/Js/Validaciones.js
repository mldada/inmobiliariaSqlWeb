$("btnActualizar").click(function validar() {
    var importe, superficie, calle, altura, descripcion, ambientes, piso, depto;
    importe = document.getElementById("importe").value;
    superficie = document.getElementById("superficie").value;
    calle = getElementById("calle").value;
    altura = document.getElementById("altura").value;
    descripcion = document.getElementById("descripcion").value;
    ambientes = document.getElementById("ambientes").value;
    piso = document.getElementById("piso").value;
    depto = document.getElementById("depto").value;
    
})

if (importe === "" || superficie === "" || calle === "" || altura === "" || descripcion === "" || ambientes === "" || piso === "" || depto === "" ) {
    alert("El campo importe esta vacio");
    return false;
}
