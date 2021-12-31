// -------------------------------------------------------------------------
//         Validaciones de formulario de LOGIN DE USUARIO
// -------------------------------------------------------------------------

function validarLoginForm(form){
    let nombreUsuario = form.usuario;
    let passUsuario = form.contrasena;
    let esValido = true;
    
    //Validacion nombre de usuario
    if(nombreUsuario.value=="" || nombreUsuario.value=="Nombre de usuario"){
        nombreUsuario.focus();
        nombreUsuario.select();
        mostrarMensajeError(nombreUsuario, `El campo es obligatorio.`);
        esValido = false;
    }
    else{
        ocultarMensajeErrorLogin(nombreUsuario);
    }
    
    //Validacion contrasena
    if(passUsuario.value=="" || passUsuario.value=="Contrasena"){
        passUsuario.focus();
        passUsuario.select();
        mostrarMensajeError(passUsuario,`El campo es obligatorio.` );
        esValido = false;
    }
    else{
        ocultarMensajeErrorLogin(passUsuario);
    }
    
    return esValido;
};


// -------------------------------------------------------------------------
//         Validaciones de formulario de REGISTRO DE USUARIO
// -------------------------------------------------------------------------

function validarRegistroForm(form){
    let esValido = true;
    
    //Se validan los campos obligatorios
    let nombre = form.nombre;
    esValido = !validarNombre(nombre) ? false : esValido;
    
    
    let apellido = form.apellido;
    esValido = !validarApellido(apellido) ? false : esValido;
    
    //Se valida que tenga entre 7 y 10 digitos
    let dni = form.dni;
    esValido = !validarDni(dni) ? false : esValido;
    
    //Se valida que tenga el formato +<cod.pais><9><10 digitos>
    let celular = form.tel;
    esValido = !validarTelefono(celular) ? false : esValido;
    
    //Se valida el formato de mail xxxx@xxxxx.xxx 
    let email = form.email;
    esValido = !validarEmail(email) ? false : esValido;
    
    //Se valida que este entre 01-01-1870 y el dia actual
    let fecha = form.fechaNac;
    esValido = !validarFechaNac(fecha) ? false : esValido;
       
    //Se valida que tenga entre 2-50 caracteres
    let nacionalidad = form.nacionalidad;
    esValido = !validarNacionalidad(nacionalidad) ? false : esValido;
    
    //Se valida que tenga entre 4 y 50 caracteres
    let puesto = form.puesto;
    esValido = !validarPuesto(puesto) ? false : esValido;
    
    //Se valida que sea un numero positivo
    let sueldo = form.sueldo;
    esValido = !validarSueldo(sueldo) ? false : esValido;

    //Se valida que tenga como maximo 50 caracteres
    let calle = form.calle;
    esValido = !validarCalle(calle) ? false : esValido;

    //Se valida que sea un numero entero
    let numero = form.numero;
    esValido = !validarNumero(numero) ? false : esValido;

    //Opcional, se valida longitud maxima 20 caracteres
    let depto = form.depto;
    esValido = !validarDepto(depto) ? false : esValido;

    //Se valida maximo de 5 digitos
    let cp = form.cp;
    esValido = !validarCP(cp) ? false : esValido;
    
    //Se valida que tenga entre 2-50 caracteres
    let localidad = form.localidad;
    esValido = !validarLocalidad(localidad) ? false : esValido;
 
    //Se valida que tenga entre 2-50 caracteres
    let provincia = form.provincia;
    esValido = !validarProvincia(provincia) ? false : esValido;

    //Se valida que tenga entre 2-50 caracteres
    let pais = form.pais;
    esValido = !validarPais(pais) ? false : esValido;
    
    //Se valida que tenga como minimo 4 y maximo 20 caracteres
    //Solo se permiten letras y numeros
    let nombreUsuario = form.usuario;
    esValido = !validarNombreUsuario(nombreUsuario) ? false : esValido;
    
    //Se valida que tenga como minimo 4 y maximo 30 caracteres
    //4-6 : Nivel de seguridad debil -> Amarillo
    //7-15 : Nivel de seguridad media -> Naranja
    //16-30 : Nivel de seguridad alta -> Roja
    let passUsuario = form.contrasena;
    esValido = !validarContrasena(passUsuario) ? false : esValido;
    
    return esValido;
};

