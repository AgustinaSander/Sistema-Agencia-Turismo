

<%@page import="Logica.ServicioTuristico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            ServicioTuristico s = (ServicioTuristico) miSession.getAttribute("servicioEditar");
            int idServicio =  s.getIdServicio();
            String nombre = s.getNombre();
            String descripcion = s.getDescripcion();
            double costo = s.getCosto();
            String destino = s.getDestino();
            
            Date fecha = s.getFecha();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fechaServicio = sdf.format(fecha);
            
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

            <li>
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
          <a href="" class="ml-4 mt-lg-5 text-danger text-uppercase">Cerrar Sesion</a>
        </div>
        
        
      </div>
      <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <a class="navbar-brand" href="#">Editar Servicio</a>
            </div>
          </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Datos del servicio</h4>
                        </div>
                        <div class="card-body">
                            <form id="formModificarServicio" action="SvModificarServicio" method="POST" onsubmit="return validarServicioForm(this)" novalidate>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Tipo de servicio *</label>
                                            <input class="form-control" autocomplete="off" readonly type="text" name="nombre" placeholder="Tipo de servicio" value="<%= nombre%>">
                                        </div>
                                        <div class="feedback text-danger"></div>
                                    </div>
                                    <div class="col-md-4 px-1">   
                                        <div class="form-group">
                                            <label>Destino *</label>
                                            <input class="form-control" autocomplete="off" required type="text" name="destino" placeholder="Destino" value="<%= destino%>">
                                        </div>
                                        <div class="feedback text-danger"></div>
                                    </div>
                                    <div class="col-md-2 pl-1">   
                                        <div class="form-group">
                                            <label>Fecha *</label>
                                            <input class="form-control" autocomplete="off" type="date" required name="fecha" value="<%= fechaServicio %>">
                                        </div>
                                        <div class="feedback text-danger"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Descripcion del servicio *</label>
                                            <textarea class="form-control" autocomplete="off" required name="descripcion" placeholder="Acerca del servicio turistico.."><%= descripcion %></textarea>
                                        </div>
                                        <div class="feedback text-danger"></div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">                                            
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">$</div>
                                            </div>
                                            <input type="text" autocomplete="off" required name="costo" class="form-control" placeholder="Precio"  value="<%= costo%>">
                                        </div>
                                        <div class="feedback text-danger"></div>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="pl-3">(*) Los campos son obligatorios.</p>
                                    </div>
                                </div>
                                <input type="text" hidden name="idServicio" value="<%= idServicio %>">        
                                <button class="btn btn-danger btn-block" type="submit">Modificar Servicio</button>
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

  <script src="assets/js/services.js"></script>
  <% } %>
</body>

</html>
