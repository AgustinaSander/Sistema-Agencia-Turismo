
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.PaqueteTuristico"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="java.util.List"%>
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

                    <li>
                        <a href="./services.jsp">
                            <i class="fas fa-route"></i>
                            <p>Servicios Turisticos</p>
                        </a>
                    </li>

                    <li class="active">
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
                        <a class="navbar-brand" href="#">Paquetes Turisticos</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content"> 
                <div class="col-md-12">
                    <div class="card card-plain">
                        <div class="card-header">             
                            <h5>Listado de los paquetes disponibles</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class=" text-danger">
                                        <th>Servicios incluidos</th> 
                                        <th>Precio</th>
                                        <th>Eliminar</th>
                                    </thead>
                                    <tbody id="packagesTable">
                                        <%
                                            List<PaqueteTuristico> listaPaquetes = (List) miSession.getAttribute("listaPaquetes");
                                                
                                            for(PaqueteTuristico p : listaPaquetes){
                                        %>
                                        <tr>
                                            <%
                                                String descripcion = p.getDescripcion();
                                                String costo = Double.toString(p.getCosto());
                                                int idPaquete = p.getIdPaquete();
                                            %>    
                                            <td> <%= descripcion %></td>
                                            <td> <%= costo%></td>  
                                            
                                            <td><form action="SvBajaPaquete" method="post">
                                                    <input type="text" hidden name="idPaquete" value="<%= idPaquete %>">
                                                    <button type="submit"><i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <h3 class="text-center text-uppercase">Agregar un paquete</h3>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Servicios disponibles</h4>
                                </div>
                                <div class="card-body">
                                    <form name="formAltaPaquete" action="SvAltaPaquete" method="POST" novalidate onsubmit="return validarPaquete(this)">
                                        <div class="table-responsive">
                                            <table class="table tablePaquete" style="display: block; max-height: 500px; overflow: auto; ">
                                                <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #fff;">
                                                    <th>Tipo de servicio</th>
                                                    <th>Descripcion</th>
                                                    <th>Destino</th>
                                                    <th>Fecha</th>
                                                    <th>Precio</th>
                                                    <th></th>
                                                </thead>
                                                <tbody id="servicesTable">
                                                    <%
                                                        List<ServicioTuristico> listaServicios = (List) miSession.getAttribute("listaServicios");

                                                        for(ServicioTuristico s : listaServicios){
                                                    %>
                                                    <tr>
                                                        <%
                                                            String nombre = s.getNombre();
                                                            String descripcion = s.getDescripcion(); 
                                                            String destino = s.getDestino();
                                                            String fecha = new SimpleDateFormat("dd/MM/yyyy").format(s.getFecha());
                                                            String costo = Double.toString(s.getCosto());
                                                            int id = s.getIdServicio();
                                                        %>    
                                                        <td class="nombre"> <%= nombre %></td>
                                                        <td> <%= descripcion%></td>  
                                                        <td> <%= destino %></td>
                                                        <td> <%= fecha %></td>
                                                        <td class="costo">$ <%= costo %></td>
                                                        <td class="text-center pr-4"><input name="<%=id %>" class="checkboxPaquete <%=id %>"  type="checkbox"></td>
                                                    </tr>
                                                    <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                        <hr>
                                        <p class="font-weight-bold text-uppercase">Detalles del paquete a agregar</p>
                                        <div class="row pb-5">
                                            <p class="col-md-2">DESCRIPCION:</p>
                                            <input type="text" class="form-control col-md-9" name="descripcionPaquete" id="descripcionPaquete" required autocomplete="off">
                                            <div class="pl-3 feedback text-danger"></div>
                                        </div>
                                        <div class="row">
                                            <p class="col-md-4">Monto inicial: $ <span id="precioPaquete">0.00</span></p>
                                            <p class="pr-3">Porcentaje de descuento:</p>
                                            <select id="descuentoSelect" class="form-control col-md-2">
                                                <option value="0">Sin descuento</option>
                                                <option value="5" >5%</option>
                                                <option value="10" >10%</option>
                                                <option value="15" selected >15%</option>
                                                <option value="30" >30%</option>
                                                <option value="50" >50%</option>
                                                <option value="100" >100%</option>
                                            </select>
                                        </div>
                                        <p class="align-center">Monto a descontar: $ <span id="precioDescuento">0.00</span></p>
                                        <p class="align-center font-weight-bold">MONTO TOTAL: $ <span id="precioTotal">0.00</span></p>
                                        <input id="idSeleccionados" name="idSeleccionados" type="text" hidden value="">
                                        <input id="precioTotalInput" hidden type="text" name="precioTotal" value="">
                                        <button id="agregarPaqueteBtn" disabled class="btn btn-danger btn-block" type="submit">Agregar Servicio</button>
                                    </form>
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
    <script src="assets/js/packages.js"></script>

    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <% } %>
</body>

</html>
