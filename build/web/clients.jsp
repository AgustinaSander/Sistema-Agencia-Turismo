
<%@page import="Logica.Cliente"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Persona"%>
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
                    <li class="active">
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
                        <a class="navbar-brand" href="#">Clientes registrados</a>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="col-md-12">
                    <div class="card card-plain">
                        <div class="card-header">             
                            <h5>Listado de los clientes encontrados</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table"  style="display: block; max-height: 500px; overflow: auto; ">
                                    <thead class="text-danger" style="position: sticky; top: 0; z-index: 10; background-color: #f4f3ef;">
                                        <th>Nombres</th>
                                        <th>Apellido</th>
                                        <th>DNI</th>
                                        <th>Email</th>
                                        <th>Celular</th>
                                        <th>Direccion</th>
                                        <th>Editar</th>
                                        <th>Eliminar</th>
                                    </thead>
                                    <tbody id="clientsTable" style="font-size:14px;">
                                        <%
                                            List<Cliente> listaClientes = (List) miSession.getAttribute("listaClientes");

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
                                                int idCliente = c.getIdPersona();
                                            %>    
                                            <td> <%= nombre %></td>
                                            <td> <%= apellido%></td>  
                                            <td> <%= dni%></td>
                                            <td> <%= email%></td>
                                            <td> <%= celular%></td>
                                            <td> <%= direccion %></td>
                                            <td class="text-center">
                                                <form action="SvModificarCliente" method="get">
                                                    <input type="text" hidden name="idCliente" value="<%= idCliente %>">
                                                    <button type="submit"><i class="far fa-edit"></i></button>
                                                </form>
                                            </td>
                                            
                                            <td class="text-center"><form action="SvBajaCliente" method="post">
                                                    <input type="text" hidden name="idCliente" value="<%= idCliente %>">
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
                    <h3 class="text-center text-uppercase">Agregar un cliente</h3>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-user">
                                <div class="card-header">
                                  <h5 class="card-title">Datos personales</h5>
                                </div>
                                <div class="card-body">
                                  <form action="SvAltaCliente" method="post" novalidate onsubmit="return validarPersonaForm(this)">  
                                    <div class="row">
                                      <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                          <label>Nombres *</label>
                                          <input autocomplete="off" type="text" name="nombre" class="form-control" placeholder="Nombres" required> 
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                      <div class="col-md-6 pl-1">
                                        <div class="form-group">
                                          <label>Apellido *</label>
                                          <input autocomplete="off" type="text" name="apellido" class="form-control" placeholder="Apellido" required>
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                          <label>DNI *</label>
                                          <input autocomplete="off" type="text" name="dni" class="form-control" placeholder="Numero de Documento">
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                      <div class="col-md-4 px-1">
                                        <div class="form-group">
                                          <label>Celular *</label>
                                          <input autocomplete="off" type="tel" name="tel" class="form-control" placeholder="Numero de contacto">
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                      <div class="col-md-4 pl-1">
                                        <div class="form-group">
                                          <label>Correo Electronico *</label>
                                          <input autocomplete="off" type="email" name="email" class="form-control" placeholder="Correo electronico">
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                          <label>Fecha de Nacimiento *</label>
                                          <input autocomplete="off" type="date" name="fechaNac" class="form-control">
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                      <div class="col-md-6 pl-1">
                                        <div class="form-group">
                                          <label>Nacionalidad *</label>
                                          <input autocomplete="off" type="text" name="nacionalidad" placeholder="Nacionalidad" class="form-control">
                                        </div>
                                        <div class="feedback text-danger pb-2"></div>
                                      </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 pr-1">
                                          <div class="form-group">
                                            <label>Calle *</label>
                                            <input autocomplete="off" type="text" name="calle" class="form-control" placeholder="Calle">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                        <div class="col-md-2 px-1">
                                          <div class="form-group">
                                            <label>Numero *</label>
                                            <input autocomplete="off" type="text" name="numero" class="form-control" placeholder="Numero">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                        <div class="col-md-4 px-1">
                                          <div class="form-group">
                                            <label>Depto</label>
                                            <input autocomplete="off" type="text" name="depto" class="form-control" placeholder="Depto/Piso">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                        <div class="col-md-2 pl-1">
                                          <div class="form-group">
                                            <label>Codigo Postal *</label>
                                            <input autocomplete="off" type="text" name="cp" class="form-control" placeholder="CP">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 pr-1">
                                          <div class="form-group">
                                            <label>Localidad *</label>
                                            <input autocomplete="off" type="text" name="localidad" class="form-control" placeholder="Localidad">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                        <div class="col-md-4 px-1">
                                          <div class="form-group">
                                            <label>Provincia *</label>
                                            <input autocomplete="off" type="text" name="provincia" class="form-control" placeholder="Provincia">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                        <div class="col-md-4 pl-1">
                                          <div class="form-group">
                                            <label>Pais *</label>
                                            <input autocomplete="off" type="text" name="pais" class="form-control" placeholder="Pais">
                                          </div>
                                          <div class="feedback text-danger pb-2"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p class="pl-3">(*) Los campos son obligatorios.</p>
                                    </div>
                                    <div class="row">
                                      <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-danger btn-round">Agregar Cliente</button>
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
    </div>

    <!-- Main JS -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="assets/js/validaciones.js"></script>

    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <% } %>
</body>

</html>
