
package Persistencia;

import Logica.Cliente;
import Logica.Direccion;
import Logica.Empleado;
import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import Logica.Usuario;
import Logica.Venta;
import java.util.List;

public class ControladoraPersistencia {
    ServicioTuristicoJpaController servicioJpa = new ServicioTuristicoJpaController();
    UsuarioJpaController usuarioJpa = new UsuarioJpaController();
    DireccionJpaController direccionJpa = new DireccionJpaController();
    EmpleadoJpaController empleadoJpa = new EmpleadoJpaController();
    ClienteJpaController clienteJpa = new ClienteJpaController();
    PaqueteTuristicoJpaController paqueteJpa = new PaqueteTuristicoJpaController();
    PersonaJpaController personaJpa = new PersonaJpaController();
    VentaJpaController ventaJpa = new VentaJpaController();
    
    public Boolean crearServicio(ServicioTuristico serv){
        try{
            servicioJpa.create(serv);
        } catch(Exception e){
            e.printStackTrace(System.out);
            return false;
        }
        return true;
    }

    public List<ServicioTuristico> obtenerServicios() {
        return servicioJpa.findServicioTuristicoEntities();
    }

    public List<Usuario> obtenerUsuarios() {
        return usuarioJpa.findUsuarioEntities();
    }

    public void crearUsuario(Empleado persona) {
        Usuario u = persona.getUsuario();
        Direccion d = persona.getDireccion();
        usuarioJpa.create(u);
        direccionJpa.create(d);
        
        empleadoJpa.create(persona);
    }

    public List<Cliente> obtenerClientes() {
        return clienteJpa.findClienteEntities();
    }

    public void crearCliente(Cliente persona) {
        direccionJpa.create(persona.getDireccion());
        clienteJpa.create(persona);
    }

    public List<PaqueteTuristico> obtenerPaquetes() {
        return paqueteJpa.findPaqueteTuristicoEntities();
    }

    public ServicioTuristico obtenerServicio(int id) {
        return servicioJpa.findServicioTuristico(id);
    }

    public void crearPaquete(PaqueteTuristico paquete) {
        paqueteJpa.create(paquete);
    }

    public Empleado obtenerEmpleado(int idPersona) {
        return empleadoJpa.findEmpleado(idPersona);
    }

    public void modificarEmpleado(Empleado e) throws Exception {
        empleadoJpa.edit(e);
    }

    public void eliminarServicio(ServicioTuristico s) throws Exception {
        servicioJpa.edit(s);
    }

    public PaqueteTuristico obtenerPaquete(int id) {
        return paqueteJpa.findPaqueteTuristico(id);
    }

    public void eliminarPaquete(PaqueteTuristico p) throws Exception {
       paqueteJpa.edit(p);
    }

    public Cliente obtenerCliente(int id) {
        return clienteJpa.findCliente(id);
    }

    public void eliminarCliente(Cliente c) throws Exception {
        clienteJpa.edit(c);
    }

    public void modificarServicio(ServicioTuristico s) throws Exception {
        servicioJpa.edit(s);
    }

    public void modificarCliente(Cliente c) throws Exception {
        clienteJpa.edit(c);
    }

    public Empleado obtenerUsuario(int idUsuario) {
        List<Empleado> listaEmpleados = empleadoJpa.findEmpleadoEntities();
        for(Empleado e : listaEmpleados){
            if(e.getUsuario().getIdUsuario() == idUsuario){
                return e;
            }
        }
        return null;
    }

    public Venta crearVenta(Venta v) {
        return ventaJpa.create(v);
    }

    public List<Venta> obtenerVentas() {
        return ventaJpa.findVentaEntities();
    }

    public List<Empleado> obtenerEmpleados() {
        return empleadoJpa.findEmpleadoEntities();
    }
}
