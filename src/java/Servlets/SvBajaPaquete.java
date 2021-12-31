
package Servlets;

import Logica.ControladoraLogica;
import Logica.PaqueteTuristico;
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

@WebServlet(name = "SvBajaPaquete", urlPatterns = {"/SvBajaPaquete"})
public class SvBajaPaquete extends HttpServlet {
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
        int id = Integer.parseInt(request.getParameter("idPaquete"));
        try {
            control.eliminarPaquete(id);
        } catch (Exception ex) {
            Logger.getLogger(SvBajaPaquete.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