// -------------------------------------------------------------------------
//         Validaciones de formulario de DATOS DE PERSONA
// -------------------------------------------------------------------------

function validarPersonaForm(form){
    let esValido = true;
    
    //Se validan los campos obligatorios
    let nombre = form.nombre;
    esValido = !validarNombre(nombre) ? false : esValido;
    
    let apellido = form.apellido;
    esValido = !validarApellido(apellido) ? false : esValido;
    
    //Se valida que tenga entre 7 y 10 digitos
    let dni = form.dni;
    esValido = !validarDni(dni) ? false : esValido;
    
    //Se valida que tenga el formato +<cod.pais><9><10 digitos>
    let celular = form.tel;
    esValido = !validarTelefono(celular) ? false : esValido;
    
    //Se valida el formato de mail xxxx@xxxxx.xxx 
    let email = form.email;
    esValido = !validarEmail(email) ? false : esValido;
    
    //Se valida que este entre 01-01-1870 y el dia actual
    let fecha = form.fechaNac;
    esValido = !validarFechaNac(fecha) ? false : esValido;
    
    //Se valida que tenga entre 2-50 caracteres
    let nacionalidad = form.nacionalidad;
    esValido = !validarNacionalidad(nacionalidad) ? false : esValido;
    
    //Se valida que tenga como maximo 50 caracteres
    let calle = form.calle;
    esValido = !validarCalle(calle) ? false : esValido;
    
    //Se valida que sea un numero entero
    let numero = form.numero;
    esValido = !validarNumero(numero) ? false : esValido;
    
    //Opcional, se valida longitud maxima 20 caracteres
    let depto = form.depto;
    esValido = !validarDepto(depto) ? false : esValido;
    
    //Se valida maximo de 5 digitos
    let cp = form.cp;
    esValido = !validarCP(cp) ? false : esValido;
    
    //Se valida que tenga entre 2-50 caracteres
    let localidad = form.localidad;
    esValido = !validarLocalidad(localidad) ? false : esValido;
    
    //Se valida que tenga entre 2-50 caracteres
    let provincia = form.provincia;
    esValido = !validarProvincia(provincia) ? false : esValido;
    
    //Se valida que tenga entre 2-50 caracteres
    let pais = form.pais;
    esValido = !validarPais(pais) ? false : esValido;
    
    return esValido;
}

// -------------------------------------------------------------------------
//         Validaciones de formulario de DATOS DE SERVICIO
// -------------------------------------------------------------------------

function validarServicioForm(form){
    let esValido = true;
    
    //Se validan los campos obligatorios
    let nombre = form.nombre;
    esValido = !validarNombreServicio(nombre) ? false : esValido;
 
    let destino = form.destino;
    esValido = !validarDestino(destino) ? false : esValido;
 
    //Se valida que tenga maximo 200 caracteres
    let descripcion = form.descripcion;
    esValido = !validarDescripcionServicio(descripcion) ? false : esValido;
    
    //Se valida que sea un numero positivo;
    let costo = form.costo;
    esValido = !validarCostoServicio(costo) ? false : esValido;

    //Se valida que sea mayor o igual al dia actual
    let fecha = form.fecha;
    esValido = !validarFechaDeServicio(fecha) ? false : esValido;
  
    return esValido;
}

// -------------------------------------------------------------------------
//         Validaciones de formulario de DATOS DE VENTA
// -------------------------------------------------------------------------

