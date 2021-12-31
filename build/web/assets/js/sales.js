
//Si seleccionan paquetes
$(".tablePaquete tbody td input[type='checkbox']").click(()=>{
    $("#detalleVenta").html("");
    let costoPaquetes = calcularMontoPaquete();
    let costoServicios = calcularMontoServicio();
    $("#precioVenta").html((costoPaquetes + costoServicios).toFixed(2));
    
    $("#precioTotal").html((costoPaquetes+costoServicios).toFixed(2));
    $("#precioTotalInput").val((costoPaquetes+costoServicios).toFixed(2));
    
});

//Si seleccionan servicios
$(".tableServicio tbody td input[type='checkbox']").click(()=>{
    $("#detalleVenta").html("");
    let costoPaquetes = calcularMontoPaquete();
    let costoServicios = calcularMontoServicio();
    $("#precioVenta").html((costoPaquetes + costoServicios).toFixed(2));
    
    $("#precioTotal").html((costoPaquetes+costoServicios).toFixed(2));
    $("#precioTotalInput").val((costoPaquetes+costoServicios).toFixed(2));
    
    
});

//Si selecciona un cliente
$(".tableCliente tbody td input[type='radio']").click(()=>{
    let listaRadio = $(".tableCliente tbody td input[type='radio']");
    let tablaCliente = $("#tableCliente tbody tr");
    
    listaRadio.each((l)=>{
        if(listaRadio[l].checked){
            let fila = tablaCliente[l];
            let nombre = $($(fila).children(".nombreCliente")[0]).html();
            let apellido = $($(fila).children(".apellidoCliente")[0]).html();
            let dni = $($(fila).children(".dniCliente")[0]).html();
            $("#datosCliente").html(`${nombre}, ${apellido}. DNI: ${dni}`); 
            $("#idClienteSeleccionado").val(listaRadio[l].classList[1]);
        }
    });

});

//Si se selecciona un medio de pago
$("#medioPagoSelect").change(()=>{
    $("#medioDePago").html($("#medioPagoSelect option:selected").html());
    $("#medioPagoSeleccionado").val($("#medioPagoSelect option:selected").html());
})

function calcularMontoPaquete(){
    let listaCheckbox = $(".tablePaquete tbody td input[type='checkbox']");
    let tablaPaquete = $("#tablePaquete tbody tr");
    let listaId = $("#idPaqueteSeleccionados");
    let costoPaquetes = 0;
    let val = "";
    let seleccionados = 0;
    
    listaCheckbox.each((l)=>{
        if(listaCheckbox[l].checked){
            c = $(tablaPaquete[l]).find(".costo").html();
            costoPaquetes += parseFloat(c);
            descripcion = $(tablaPaquete[l]).find(".descripcion").html();
            costo = $(tablaPaquete[l]).find(".costo").html();
            //Agrego la descripcion al detalle
            $("#detalleVenta").html($("#detalleVenta").html() + `<li>Paquete: ${descripcion} - $${costo}</li>`);
            val += listaCheckbox[l].name + " ";
            listaId.val(val);
            seleccionados++;
        }
    });
    
    return costoPaquetes;
}

function calcularMontoServicio(){
    let listaCheckbox = $(".tableServicio tbody td input[type='checkbox']");
    let tablaServicio = $("#tableServicio tbody tr");
    let listaId = $("#idServicioSeleccionados");
    let costoServicios = 0;
    let val = "";
    let seleccionados = 0;
    
    listaCheckbox.each((l)=>{
        if(listaCheckbox[l].checked){
            c = $(tablaServicio[l]).find(".costo").html();
            costoServicios += parseFloat(c);
            descripcion = $(tablaServicio[l]).find(".descripcion").html();
            costo = $(tablaServicio[l]).find(".costo").html();
            //Agrego la descripcion al detalle
            $("#detalleVenta").html($("#detalleVenta").html() + `<li>Servicio: ${descripcion} - $${costo}</li>`);
            val += listaCheckbox[l].name + " ";
            listaId.val(val);
            seleccionados++;
        }
    });
    
    return costoServicios;
}
