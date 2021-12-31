
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Empleado"%>
<%@page import="Logica.ControladoraLogica"%>
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
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>

<body>
    <% 
        HttpSession miSession = request.getSession();
        String usu = (String) miSession.getAttribute("usuario");
        if(usu == null){
            response.sendRedirect("index.jsp");
        }
        else{
            Empleado e = (Empleado) miSession.getAttribute("empleado");
            int id = e.getIdPersona();
            String nombre = e.getNombre();
            String apellido = e.getApellido();
            String dni = e.getDni();
            String tel = e.getCelular();
            String email = e.getEmail();
            Date fecha = e.getFechaNac();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fechaNac = sdf.format(fecha);
            String nacionalidad = e.getNacionalidad();
            String calle = e.getDireccion().getCalle();
            String numero = e.getDireccion().getNumero();
            String depto = e.getDireccion().getDepartamento();
            int cp = e.getDireccion().getCodigoPostal();
            String localidad = e.getDireccion().getLocalidad();
            String provincia = e.getDireccion().getProvincia();
            String pais = e.getDireccion().getPais();
            double sueldo = e.getSueldo();
            String puesto = e.getCargo();
    %>

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
        <div class="sidebar-wrapper">
          <ul class="nav">

            <li class="active ">
              <a href="./user.jsp">
                <i class="far fa-user"></i>
                <p>Mi perfil</p>
              </a>
            </li>

            <li>
              <a href="./services.jsp">
                <i class="fas fa-route"></i>
                <p>Servicios Turisticos</p>
              </a>
            </li>

            <li>
              <a href="./packages.jsp">
                <i class="fas fa-suitcase"></i>
                <p>Paquetes Turisticos</p>
              </a>
            </li>
            <li>
              <a href="./clients.jsp">
                <i class="fas fa-users"></i>
                <p>Clientes</p>
              </a>
            </li> 
            <li>
              <a href="./sales.jsp">
                <i class="fas fa-hand-holding-usd"></i>
                <p>Ventas</p>
              </a>
            </li>      
            <li>
                <a href="./stats.jsp">
                    <i class="far fa-chart-bar"></i>
                    <p>Estadisticas</p>
                </a>
            </li>    
            <li class="d-flex ml-4 mt-3">
                <i style="font-size:24px;" class="text-secondary fas fa-sign-out-alt"></i>
                <form method="get" action="SvUsuario">
                    <button style="border:none; background-color: #fff; outline: none; font-size: 12px; height: 30px; padding-left: 0px" class="text-uppercase" type="submit">Cerrar Sesion</button>
                </form>
            </li>
          </ul>
         
        </div>
        
        
      </div>
      <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <a class="navbar-brand" href="#">Perfil de Empleado</a>
            </div>
          </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">
                          <img src="assets/img/damir-bosnjak.jpg" alt="...">
                        </div>
                        <div class="card-body pl-3">
                            <div class="author">
                                <img class="avatar border-light" src="assets/img/default-avatar.png" alt="Foto del empleado">
                                <p class="description text-left">
                                    Nombre de usuario: <b class="title text-dark"><%= usu %></b>
                                </p>
                            </div>
                            <p class="description">
                                Cargo: <b class="text-dark"><%= puesto %></b>
                            </p>
                            <p class="description">
                                Salario mensual: <b class="text-dark">$ <%= sueldo %></b>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card card-user">
                        <div class="card-header">
                          <h5 class="card-title">Tus datos personales</h5>
                        </div>
                        <div class="card-body">
                            <form id="dataEmpleadoForm" action="SvModificarEmpleado" method="post" onsubmit="return validarPersonaForm(this)" novalidate>
                                <div class="row">
                                  <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                      <label>Nombres</label>
                                      <input autocomplete="off" required type="text" class="form-control" name="nombre" placeholder="Nombres" value="<%= nombre %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                  <div class="col-md-6 pl-1">
                                    <div class="form-group">
                                      <label>Apellido</label>
                                      <input autocomplete="off" required type="text" class="form-control" name="apellido" placeholder="Apellido" value="<%= apellido %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-4 pr-1">
                                    <div class="form-group">
                                      <label>DNI</label>
                                      <input autocomplete="off" required type="text" class="form-control" name="dni" placeholder="Numero de Documento" value="<%= dni %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                  <div class="col-md-4 px-1">
                                    <div class="form-group">
                                      <label>Celular</label>
                                      <input autocomplete="off" required type="tel" class="form-control" name="tel" placeholder="Numero de contacto" value="<%= tel %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                  <div class="col-md-4 pl-1">
                                    <div class="form-group">
                                      <label>Correo Electronico</label>
                                      <input autocomplete="off" required type="email" class="form-control" name="email" placeholder="Correo electronico" value="<%= email %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                      <label>Fecha de Nacimiento</label>
                                      <input autocomplete="off" required type="date" class="form-control" name="fechaNac" value="<%=fechaNac%>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                  <div class="col-md-6 pl-1">
                                    <div class="form-group">
                                      <label>Nacionalidad</label>
                                      <input autocomplete="off" required type="text" placeholder="Nacionalidad" name="nacionalidad" class="form-control" value="<%= nacionalidad %>">
                                    </div>
                                    <div class="feedback text-danger pb-4"></div>
                                  </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                      <div class="form-group">
                                        <label>Calle</label>
                                        <input autocomplete="off" required type="text" name="calle" class="form-control" placeholder="Calle" value="<%= calle %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                    <div class="col-md-2 px-1">
                                      <div class="form-group">
                                        <label>Numero</label>
                                        <input autocomplete="off" required type="text" name="numero" class="form-control" placeholder="Numero" value="<%= numero %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                    <div class="col-md-4 px-1">
                                      <div class="form-group">
                                        <label>Depto</label>
                                        <input autocomplete="off" type="text" name="depto" class="form-control" placeholder="Depto/Piso" value="<%= depto %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                    <div class="col-md-2 pl-1">
                                      <div class="form-group">
                                        <label>Codigo Postal</label>
                                        <input autocomplete="off" required type="text" name="cp" class="form-control" placeholder="CP" value="<%= cp %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                      <div class="form-group">
                                        <label>Localidad</label>
                                        <input autocomplete="off" required type="text" name="localidad" class="form-control" placeholder="Localidad" value="<%= localidad %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                    <div class="col-md-4 px-1">
                                      <div class="form-group">
                                        <label>Provincia</label>
                                        <input autocomplete="off" required type="text" name="provincia" class="form-control" placeholder="Provincia" value="<%= provincia %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                    <div class="col-md-4 pl-1">
                                      <div class="form-group">
                                        <label>Pais</label>
                                        <input autocomplete="off" required type="text" name="pais" class="form-control" placeholder="Pais" value="<%= pais %>">
                                      </div>
                                      <div class="feedback text-danger pb-4"></div>
                                    </div>
                                </div>
                                <input type="text" hidden name="id" value=" <%= id %>">
                                <input type="text" hidden name="puesto" value="<%= puesto%>">
                                <input type="text" hidden name="sueldo" value="<%=sueldo%>">
                             
                                <div class="row">
                                  <div class="update ml-auto mr-auto">
                                    <button id="actualizarEmpleadoBtn" type="submit" class="btn btn-danger btn-round d-none">Actualizar datos</button>
                                    <a id="modificarEmpleadoBtn" class="btn btn-danger btn-round text-white">Modificar datos</a>
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

  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  
  <script src="assets/js/validaciones.js"></script>
  <script src="assets/js/user.js"></script>
  
  <% } %>
</body>

</html>