function validarVentaForm(form){
    let esValido = true;
    
    if($("#idClienteSeleccionado").val()==""){
        esValido = false;
        $("#errorCliente").html("Seleccione un cliente.");
    }
    else{
        $("#errorCliente").html("");
    }
    
    if(($("#idPaqueteSeleccionados").val()=="") && ($("#idServicioSeleccionados").val()=="")){
        esValido = false;
        $("#errorItems").html("Seleccione como minimo un paquete o un servicio.");
    }
    else{
        $("#errorItems").html("");
    }
    
    return esValido;
}

function bordeRojo(campo){
    $(campo).addClass("border-danger");
    let aux = $(campo).siblings()[0];
    let inputGroupText = $(aux).children()[0];
    $(inputGroupText).addClass("border-danger");
    let icon = $(inputGroupText).children();
    $(icon).addClass("text-danger");
}

function sinBorde(campo){
    $(campo).removeClass("border-danger");
    let aux = $(campo).siblings()[0];
    let inputGroupText = $(aux).children()[0];
    $(inputGroupText).removeClass("border-danger");
    let icon = $(inputGroupText).children();
    $(icon).removeClass("text-danger");
    
}

function mostrarMensajeError(campo, mensaje){
    let inputGroup = $(campo).parent()[0];
    let mensajeError = $(inputGroup).siblings();
    $(mensajeError).html(mensaje);
    bordeRojo(campo);
}

function ocultarMensajeErrorLogin(campo){
    let inputGroup = $(campo).parent()[0];
    let mensajeError = $(inputGroup).siblings();
    $(mensajeError).html("");
    sinBorde(campo);
}

function ocultarMensajeErrorRegistro(campo){
    let formGroup = $(campo).parent()[0];
    let mensajeError = $(formGroup).siblings()[0];
    $(mensajeError).html("");
    sinBorde(campo);
}

function esNumeroEntero(valor){
    let num = parseInt(valor);
    if(isNaN(num)){
        return false;
    }
    else if(Number.isInteger(num)){
        return true;
    }
    
    return false;
}

function esNumeroPositivo(valor){
    let signo = Math.sign(valor);
    if(!isNaN(signo) && signo == 1){
        return true;
    }
    
    return false;
}

function validarFormatoCelular(celular){
    //Expresion regular: + <codPais> 9(opcional) <10 digitos>
    let regex = /^\+[0-9]{2}9?[0-9]{10}$/mg;
    let res = regex.test(celular);
    return res;
}

function validarFormatoEmail(email){
    let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    let res = regex.test(email);
    return res;
}

function validarFecha(fecha){
    //Se valida que se encuentre entre el 01/01/1870 y el dia actual incluidos
    let partes = fecha.split('-');
    let fechaDate = new Date(partes[0], partes[1] - 1, partes[2]); 
    if(fechaDate >= new Date(1870,0,01) && fechaDate < new Date()){
        return true;
    }
    return false;
}

function validarExpresionNombreUsuario(nombre){
    //Se valida que tenga un largo de entre 4-20 caracteres incluidos
    //Solo se permiten letras y numeros
    let regex = /^\w{4,20}$/;
    let res = regex.test(nombre);
    return res;
}

function validarExpresionContrasena(pass){
    //Se valida que tenga como minimo 4 y maximo 30 caracteres
    let largo = pass.length;
    
    if(largo < 4 || largo > 30){
        return false;
    }
    return true;
}

function validarNombre(nombre){
    if(nombre.value == ""){
        mostrarMensajeError(nombre, `El campo es obligatorio.`);
        return false;
    }

    ocultarMensajeErrorRegistro(nombre);
    return true;
}

