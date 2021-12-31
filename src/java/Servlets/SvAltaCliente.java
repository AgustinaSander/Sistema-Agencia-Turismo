
package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvAltaCliente", urlPatterns = {"/SvAltaCliente"})
public class SvAltaCliente extends HttpServlet {

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
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String cel = request.getParameter("tel");
        String email = request.getParameter("email");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNac = new Date();
        try {
            fechaNac = formato.parse(request.getParameter("fechaNac"));
        } catch (ParseException ex) {
            ex.printStackTrace(System.out);
        }
        String nacionalidad = request.getParameter("nacionalidad");
        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String depto = request.getParameter("depto");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String localidad = request.getParameter("localidad");
        String provincia = request.getParameter("provincia");
        String pais = request.getParameter("pais");
        
        control.crearCliente(nombre, apellido, dni, cel, email, fechaNac, nacionalidad, calle, numero, depto, cp, localidad, provincia, pais);
        
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("listaClientes", control.obtenerClientesHabilitados());
        
        response.sendRedirect("clients.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
