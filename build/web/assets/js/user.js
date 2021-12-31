
//----------------------------------------------------------------------------------
//                                   USER.JSP
//----------------------------------------------------------------------------------

//Desactivamos el formulario que muestra los datos del empleado
$("#dataEmpleadoForm :input").prop("readonly",true)
                             .css("background-color","#f7f7f7");
                

//Se presiona el boton de "Modificar datos" del empleado
$("#modificarEmpleadoBtn").click(()=>{
    //Se habilitan los campos 
    $("#dataEmpleadoForm :input").prop("readonly",false)
                                 .addClass("bg-transparent");
    //Se oculta el boton de "modificar datos" y se muestra el de "Actualizar datos"
    $("#modificarEmpleadoBtn").addClass("d-none");
    $("#actualizarEmpleadoBtn").removeClass("d-none")
                               .removeClass("bg-transparent");
    $("#actualizarEmpleadoBtn").css("background-color","#ef8157");
});

//Si se presiona el boton "Actualizar datos"
$("#actualizarEmpleadoBtn").click(()=>{
    //Se validan los datos ingresados
    
})