function validarApellido(apellido){
    if(apellido.value == ""){
        mostrarMensajeError(apellido, `El campo es obligatorio.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(apellido);
    return true;
}

function validarDni(dni){
     if(dni.value == ""){
        mostrarMensajeError(dni, `El campo es obligatorio.`);
        return false;
    }
    else if(dni.value.length < 7 || dni.value.length > 10 || !esNumeroEntero(dni.value)){
        mostrarMensajeError(dni, `Formato de dni incorrecto.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(dni);
    return true;
}

function validarTelefono(celular){
    if(celular.value == ""){
        mostrarMensajeError(celular, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarFormatoCelular(celular.value)){
        mostrarMensajeError(celular, `Formato de celular incorrecto. Ej: +5493424227082`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(celular);
    return true;
}

function validarEmail(email){
    if(email.value == ""){
        mostrarMensajeError(email, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarFormatoEmail(email.value)){
        mostrarMensajeError(email, `Formato de email incorrecto. Ej: xxxx@xxxxx.xxx`);
        return false;
    }

    ocultarMensajeErrorRegistro(email);
    return true;
}

function validarFechaNac(fecha){
    if(fecha.value == ""){
        mostrarMensajeError(fecha, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarFecha(fecha.value)){
        mostrarMensajeError(fecha, `La fecha debe estar entre 01/01/1870 y el dia actual.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(fecha);
    return true;
}

function validarNacionalidad(nacionalidad){
    if(nacionalidad.value == ""){
        mostrarMensajeError(nacionalidad, `El campo es obligatorio.`);
        return false;
    }
    else if(nacionalidad.value.length < 2 || nacionalidad.value.length > 50){
        mostrarMensajeError(nacionalidad, `Debe tener entre 2-50 caracteres.`)
        return false;
    }
    ocultarMensajeErrorRegistro(nacionalidad);
    return true;
}

function validarPuesto(puesto){
    if(puesto.value == ""){
        mostrarMensajeError(puesto, `El campo es obligatorio.`);
        return false;
    }
    else if(puesto.value.length < 4 || puesto.value.length > 50){
        mostrarMensajeError(puesto, `Debe tener entre 4-50 caracteres.`);
        return false;
    }

    ocultarMensajeErrorRegistro(puesto);
    return true;
}

function validarSueldo(sueldo){
    if(sueldo.value == ""){
        mostrarMensajeError(sueldo, `El campo es obligatorio.`);
        return false;
    }
    else if(!esNumeroPositivo(sueldo.value)){
        mostrarMensajeError(sueldo, `Debe ser un numero positivo.`);
        return false;
    }
 
    ocultarMensajeErrorRegistro(sueldo);
    return true;
}

function validarCalle(calle){
    if(calle.value == ""){
        mostrarMensajeError(calle, `El campo es obligatorio.`);
        return false;
    }
    else if(calle.value.length > 50){
        mostrarMensajeError(calle, `Debe tener como maximo 50 caracteres.`);
        return false;
    }
    ocultarMensajeErrorRegistro(calle);
    return true;
}

function validarNumero(numero){
    if(numero.value == ""){
        mostrarMensajeError(numero, `El campo es obligatorio.`);
        return false;
    }
    else if(!esNumeroEntero(numero.value)){
        mostrarMensajeError(numero, `Debe ser un numero.`);
        return false;
    }

    ocultarMensajeErrorRegistro(numero);
    return true;
}

function validarDepto(depto){
    if(depto.value != "" && depto.value.length > 20){
        mostrarMensajeError(depto, `Debe tener como maximo 20 caracteres.`);
        return false;
    }
    ocultarMensajeErrorRegistro(depto);
    return true;
}

function validarCP(cp){
    if(cp.value == ""){
        mostrarMensajeError(cp, `El campo es obligatorio.`);
        return false;
    }
    else if(!esNumeroEntero(cp.value) || cp.value.length > 5){
        mostrarMensajeError(cp, `Debe ser un numero de maximo 5 digitos.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(cp);
    return true;
}

function validarLocalidad(localidad){
    if(localidad.value == ""){
        mostrarMensajeError(localidad, `El campo es obligatorio.`);
        return false;
    }
    else if(localidad.value.length < 2 || localidad.value.length > 50){
        mostrarMensajeError(localidad, `Debe tener entre 2-50 caracteres.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(localidad);
    return true;
}

function validarProvincia(provincia){
    if(provincia.value == ""){
        mostrarMensajeError(provincia, `El campo es obligatorio.`);
        return false;
    }
    else if(provincia.value.length < 2 || provincia.value.length > 50){
        mostrarMensajeError(provincia, `Debe tener entre 2-50 caracteres.`);
        return false;
    }
    
    ocultarMensajeErrorRegistro(provincia);
    return true;   
}

function validarPais(pais){
    if(pais.value == ""){
        mostrarMensajeError(pais, `El campo es obligatorio.`);
        return false;
    }
    else if(pais.value.length < 2 || pais.value.length > 50){
        mostrarMensajeError(pais, `Debe tener entre 2-50 caracteres.`);
        return false;
    }
   
    ocultarMensajeErrorRegistro(pais);
    return true;
}

function validarNombreUsuario(nombreUsuario){
    if(nombreUsuario.value == ""){
        mostrarMensajeError(nombreUsuario, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarExpresionNombreUsuario(nombreUsuario.value)){
        mostrarMensajeError(nombreUsuario, `Debe tener entre 4 y 20 caracteres. Solo se permiten letras y numeros.`);
        return false;
    }
  
    ocultarMensajeErrorRegistro(nombreUsuario);
    return true;
}

function validarContrasena(passUsuario){
    if(passUsuario.value == ""){
        mostrarMensajeError(passUsuario, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarExpresionContrasena(passUsuario.value)){
        mostrarMensajeError(passUsuario, `Debe tener entre 4 y 30 caracteres.`);
        return false;
    }
    ocultarMensajeErrorRegistro(passUsuario);
    return true;    
}

function validarNombreServicio(nombre){
    if(nombre.value == "Seleccionar"){
        mostrarMensajeError(nombre, `El campo es obligatorio.`);
        return false;
    }
    ocultarMensajeErrorRegistro(nombre);
    return true;
}

function validarDestino(destino){
    if(destino.value == ""){
        mostrarMensajeError(destino, `El campo es obligatorio.`);
        return false;
    }
  
    ocultarMensajeErrorRegistro(destino);
    return true;
}

function validarDescripcionServicio(descripcion){
    if(descripcion.value == ""){
        mostrarMensajeError(descripcion, `El campo es obligatorio.`);
        return false;
    }
    else if(descripcion.value.length > 200){
        mostrarMensajeError(descripcion, `Debe tener como maximo 200 caracteres.`);
        return false;
    }
    ocultarMensajeErrorRegistro(descripcion);
    return true;
}

function validarCostoServicio(costo){
    if(costo.value == ""){
        mostrarMensajeError(costo, `El campo es obligatorio.`);
        return false;
    }
    else if(!esNumeroPositivo(costo.value)){
        mostrarMensajeError(costo, `Debe ser un numero positivo.`);
        return false;
    }

    ocultarMensajeErrorRegistro(costo);
    return true;
}

function validarFechaDeServicio(fecha){
    if(fecha.value == ""){
        mostrarMensajeError(fecha, `El campo es obligatorio.`);
        return false;
    }
    else if(!validarFechaServicio(fecha.value)){
        mostrarMensajeError(fecha, `La fecha debe ser mayor o igual al dia actual.`);
        return false;
    }

    ocultarMensajeErrorRegistro(fecha);
    return true;
}

function validarFechaServicio(fecha){
    //Se valida que sea mayor o igual al dia actual
    let partes = fecha.split('-');
    let fechaDate = new Date(partes[0], partes[1] - 1, partes[2]); 
    if(fechaDate > new Date() || ((fechaDate.getDay() == new Date().getDay()) && (fechaDate.getMonth() == new Date().getMonth()) && (fechaDate.getYear() == new Date().getYear()))){
        return true;
    }
    return false;
}
