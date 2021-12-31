
package Servlets;

import Logica.ControladoraLogica;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvConsultaServicio", urlPatterns = {"/SvConsultaServicio"})
public class SvConsultaServicio extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<ServicioTuristico> servicios = control.obtenerServicios();
        List<ServicioTuristico> listaServiciosHabilitados = new ArrayList<>();
        for(ServicioTuristico s : servicios){
            if(s.getHabilitado() == true){
                listaServiciosHabilitados.add(s);
            }
        }
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaServicios", listaServiciosHabilitados);
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
