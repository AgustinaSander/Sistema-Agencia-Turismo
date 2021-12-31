
package Servlets;

import Logica.ControladoraLogica;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvModificarServicio", urlPatterns = {"/SvModificarServicio"})
public class SvModificarServicio extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Obtengo los datos del servicio
        int idServicio = Integer.parseInt(request.getParameter("idServicio"));
        ServicioTuristico s = control.obtenerServicio(idServicio);
        HttpSession miSession = request.getSession();
        miSession.setAttribute("servicioEditar", s);
        
        response.sendRedirect("editService.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idServicio = Integer.parseInt(request.getParameter("idServicio"));
        String tipo = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double costo = Double.parseDouble(request.getParameter("costo"));
        String destino = request.getParameter("destino");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = new Date();
        try {
            fecha = formato.parse(request.getParameter("fecha"));
        } catch (ParseException ex) {
            ex.printStackTrace(System.out);
        }
        
        try {
            control.modificarServicio(idServicio, tipo, descripcion, costo, destino, fecha);
        } catch (Exception ex) {
            Logger.getLogger(SvModificarServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        List<ServicioTuristico> listaServicios = control.obtenerServicios();
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("listaServicios", listaServicios);
        
        response.sendRedirect("services.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
