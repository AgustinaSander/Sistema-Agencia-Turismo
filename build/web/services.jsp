
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="java.util.List"%>
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
    <link href="assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>

<body class="">
    <% 
        HttpSession miSession = request.getSession();
        String usu = (String) miSession.getAttribute("usuario");
        if(usu == null){
            response.sendRedirect("index.jsp");
        }
        else{
    
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

                    <li class="active">
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
                        <a class="navbar-brand" href="#">Servicios Turisticos</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="col-md-12">
                    <div class="card card-plain">
                        <div class="card-header">             
                            <h5>Listado de los servicios disponibles</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" style="display: block; max-height: 500px; overflow: auto; ">
                                    <thead style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;" class=" text-danger">
                                        <th>Tipo de servicio</th>
                                        <th>Descripcion</th>
                                        <th>Destino</th>
                                        <th>Fecha</th>
                                        <th style="min-width: 100px;" class="text-right pr-4">Precio</th>
                                        <th>Editar</th>
                                        <th>Eliminar</th>
                                    </thead>
                                    <tbody id="servicesTable">
                                        <%
                                            List<ServicioTuristico> servicios =  (List) miSession.getAttribute("listaServicios");
                                            
                                            for(ServicioTuristico s : servicios){
                                        %>
                                        <tr>
                                            <%
                                                String nombre = s.getNombre();
                                                String descripcion = s.getDescripcion(); 
                                                String destino = s.getDestino();
                                                String fecha = new SimpleDateFormat("dd/MM/yyyy").format(s.getFecha());
                                                String costo = Double.toString(s.getCosto());
                                                int idServicio = s.getIdServicio();
                                            %>    
                                            <td> <%= nombre %></td>
                                            <td> <%= descripcion%></td>  
                                            <td> <%= destino %></td>
                                            <td> <%= fecha %></td>
                                            <td style="min-width: 100px;"  class="text-center pr-4">$ <%= costo %></td>
                                            <td class="text-center">
                                                <form action="SvModificarServicio" method="get">
                                                    <input type="text" hidden name="idServicio" value="<%= idServicio %>">
                                                    <button type="submit"><i class="far fa-edit"></i></button>
                                                </form>
                                            </td>
               
                                            <td class="text-center">
                                                <form action="SvBajaServicio" method="post">
                                                    <input type="text" hidden name="idServicio" value="<%= idServicio %>">
                                                    <button type="submit" ><i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </td>
                                          
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <h3 class="text-center text-uppercase">Agregar un servicio</h3>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Datos del servicio</h4>
                                </div>
                                <div class="card-body">
                                    <form id="altaServicioForm" action="SvAltaServicio" method="POST" onsubmit="return validarServicioForm(this)" novalidate>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Tipo de servicio *</label>
                                                    <select name="nombre" class="form-control" required>
                                                        <option selected>Seleccionar</option>
                                                        <option>Hotel por noche</option>
                                                        <option>Alquiler de vehiculo</option>
                                                        <option>Pasaje de colectivo</option>
                                                        <option>Pasaje de avion</option>
                                                        <option>Pasaje de tren</option>
                                                        <option>Excursion</option>
                                                        <option>Entrada a evento</option>
                                                    </select>
                                                </div>
                                                <div class="feedback text-danger pb-2"></div>
                                            </div>
                                            <div class="col-md-4 px-1">   
                                                <div class="form-group">
                                                    <label>Destino *</label>
                                                    <input autocomplete="off"  class="form-control" type="text" name="destino" placeholder="Destino" required>
                                                </div>
                                                <div class="feedback text-danger pb-2"></div>
                                            </div>
                                            <div class="col-md-2 pl-1">   
                                                <div class="form-group">
                                                    <label>Fecha *</label>
                                                    <input class="form-control" type="date" name="fecha" required>
                                                </div>
                                                <div class="feedback text-danger pb-2"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Descripcion del servicio *</label>
                                                    <textarea autocomplete="off"  class="form-control" name="descripcion" placeholder="Acerca del servicio turistico.." required></textarea>
                                                </div>
                                                <div class="feedback text-danger pb-2"></div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group">                                            
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">$</div>
                                                      </div>
                                                      <input autocomplete="off" type="text" name="costo" class="form-control" placeholder="Precio" required>
                                                </div>
                                                <div class="feedback text-danger pb-2"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <p class="pl-3">(*) Los campos son obligatorios.</p>
                                            </div>
                                        </div>
                                        
                                        <button class="btn btn-danger btn-block" type="submit">Agregar Servicio</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-12">
                        <h3 class="pt-4 text-center text-uppercase">Recuperar un servicio eliminado</h3>
                        <div class="card card-plain">
                            <div class="card-header">             
                                <h5>Listado de los servicios eliminados</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" style="display: block; max-height: 500px; overflow: auto;">
                                        <thead style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;" class=" text-danger">
                                            <th>Tipo de servicio</th>
                                            <th>Descripcion</th>
                                            <th>Destino</th>
                                            <th>Fecha</th>
                                            <th class="text-right pr-4">Precio</th>
                                            <th>Recuperar</th>
                                        </thead>
                                        <tbody id="servicesTable">
                                            <%
                                            List<ServicioTuristico> serviciosEliminados =  (List) miSession.getAttribute("listaServiciosEliminados");
                                            
                                            for(ServicioTuristico s : serviciosEliminados){
                                            %>
                                            <tr>
                                                <%
                                                    String nombreEliminado = s.getNombre();
                                                    String descripcionEliminado = s.getDescripcion(); 
                                                    String destinoEliminado = s.getDestino();
                                                    String fechaEliminado = new SimpleDateFormat("dd/MM/yyyy").format(s.getFecha());
                                                    String costoEliminado = Double.toString(s.getCosto());
                                                    int idServicioEliminado = s.getIdServicio();
                                                %>    
                                                <td> <%= nombreEliminado %></td>
                                                <td> <%= descripcionEliminado%></td>  
                                                <td class="text-center"> <%= destinoEliminado %></td>
                                                <td class="text-center"> <%= fechaEliminado %></td>
                                                <td class="text-right pr-4"><%= costoEliminado %></td>
                                                <td class="text-center">
                                                    <form action="SvBajaServicio" method="get">
                                                        <input type="text" hidden name="idServicioEliminado" value="<%= idServicioEliminado %>">
                                                        <button type="submit" ><i class="fas fa-plus"></i></button>
                                                    </form>
                                                </td>

                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                   
        
    </div>

    <!-- Main JS -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="assets/js/main.js"></script>

    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <script src="assets/js/validaciones.js"></script>
    <% } %>
</body>

</html>
