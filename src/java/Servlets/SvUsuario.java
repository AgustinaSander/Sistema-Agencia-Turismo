
package Servlets;

import Logica.Cliente;
import Logica.ControladoraLogica;
import Logica.Empleado;
import Logica.PaqueteTuristico;
import Logica.Persona;
import Logica.ServicioTuristico;
import Logica.Venta;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        ControladoraLogica control = new ControladoraLogica();
        int idUsuario = control.verificarUsuario(usuario, contrasena);
        
        if(idUsuario != -1){
            //Obtengo la session y le asigno el usuario
            HttpSession miSession = request.getSession(true);
            miSession.setAttribute("usuario", usuario);
            miSession.setAttribute("contrasena", contrasena);
            Empleado e = control.obtenerUsuario(idUsuario);
            miSession.setAttribute("empleado", e);
           
            //Asigno la lista de servicios disponibles
            List<ServicioTuristico> listaServicios = control.obtenerServicios();
            miSession.setAttribute("listaServicios", listaServicios);
            
            //Asigno la lista de servicios no disponibles
            List<ServicioTuristico> listaServiciosEliminados = control.obtenerServiciosEliminados();
            miSession.setAttribute("listaServiciosEliminados", listaServiciosEliminados);
            
            //Asigno la lista de paquetes disponibles
            List<PaqueteTuristico> listaPaquetes = control.obtenerPaquetes();
            miSession.setAttribute("listaPaquetes", listaPaquetes);
            
            //Asigno la lista de clientes
            List<Cliente> listaClientes = control.obtenerClientesHabilitados();
            miSession.setAttribute("listaClientes", listaClientes);
            
            //Asigno la lista de ventas
            List<Venta> listaVentas = control.obtenerVentas();
            miSession.setAttribute("listaVentas", listaVentas);
            
            //Asigno el map de ventas-cliente
            Map<Integer, Persona> ventaCliente = control.obtenerVentaCliente();
            miSession.setAttribute("ventaCliente", ventaCliente);
            
            //Asigno el map de ventas-empleado
            Map<Integer, Persona> ventaEmpleado = control.obtenerVentaEmpleado();
            miSession.setAttribute("ventaEmpleado", ventaEmpleado);
            
            response.sendRedirect("user.jsp");
        }
        else{
            response.sendRedirect("index.jsp");
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
