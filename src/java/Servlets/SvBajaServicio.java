
package Servlets;

import Logica.ControladoraLogica;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvBajaServicio", urlPatterns = {"/SvBajaServicio"})
public class SvBajaServicio extends HttpServlet {
    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idServicioEliminado"));
        try {
            control.recuperarServicio(id);
            
            //Actualizo la lista de servicios
            HttpSession miSession = request.getSession(true);
            List<ServicioTuristico> listaServicios = control.obtenerServicios();
            miSession.setAttribute("listaServicios",listaServicios);
            
            //Actualizo la lista de servicios eliminados
            List<ServicioTuristico> listaServiciosEliminados = control.obtenerServiciosEliminados();
            miSession.setAttribute("listaServiciosEliminados",listaServiciosEliminados);
            
        } catch (Exception ex) {
            Logger.getLogger(SvBajaServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("services.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idServicio"));
        try {
            control.eliminarServicio(id);
            
            //Actualizo la lista de servicios
            HttpSession miSession = request.getSession(true);
            List<ServicioTuristico> listaServicios = control.obtenerServicios();
            miSession.setAttribute("listaServicios",listaServicios);
            
            //Actualizo la lista de servicios eliminados
            List<ServicioTuristico> listaServiciosEliminados = control.obtenerServiciosEliminados();
            miSession.setAttribute("listaServiciosEliminados",listaServiciosEliminados);
            
        } catch (Exception ex) {
            Logger.getLogger(SvBajaServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("services.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
