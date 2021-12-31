
package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvBajaCliente", urlPatterns = {"/SvBajaCliente"})
public class SvBajaCliente extends HttpServlet {
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
        int id = Integer.parseInt(request.getParameter("idCliente"));
        try {
            control.eliminarCliente(id);
        } catch (Exception ex) {
            Logger.getLogger(SvBajaCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("listaClientes", control.obtenerClientesHabilitados());
        
        response.sendRedirect("clients.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
