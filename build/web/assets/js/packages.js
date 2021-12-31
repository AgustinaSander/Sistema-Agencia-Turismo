//Mostrar el formulario de registro de nuevo usuario
$("#registerBtn").click(()=>{
    $("#registerForm").css("display","block")
})

//Actualizar monto total del paquete y descripcion
$(".tablePaquete tbody td input[type='checkbox']").click(()=>{
    let listaCheckbox = $(".tablePaquete tbody td input[type='checkbox']");
    let tabla = $("#servicesTable tr");
    let listaId = $("#idSeleccionados");
    
    
    let costo = 0;
    let descripcion = "";
    let val = "";
    let seleccionados = 0;
    listaCheckbox.each((l)=>{
        if(listaCheckbox[l].checked){
            c = $(tabla[l]).find(".costo").html();
            costo += parseFloat(c);
            descripcion += $(tabla[l]).find(".nombre").html() + " - ";
            val += listaCheckbox[l].name + " ";
            listaId.val(val);
            seleccionados ++;
        }
    });
    $("#descripcionPaquete").val(descripcion);
    $("#precioPaquete").html(costo.toFixed(2));
    
    let descuento = $("#descuentoSelect").val();
    let precioDescuento = ((descuento/100)*costo).toFixed(2);
    $("#precioDescuento").html(precioDescuento);
    $("#precioTotal").html((costo-precioDescuento).toFixed(2));
    $("#precioTotalInput").val((costo-precioDescuento).toFixed(2));
    //Activar el boton
    if(seleccionados > 0){
        $("#agregarPaqueteBtn").attr("disabled",false);
    }
    else{
        $("#agregarPaqueteBtn").attr("disabled",true);        
    }
});

//Lista desplegable de descuentos
$("#descuentoSelect").change(()=>{
    let descuento = $("#descuentoSelect").val();
    let precioPaquete = $("#precioPaquete").html();
    let precioDescuento = ((descuento/100)*precioPaquete).toFixed(2);
    $("#precioDescuento").html(precioDescuento);
    $("#precioTotal").html((precioPaquete-precioDescuento).toFixed(2));
    
    $("#precioTotalInput").val((precioPaquete-precioDescuento).toFixed(2));
});


function validarPaquete(form){
    if($("#descripcionPaquete").val()==""){
        $("#descripcionPaquete").addClass("border-danger");
        let mensajeError = $("#descripcionPaquete").siblings()[1];
        $(mensajeError).html("El campo es obligatorio.");
        return false;
    }
    else if($("#descripcionPaquete").val().length>100){
        $("#descripcionPaquete").addClass("border-danger");
        let mensajeError = $("#descripcionPaquete").siblings()[1];
        $(mensajeError).html("Debe tener como maximo 100 caracteres.");
        return false;
    }
    else{
        $("#descripcionPaquete").removeClass("border-danger");
        let mensajeError = $("#descripcionPaquete").siblings()[1];
        $(mensajeError).html("");
        return true;
    }
}