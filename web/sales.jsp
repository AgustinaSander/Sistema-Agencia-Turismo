
<%@page import="Logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.PaqueteTuristico"%>
<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
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
            Empleado e = (Empleado) miSession.getAttribute("empleado");
            int idEmpleado = e.getIdPersona();
            String nombreEmpleado = e.getNombre();
            String apellidoEmpleado = e.getApellido();
            String dniEmpleado = e.getDni();
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
                    <li class="active">
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
                        <a class="navbar-brand" href="#">Ventas</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content"> 
                <div class="col-md-12">
                    <h3 class="text-center text-uppercase">Registrar una venta</h3>
                    <div class="card px-2"> 
                        <div class="d-flex px-2 pt-4 align-content-center">
                            <div class="bg-danger p-2 mr-4 rounded-circle text-center" style="width: 35px; height:35px"><p class="text-light"><b>1</b></p></div>
                            <p style="font-size: 16px;" >Seleccione lo que desea comprar</p>
                        </div>
                        <hr>
                        <div class="card-body d-flex">
                            <div class="col-md-6">
                                <h3 style="font-size: 18px;" class="text-uppercase font-weight-bold">Servicios disponibles</h3>
                                <div class="table-responsive">
                                    <table id="tableServicio" class="table tableServicio" style="display: block; max-height: 300px; overflow: auto; ">
                                        <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #fff;">
                                            <th>Tipo</th>
                                            <th>Descripcion</th>
                                            <th>Precio</th>
                                            <th></th>
                                        </thead>
                                        <tbody style="font-size:14px;">
                                           <% 
                                           List<ServicioTuristico> servicios = (List) miSession.getAttribute("listaServicios");

                                                for(ServicioTuristico s : servicios){
                                            %>
                                            <tr>
                                                <%
                                                    String nombre = s.getNombre();
                                                    String descripcion = s.getDescripcion();
                                                    String costo = Double.toString(s.getCosto());
                                                    int idServicio = s.getIdServicio();
                                                %>    
                                                <td> <%= nombre %></td>
                                                <td class="descripcion"> <%= descripcion %></td>
                                                <td class="costo"> <%= costo%></td>  
                                                <td class="text-center pr-4"><input name="<%=idServicio %>" class="checkboxServicio <%=idServicio%>"  type="checkbox"></td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h3 style="font-size: 18px;" class="text-uppercase font-weight-bold">Paquetes disponibles</h3>
                                <div class="table-responsive">

                                    <table id="tablePaquete" class="table tablePaquete" style="display: block; max-height: 300px; overflow: auto; ">
                                        <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #fff;">
                                            <th>Descripcion</th> 
                                            <th>Precio</th>   
                                            <th></th>
                                        </thead>
                                        <tbody style="font-size:14px;">
                                           <% 
                                           List<PaqueteTuristico> paquetes = (List) miSession.getAttribute("listaPaquetes");

                                                for(PaqueteTuristico p : paquetes){
                                            %>
                                            <tr>
                                                <%
                                                    String descripcion = p.getDescripcion();
                                                    String costo = Double.toString(p.getCosto());
                                                    int idPaquete = p.getIdPaquete();
                                                %>    
                                                <td class="descripcion"> <%= descripcion %></td>
                                                <td class="costo"> <%= costo%></td>  
                                                <td class="text-center pr-4"><input name="<%=idPaquete %>" class="checkboxPaquete <%=idPaquete %>"  type="checkbox"></td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <div id="errorItems" class="feedback text-danger pl-4 pb-4"></div>   
                    </div>
                    
                    <div class="card px-2 pt-4 card-plain"> 
                        <div class="d-flex px-2 align-content-center">
                            <div class="bg-danger p-2 mr-4 rounded-circle text-center" style="width: 35px; height:35px"><p class="text-light"><b>2</b></p></div>
                            <p style="font-size: 16px;" >Seleccione el cliente</p>
                        </div>
                        <hr>
                        <div class="card-body">
                            <h3 style="font-size: 18px;" class="text-uppercase font-weight-bold">Clientes</h3>
                            <div class="table-responsive">
                                <table id="tableCliente" class="table tableCliente" style="display: block; max-height: 300px; overflow: auto; ">
                                    <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;">
                                        <th>Nombres</th>
                                        <th>Apellido</th>
                                        <th>DNI</th>
                                        <th>Fecha de Nacimiento</th>
                                        <th>Email</th>
                                        <th>Celular</th>
                                        <th>Direccion</th>
                                        <th></th>
                                    </thead>
                                    <tbody id="clientsTable" style="font-size:14px;">
                                    <%
                                        List<Cliente> listaClientes =  (List) miSession.getAttribute("listaClientes");

                                        for(Cliente c : listaClientes){
                                    %>
                                    <tr>
                                        <%
                                            String nombre = c.getNombre();
                                            String apellido = c.getApellido();
                                            String dni = c.getDni();
                                            String email = c.getEmail();
                                            String celular = c.getCelular();  
                                            String direccion = c.getDireccion().getLocalidad() + ", " + c.getDireccion().getProvincia() + ", " + c.getDireccion().getPais();
                                            String fechaNac = new SimpleDateFormat("dd/MM/yyyy").format(c.getFechaNac());
                                            int idCliente = c.getIdPersona();
                                        %>    
                                        <td class="nombreCliente"> <%= nombre %></td>
                                        <td class="apellidoCliente"> <%= apellido%></td>  
                                        <td class="dniCliente"> <%= dni%></td>
                                        <td class="text-center"> <%= fechaNac%></td>
                                        <td> <%= email%></td>
                                        <td> <%= celular%></td>
                                        <td> <%= direccion %></td>
                                        <td class="text-center pr-4"><input name="radioCliente" class="radioCliente <%=idCliente %>"  type="radio"></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                                </table>
                            </div>
                            <div id="errorCliente" class="feedback text-danger pb-4"></div>
                        </div>
                    </div>
                                        
                    <div class="card px-2 pb-4">
                        <div class="d-flex px-2 pt-4 align-content-center">
                            <div class="bg-danger p-2 mr-4 rounded-circle text-center" style="width: 35px; height:35px"><p class="text-light"><b>3</b></p></div>
                            <p style="font-size: 16px;" >Seleccione el metodo de pago</p>
                        </div>
                        <hr>
                        <div class="card-body">
                            <label>Metodo de pago</label>
                            <select id="medioPagoSelect" class="form-control">
                                <option selected value="debito">Tarjeta de debito</option>
                                <option value="credito">Tarjeta de credito</option>
                                <option value="efectivo">Efectivo</option>
                                <option value="transferencia">Transferencia</option>
                                <option value="cheque">Cheque</option>
                            </select>
                        </div>
                        
                    </div>                    
                    
                    <div class="card card-plain px-2 pt-4">
                        <div class="d-flex px-2 align-content-center">
                            <div class="bg-danger p-2 mr-4 rounded-circle text-center" style="width: 35px; height:35px"><p class="text-light"><b>4</b></p></div>
                            <p style="font-size: 16px;" >Confirme la venta</p>
                        </div>
                        <hr>
                        <div class="card-body">
                            <p class="font-weight-bold text-uppercase">Detalles de la venta</p>
                            <div class="row">
                                <div class="col-md-8">
                                    <p>ITEMS SELECCIONADOS:</p>
                                    <ul id="detalleVenta">

                                    </ul>
                                    <br>
                                    <p class="font-weight-bold">DATOS DEL CLIENTE:</p>
                                    <p id="datosCliente"></p>
                                    <br>
                                    <p class="font-weight-bold">VENTA REALIZADA POR EL EMPLEADO: <span class="font-weight-normal"><%=nombreEmpleado%>, <%=apellidoEmpleado%>. Dni: <%=dniEmpleado%></span></p>
                                </div>
                                <div class="p-3 col-md-4">
                                    <p class="text-center font-weight-bold">PRECIO DE VENTA</p>
                                    <p>Medio de pago: <span id="medioDePago">Tarjeta de debito</span></p>
                                    <p class="font-weight-bold">MONTO TOTAL: $ <span id="precioTotal">0.00</span></p>
                                </div>
                            </div>
                            <form action="SvAltaVenta" method="post" novalidate onsubmit="return validarVentaForm(this)">
                                <input id="idClienteSeleccionado" hidden name="idClienteSeleccionado" type="text" value="">
                                <input id="idPaqueteSeleccionados" hidden name="idPaqueteSeleccionados" type="text"  value="">
                                <input id="idServicioSeleccionados" hidden name="idServicioSeleccionados" type="text"  value="">
                                <input id="idEmpleadoSeleccionado" hidden name="idEmpleadoSeleccionado" type="text" value="<%=idEmpleado %>">
                                <input id="medioPagoSeleccionado" hidden name="medioPagoSeleccionado" type="text" value="Tarjeta de debito">
                                <button id="agregarVentaBtn" class="btn btn-danger btn-block" type="submit">Registrar venta</button>
                            </form>
                        </div>
                    </div>
                </div>
                 
            </div>

        </div>
    </div>

    <!-- Main JS -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>

    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <script src="assets/js/sales.js"></script>
    <script src="assets/js/validaciones.js"></script>
    
    <% } %>
</body>

</html>