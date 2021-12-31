
package Servlets;

import Logica.ControladoraLogica;
import Logica.PaqueteTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvAltaPaquete", urlPatterns = {"/SvAltaPaquete"})
public class SvAltaPaquete extends HttpServlet {
    
    //Instancia de la controladora de logica
    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idsString = request.getParameter("idSeleccionados");
        String[] idsArray = idsString.split("\\s+");
        List<String> ids = new ArrayList<>();
        for(String id : idsArray){
            ids.add(id);
        }
        
        String descripcion = request.getParameter("descripcionPaquete");
        double monto = Double.parseDouble(request.getParameter("precioTotal"));
        
        control.crearPaquete(ids, descripcion, monto);
        
        List<PaqueteTuristico> listaPaquetes = control.obtenerPaquetes();
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("listaPaquetes", listaPaquetes);
        
        response.sendRedirect("packages.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
