

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Empleado"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.Cliente"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.PaqueteTuristico"%>
<%@page import="java.util.Calendar"%>
<%@page import="Logica.Venta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                        <a href="./sales.jsp" class="active">
                            <i class="fas fa-hand-holding-usd"></i>
                            <p>Ventas</p>
                        </a>
                    </li>
                    <li class="active">
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
                        <a class="navbar-brand" href="#">Estadisticas</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content"> 
                <div class="col-md-12">
                    <h5 class="pb-2">Año 2021</h5>
                    <h6>Ventas por mes</h6>
                    <table class="w-100 table mb-4">
                        <thead class="text-danger">
                            <th></th>
                            <th>Enero</th>
                            <th>Febrero</th>
                            <th>Marzo</th>
                            <th>Abril</th>
                            <th>Mayo</th>
                            <th>Junio</th>
                            <th>Julio</th>
                            <th>Agosto</th>
                            <th>Septiembre</th>
                            <th>Octubre</th>
                            <th>Noviembre</th>
                            <th>Diciembre</th>
                            <th>Total</th>
                        </thead>
                        <tbody>
                            <%
                                List<Venta> ventas =  (List) miSession.getAttribute("listaVentas");
                             
                                Map <Integer, Cliente> ventaCliente = (Map) miSession.getAttribute("ventaCliente");
                                Map <Integer, Empleado> ventaEmpleado = (Map) miSession.getAttribute("ventaEmpleado");
                                int[] ventaMes21 = new int[12];
                                int totVenta21 = 0;
                                double[] gananciaMes21 = new double[12];
                                double totGanancia21 = 0;
                                int[] ventaMes22 = new int[12];
                                int totVenta22 = 0;
                                double[] gananciaMes22 = new double[12];
                                double totGanancia22 = 0;
                                
                                for(Venta v : ventas){
                                    Calendar cal = Calendar.getInstance();
                                    cal.setTime(v.getFecha());
                                    int month = cal.get(Calendar.MONTH);
                                    if(cal.get(Calendar.YEAR)==2021){
                                        ventaMes21[month]++;
                                        totVenta21++;
                                        for(PaqueteTuristico p : v.getListaPaquetes()){
                                            gananciaMes21[month] += p.getCosto();
                                            totGanancia21 += p.getCosto();
                                        }
                                        for(ServicioTuristico s : v.getListaServicios()){
                                            gananciaMes21[month] += s.getCosto();
                                            totGanancia21 += s.getCosto();
                                        }
                                    }
                                    else if(cal.get(Calendar.YEAR)==2022){
                                        ventaMes22[month]++;
                                        totVenta22++;
                                        for(PaqueteTuristico p : v.getListaPaquetes()){
                                            gananciaMes22[month] += p.getCosto();
                                            totGanancia22 += p.getCosto();
                                        }
                                        for(ServicioTuristico s : v.getListaServicios()){
                                            gananciaMes22[month] += s.getCosto();
                                            totGanancia22 += s.getCosto();
                                        }
                                    }
                                }
                            %>
                         
                            <tr class="text-center">
                                <td>Cantidad</td>
                                <td> <%= ventaMes21[0] %></td>
                                <td> <%= ventaMes21[1] %></td>
                                <td> <%= ventaMes21[2] %></td>
                                <td> <%= ventaMes21[3] %></td>
                                <td> <%= ventaMes21[4] %></td>
                                <td> <%= ventaMes21[5] %></td>
                                <td> <%= ventaMes21[6] %></td>
                                <td> <%= ventaMes21[7] %></td>
                                <td> <%= ventaMes21[8] %></td>
                                <td> <%= ventaMes21[9] %></td>
                                <td> <%= ventaMes21[10] %></td>
                                <td> <%= ventaMes21[11] %></td>
                                <td class="font-weight-bold"> <%= totVenta21 %></td>
                            </tr>
                            <tr class="text-center">
                                <td>Ganancias</td>
                                <td>$ <%= gananciaMes21[0] %></td>
                                <td>$ <%= gananciaMes21[1] %></td>
                                <td>$ <%= gananciaMes21[2] %></td>
                                <td>$ <%= gananciaMes21[3] %></td>
                                <td>$ <%= gananciaMes21[4] %></td>
                                <td>$ <%= gananciaMes21[5] %></td>
                                <td>$ <%= gananciaMes21[6] %></td>
                                <td>$ <%= gananciaMes21[7] %></td>
                                <td>$ <%= gananciaMes21[8] %></td>
                                <td>$ <%= gananciaMes21[9] %></td>
                                <td>$ <%= gananciaMes21[10] %></td>
                                <td>$ <%= gananciaMes21[11] %></td>
                                <td class="font-weight-bold">$ <%= totGanancia21 %></td>
                            </tr>
                        </tbody>
                    </table>
             
                    <% if(totVenta21 > 0){ %>
                    <h6 class="pt-1 pr-2">Detalle de las ventas</h6>
                    <div class="table-responsive">
                        <table class="table"  style="display: block; max-height: 500px; overflow: auto; ">
                            <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;">
                                <th>Id Venta</th>
                                <th>Fecha</th>
                                <th>Cliente</th>
                                <th>Empleado</th>
                                <th>Compra</th>
                                <th>Precio total</th>
                                <th>Medio de pago</th>
                            </thead>
                            <tbody style="font-size:14px;">
                                <%
                                    for(Venta v : ventas){
                                        Calendar cal = Calendar.getInstance();
                                        cal.setTime(v.getFecha());
                                        int month = cal.get(Calendar.MONTH);
                                        if(cal.get(Calendar.YEAR)==2021){
                                            int id = v.getIdVenta();
                                            String fecha = new SimpleDateFormat("dd/MM/yyyy").format(v.getFecha());
                                            String medio = v.getMedioDePago();
                                            double precio = 0;
                                            String compra = "";
                                            for(ServicioTuristico s : v.getListaServicios()){
                                                precio += s.getCosto();
                                                compra += " <b>-</b> "+ s.getDescripcion() + "<br>";
                                            }
                                            for(PaqueteTuristico p : v.getListaPaquetes()){
                                                precio += p.getCosto();
                                                compra += " <b>-</b> "+p.getDescripcion() + "<br>";
                                            }
                                            Cliente c = ventaCliente.get(id);
                                            String cliente = c.getNombre() + ", "+c.getApellido() + ". Dni: "+c.getDni();
                                            Empleado e = ventaEmpleado.get(id);
                                            String empleado = e.getNombre() + ", "+e.getApellido() + ". Dni: "+e.getDni();
                                %>
                                <tr>
                                    <td><%= id%></td>
                                    <td><%= fecha%></td>
                                    <td><%= cliente%></td>
                                    <td><%= empleado%></td>
                                    <td><%= compra%></td>
                                    <td>$ <%= precio%></td>
                                    <td><%= medio%></td>
                                </tr>
                                <% }}%>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                            
                    <h5 class="pb-2 pt-4">Año 2022</h5>
                    <h6>Ventas por mes</h6>
                    <table class="w-100 table">
                        <thead class="text-danger">
                            <th></th>
                            <th>Enero</th>
                            <th>Febrero</th>
                            <th>Marzo</th>
                            <th>Abril</th>
                            <th>Mayo</th>
                            <th>Junio</th>
                            <th>Julio</th>
                            <th>Agosto</th>
                            <th>Septiembre</th>
                            <th>Octubre</th>
                            <th>Noviembre</th>
                            <th>Diciembre</th>
                            <th>Total</th>
                        </thead>
                        <tbody>
                            <tr class="text-center">
                                <td>Cantidad</td>
                                <td> <%= ventaMes22[0] %></td>
                                <td> <%= ventaMes22[1] %></td>
                                <td> <%= ventaMes22[2] %></td>
                                <td> <%= ventaMes22[3] %></td>
                                <td> <%= ventaMes22[4] %></td>
                                <td> <%= ventaMes22[5] %></td>
                                <td> <%= ventaMes22[6] %></td>
                                <td> <%= ventaMes22[7] %></td>
                                <td> <%= ventaMes22[8] %></td>
                                <td> <%= ventaMes22[9] %></td>
                                <td> <%= ventaMes22[10] %></td>
                                <td> <%= ventaMes22[11] %></td>
                                <td class="font-weight-bold"> <%= totVenta22 %></td>
                            </tr>
                            <tr class="text-center">
                               <td>Ganancias</td>
                               <td>$ <%= gananciaMes22[0] %></td>
                               <td>$ <%= gananciaMes22[1] %></td>
                               <td>$ <%= gananciaMes22[2] %></td>
                               <td>$ <%= gananciaMes22[3] %></td>
                               <td>$ <%= gananciaMes22[4] %></td>
                               <td>$ <%= gananciaMes22[5] %></td>
                               <td>$ <%= gananciaMes22[6] %></td>
                               <td>$ <%= gananciaMes22[7] %></td>
                               <td>$ <%= gananciaMes22[8] %></td>
                               <td>$ <%= gananciaMes22[9] %></td>
                               <td>$ <%= gananciaMes22[10] %></td>
                               <td>$ <%= gananciaMes22[11] %></td>
                               <td class="font-weight-bold">$ <%= totGanancia22 %></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <% if(totVenta22 > 0){ %>
                    <h6 class="pt-1 pr-2">Detalle de las ventas</h6>
                    <div class="table-responsive">
                        <table class="table"  style="display: block; max-height: 500px; overflow: auto; ">
                            <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;">
                                <th>Id Venta</th>
                                <th>Fecha</th>
                                <th>Cliente</th>
                                <th>Empleado</th>
                                <th>Compra</th>
                                <th>Precio total</th>
                                <th>Medio de pago</th>
                            </thead>
                            <tbody style="font-size:14px;">
                                <%
                                    for(Venta v : ventas){
                                        Calendar cal = Calendar.getInstance();
                                        cal.setTime(v.getFecha());
                                        int month = cal.get(Calendar.MONTH);
                                        if(cal.get(Calendar.YEAR)==2022){
                                            int id = v.getIdVenta();
                                            String fecha = new SimpleDateFormat("dd/MM/yyyy").format(v.getFecha());
                                            String medio = v.getMedioDePago();
                                            double precio = 0;
                                            String compra = "";
                                            for(ServicioTuristico s : v.getListaServicios()){
                                                precio += s.getCosto();
                                                compra += " <b>-</b> "+ s.getDescripcion() + "<br>";
                                            }
                                            for(PaqueteTuristico p : v.getListaPaquetes()){
                                                precio += p.getCosto();
                                                compra += " <b>-</b> "+p.getDescripcion() + "<br>";
                                            }
                                            Cliente c = ventaCliente.get(id);
                                            String cliente = c.getNombre() + ", "+c.getApellido() + ". Dni: "+c.getDni();
                                            Empleado e = ventaEmpleado.get(id);
                                            String empleado = e.getNombre() + ", "+e.getApellido() + ". Dni: "+e.getDni();
                                %>
                                <tr>
                                    <td><%= id%></td>
                                    <td><%= fecha%></td>
                                    <td><%= cliente%></td>
                                    <td><%= empleado%></td>
                                    <td><%= compra%></td>
                                    <td>$ <%= precio%></td>
                                    <td><%= medio%></td>
                                </tr>
                                <% }} %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
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
    
    <script src="assets/js/stats.js"></script>
    
    <% } %>
</body>

</html>