
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon.ico">
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Sander Turismo
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>

<body class="">
    <div class="wrapper ">
        <div class="sidebar" data-color="white" data-active-color="danger">
            <div class="logo">
                <a href="" class="simple-text logo-mini">
                    <div class="logo-image-small">
                        <img src="assets/img/avion.png">
                    </div>

                </a>
                <a href="" class="simple-text logo-normal">
                    Sander Turismo
                </a>
            </div>

        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="#">Inicio de sesion</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="row">
                    <div class="col-md-12 align-middle">
                        <div class="card card-user ">
                            <div class="card-header text-center my-4">
                                <img src="assets/img/default-avatar.png"
                                    style="width: 100px; border-radius: 50px; border:1px solid #ccc;">
                            </div>
                            <div class="card-body">
                                <form id="loginForm" action="SvUsuario" method="post" onsubmit="return validarLoginForm(this)" novalidate>
                                    <div class="row">
                                        <div class="mx-auto col-md-4">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="far fa-user"></i></div>
                                                </div>
                                                <input type="text" name="usuario" autocomplete="off" class="form-control" placeholder="Nombre de usuario" required>
                                            </div>
                                            <div class="feedback text-danger pb-2"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="mx-auto col-md-4">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                                                </div>
                                                <input type="password" name="contrasena" autocomplete="off" class="form-control" placeholder="Contrasena" required>                                       
                                            </div>
                                            <div class="feedback text-danger pb-2"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="update ml-auto mr-auto">
                                            <button type="submit" class="btn btn-danger btn-round">Iniciar Sesion</button>
                                        </div>
                                    </div>
                                </form>

                                <p class="ml-3">No tienes una cuenta? <i><b id="registerBtn">Registrate</b></i></p>
                                
                                
                                <form id="registerForm" action="SvAltaUsuario" method="post" onsubmit="return validarRegistroForm(this)" novalidate>  
                                    <hr>
                                    <p class="h5 text-center my-4">Crea un usuario</p>
                                    <p><b>Datos personales</b></p>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                              <label>Nombres *</label>
                                              <input required type="text" name="nombre" autocomplete="off" class="form-control" placeholder="Nombres">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-6 pl-1">
                                            <div class="form-group">
                                              <label>Apellido *</label>
                                              <input required type="text" name="apellido" autocomplete="off" class="form-control" placeholder="Apellido">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 pr-1">
                                            <div class="form-group">
                                              <label>DNI *</label>
                                              <input required type="text" name="dni" autocomplete="off" class="form-control" placeholder="Numero de Documento">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-4 px-1">
                                            <div class="form-group">
                                              <label>Celular *</label>
                                              <input required type="tel" name="tel" autocomplete="off" class="form-control" placeholder="Numero de contacto">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-4 pl-1">
                                            <div class="form-group">
                                              <label>Correo Electronico *</label>
                                              <input required type="email" name="email" autocomplete="off" class="form-control" placeholder="Correo electronico">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento *</label>
                                                <input required type="date" class="form-control" autocomplete="off" name="fechaNac" >
                                            </div>
                                          <div class="feedback text-danger pb-4"></div>
                                      </div>
                                      <div class="col-md-6 pl-1">
                                            <div class="form-group">
                                                <label>Nacionalidad *</label>
                                                <input required type="text" name="nacionalidad" autocomplete="off" placeholder="Nacionalidad" class="form-control">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                      </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Puesto de trabajo *</label>
                                                <input required type="text" name="puesto" autocomplete="off" class="form-control" placeholder="Puesto">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-6 pl-1">
                                            <div class="form-group">
                                                <label>Sueldo en $ *</label>
                                                <input required type="text" name="sueldo" autocomplete="off" class="form-control" placeholder="Sueldo">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                    </div>
                                    <hr>
                                    <p><b>Direccion de domicilio</b></p>
                                    <div class="row">
                                        <div class="col-md-4 pr-1">
                                            <div class="form-group">
                                                <label>Calle *</label>
                                                <input required type="text" name="calle" autocomplete="off" class="form-control" placeholder="Calle">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-2 px-1">
                                            <div class="form-group">
                                                <label>Numero *</label>
                                                <input required type="text" name="numero" autocomplete="off" class="form-control" placeholder="Numero">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-4 px-1">
                                            <div class="form-group">
                                                <label>Depto</label>
                                                <input type="text" name="depto" autocomplete="off" class="form-control" placeholder="Depto/Piso">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-2 pl-1">
                                            <div class="form-group">
                                                <label>Codigo Postal *</label>
                                                <input required type="text" name="cp" autocomplete="off" class="form-control" placeholder="CP">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 pr-1">
                                            <div class="form-group">
                                                <label>Localidad *</label>
                                                <input required type="text" name="localidad" autocomplete="off" class="form-control" placeholder="Localidad">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-4 pr-1">
                                            <div class="form-group">
                                                <label>Provincia *</label>
                                                <input required type="text" name="provincia" autocomplete="off" class="form-control" placeholder="Provincia">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-4 pl-1">
                                            <div class="form-group">
                                                <label>Pais *</label>
                                                <input required type="text" name="pais" autocomplete="off" class="form-control" placeholder="Pais">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                    </div>
                                    <hr>
                                    <p><b>Datos de la cuenta de usuario</b></p>
                                    <div class="row">
                                        <div class="col-md-6 pr-1">
                                            <div class="form-group">
                                                <label>Nombre de usuario *</label>
                                                <input required type="text" name="usuario" autocomplete="off" class="form-control" placeholder="Nombre de usuario">
                                            </div>
                                            <div class="feedback text-danger pb-4"></div>
                                        </div>
                                        <div class="col-md-6 pl-1">
                                            <div class="form-group">
                                                <label>Contrasena *</label>
                                                <input id="passInput" required type="password" name="contrasena" autocomplete="off" class="form-control" placeholder="Contrasena">
                                                <div class="progress mt-2" style="height:8px; width: 40%;">
                                                    <div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div> 
                                                <p class="mt-1"></p>
                                            </div>
                                            <div class="feedback text-danger"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                      <p class="pl-3">(*) Los campos son obligatorios.</p>
                                    </div>
                                    <div class="row">
                                      <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-danger btn-round">Registrarse</button>
                                      </div>
                                    </div>
                                  </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <script src="assets/js/login.js"></script>
    <script src="assets/js/validaciones.js"></script>
    
</body>

</html>
