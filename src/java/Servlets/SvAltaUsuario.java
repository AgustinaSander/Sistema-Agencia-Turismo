
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

@WebServlet(name = "SvAltaUsuario", urlPatterns = {"/SvAltaUsuario"})
public class SvAltaUsuario extends HttpServlet {

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
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaNac = null;
        try {
            fechaNac = formato.parse(request.getParameter("fechaNac"));
        } catch (ParseException ex) {
            ex.printStackTrace(System.out);
        }
        String celular = request.getParameter("tel");
        String email = request.getParameter("email");
        String nacionalidad = request.getParameter("nacionalidad");
        String puesto = request.getParameter("puesto");
        double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String depto = request.getParameter("depto");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String localidad = request.getParameter("localidad");
        String provincia = request.getParameter("provincia");
        String pais = request.getParameter("pais");
        String nombreUsuario = request.getParameter("usuario");
        String contra = request.getParameter("contrasena");
        
        control.crearUsuario(nombre, apellido, dni, fechaNac, celular, email, nacionalidad, puesto, sueldo, calle, numero, depto, cp, localidad, provincia, pais, nombreUsuario, contra);
        
        response.sendRedirect("index.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
