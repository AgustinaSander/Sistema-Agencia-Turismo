
package Servlets;

import Logica.Cliente;
import Logica.ControladoraLogica;
import Logica.Empleado;
import Logica.Persona;
import Logica.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SvAltaVenta", urlPatterns = {"/SvAltaVenta"})
public class SvAltaVenta extends HttpServlet {

    //Instancia de la controladora de logica
    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idCliente = Integer.parseInt(request.getParameter("idClienteSeleccionado"));
        
        String ids = request.getParameter("idPaqueteSeleccionados");
        List<String> idsPaquetes = new ArrayList<>();
        if(ids != ""){
            String[] idsP = ids.split("\\s+");
            
            for(String id : idsP){
                idsPaquetes.add(id);
            }
        }
        
        
        ids = request.getParameter("idServicioSeleccionados");
        List<String> idsServicios = new ArrayList<>();
        if(ids != ""){
            String[] idsS = ids.split("\\s+");
            
            for(String id : idsS){
                idsServicios.add(id);
            }
        }
        
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleadoSeleccionado"));
        String medioPago = request.getParameter("medioPagoSeleccionado");
        
        try {
            control.crearVenta(idCliente, idsPaquetes, idsServicios, idEmpleado, medioPago);
        } catch (Exception ex) {
            Logger.getLogger(SvAltaVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        List<Venta> listaVentas = control.obtenerVentas();
        request.getSession().setAttribute("listaVentas", listaVentas);
       
        //Asigno el map de ventas-cliente
        Map<Integer, Persona> ventaCliente = control.obtenerVentaCliente();
        request.getSession().setAttribute("ventaCliente", ventaCliente);

        //Asigno el map de ventas-empleado
        Map<Integer, Persona> ventaEmpleado = control.obtenerVentaEmpleado();
        request.getSession().setAttribute("ventaEmpleado", ventaEmpleado);
        
        response.sendRedirect("sales.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
