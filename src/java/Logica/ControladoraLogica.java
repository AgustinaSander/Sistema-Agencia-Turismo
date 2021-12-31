
package Logica;

import Persistencia.ControladoraPersistencia;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ControladoraLogica {
    ControladoraPersistencia controlPers = new ControladoraPersistencia();
    
    public Boolean crearServicio(String nombre, String descripcion, String destino, Date fecha, double costo){
        
        //Creo el objeto Servicio Turistico
        ServicioTuristico servicio = new ServicioTuristico(nombre, descripcion, destino, fecha, costo, true);
        
        Boolean servicioAgregado = controlPers.crearServicio(servicio);
        
        return servicioAgregado;
        
    }

    public List<ServicioTuristico> obtenerServicios() {
        List<ServicioTuristico> servicios =  controlPers.obtenerServicios();
        List<ServicioTuristico> listaServiciosHabilitados = new ArrayList<>();
        for(ServicioTuristico s : servicios){
            if(s.getHabilitado() == true){
                listaServiciosHabilitados.add(s);
            }
        }
        return listaServiciosHabilitados;
    }
    
    public List<ServicioTuristico> obtenerServiciosEliminados() {
        List<ServicioTuristico> servicios =  controlPers.obtenerServicios();
        List<ServicioTuristico> listaServiciosEliminados = new ArrayList<>();
        for(ServicioTuristico s : servicios){
            if(s.getHabilitado() == false){
                listaServiciosEliminados.add(s);
            }
        }
        return listaServiciosEliminados;
    }
    
    public int verificarUsuario(String usuario, String contra){
        List<Usuario> listaUsuarios = controlPers.obtenerUsuarios();
        if(listaUsuarios!=null){
            for(Usuario u: listaUsuarios){
                if(u.getNombre().equals(usuario) && u.getContrasena().equals(contra)){
                    return u.getIdUsuario();
                }
            }
        }
        return -1;
    }

    public void crearUsuario(String nombre, String apellido, String dni, Date fechaNac, String celular, String email, String nacionalidad, String puesto, double sueldo, String calle, String numero, String depto, int cp, String localidad, String provincia, String pais, String nombreUsuario, String contra) {
        Direccion direccion = new Direccion(calle, numero, depto, cp, localidad, provincia, pais);
        Usuario usuario = new Usuario(nombreUsuario, contra);
        Empleado persona = new Empleado(puesto, sueldo, usuario, null, 0, nombre, apellido, dni, fechaNac, celular, email, nacionalidad, direccion);
        
        controlPers.crearUsuario(persona);
    }
    
    public List<Cliente> obtenerClientesHabilitados(){
        List<Cliente> clientes = controlPers.obtenerClientes();
        List<Cliente> listaClientes = new ArrayList<>();
        for(Cliente c: clientes){
            if(c.getHabilitado() == true){
                listaClientes.add(c);
            }
        }
        return listaClientes;
    }

    public void crearCliente(String nombre, String apellido, String dni, String cel, String email, Date fechaNac, String nacionalidad, String calle, String numero, String depto, int cp, String localidad, String provincia, String pais) {
        Direccion direccion = new Direccion(calle, numero, depto, cp, localidad, provincia, pais);
        Cliente persona = new Cliente(0, nombre, apellido, dni, fechaNac, cel, email, nacionalidad, direccion, true);
        
        controlPers.crearCliente(persona);
    }
    
    public List<PaqueteTuristico> obtenerPaquetes(){
        List<PaqueteTuristico> paquetes = controlPers.obtenerPaquetes();
        List<PaqueteTuristico> listaPaquetes = new ArrayList<>();
        for(PaqueteTuristico p: paquetes){
            if(p.getHabilitado() == true){
                listaPaquetes.add(p);
            }
        }
        return listaPaquetes;
    }
    
    public void crearPaquete(List<String> ids, String descripcion, double monto){
        List<ServicioTuristico> listaServicios = new ArrayList<>();
        for(String id : ids){
            if(!id.equals(" ") && !id.equals("")){
                listaServicios.add(controlPers.obtenerServicio(Integer.parseInt(id.replaceAll("\\s+",""))));
            }
        }
        PaqueteTuristico paquete = new PaqueteTuristico(monto, descripcion, true, listaServicios);
        System.out.println(paquete);
        controlPers.crearPaquete(paquete);
    }
    
    public Empleado obtenerEmpleado (int idUsuario){
        return controlPers.obtenerEmpleado(idUsuario);
    }
    
    public void modificarEmpleado(int idEmpleado, String nombre, String apellido, String dni, Date fechaNac, String celular, String email, String nacionalidad, String puesto, double sueldo, String calle, String numero, String depto, int cp, String localidad, String provincia, String pais) throws Exception{
        
        Empleado e = controlPers.obtenerEmpleado(idEmpleado);
        
        Direccion d = e.getDireccion();
        e.setNombre(nombre);
        e.setApellido(apellido);
        e.setDni(dni);
        e.setFechaNac(fechaNac);
        e.setCelular(celular);
        e.setEmail(email);
        e.setNacionalidad(nacionalidad);
        e.setCargo(puesto);
        e.setSueldo(sueldo);
        d.setCalle(calle);
        d.setNumero(numero);
        d.setDepartamento(depto);
        d.setCodigoPostal(cp);
        d.setLocalidad(localidad);
        d.setProvincia(provincia);
        d.setPais(pais);
        
        e.setDireccion(d);
        
        controlPers.modificarEmpleado(e);
    }
    
    public void eliminarServicio(int idServicio) throws Exception{
        ServicioTuristico s = controlPers.obtenerServicio(idServicio);
        s.setHabilitado(false);
        controlPers.eliminarServicio(s);
    }

    public void eliminarPaquete(int id) throws Exception {
        PaqueteTuristico p = controlPers.obtenerPaquete(id);
        p.setHabilitado(false);
        controlPers.eliminarPaquete(p);
    }

    public void eliminarCliente(int id) throws Exception {
        Cliente c = controlPers.obtenerCliente(id);
        c.setHabilitado(false);
        controlPers.eliminarCliente(c);
    }

    public ServicioTuristico obtenerServicio(int idServicio) {
        return controlPers.obtenerServicio(idServicio);
    }

    public void modificarServicio(int idServicio, String tipo, String descripcion, double costo, String destino, Date fecha) throws Exception {
        ServicioTuristico s = controlPers.obtenerServicio(idServicio);
        s.setNombre(tipo);
        s.setDescripcion(descripcion);
        s.setCosto(costo);
        s.setDestino(destino);
        s.setFecha(fecha);
        controlPers.modificarServicio(s);
    }

    public Cliente obtenerCliente(int idCliente) {
        return controlPers.obtenerCliente(idCliente);
    }

    public void modificarCliente(int idCliente, String nombre, String apellido, String dni, String cel, String email, Date fechaNac, String nacionalidad, String calle, String numero, String depto, int cp, String localidad, String provincia, String pais) throws Exception {
        Cliente c = controlPers.obtenerCliente(idCliente);
        Direccion d = c.getDireccion();
        c.setNombre(nombre);
        c.setApellido(apellido);
        c.setDni(dni);
        c.setFechaNac(fechaNac);
        c.setCelular(cel);
        c.setEmail(email);
        c.setNacionalidad(nacionalidad);
        d.setCalle(calle);
        d.setNumero(numero);
        d.setDepartamento(depto);
        d.setCodigoPostal(cp);
        d.setLocalidad(localidad);
        d.setProvincia(provincia);
        d.setPais(pais);
        
        c.setDireccion(d);
        controlPers.modificarCliente(c);
    }

    public Empleado obtenerUsuario(int idUsuario) {
        return controlPers.obtenerUsuario(idUsuario);
    }

    public void recuperarServicio(int id) throws Exception {
        ServicioTuristico s = controlPers.obtenerServicio(id);
        s.setHabilitado(Boolean.TRUE);
        controlPers.modificarServicio(s);
    }

    public void crearVenta(int idCliente, List<String> idsPaquetes, List<String> idsServicios, int idEmpleado, String medioPago) throws Exception {
        List<ServicioTuristico> listaServicios = new ArrayList<>();
        List<PaqueteTuristico> listaPaquetes = new ArrayList<>();
        for(String i : idsServicios){
            ServicioTuristico s = obtenerServicio(Integer.parseInt(i));
            listaServicios.add(s);
        }
        
        for(String i : idsPaquetes){
            PaqueteTuristico p = obtenerPaquete(Integer.parseInt(i));
            listaPaquetes.add(p);
        }
        Venta v = new Venta(new Date(), medioPago, listaServicios, listaPaquetes);
        
        v = controlPers.crearVenta(v);
        
        Empleado e = obtenerEmpleado(idEmpleado);
        List<Venta> ventasEmpleado = e.getListaVentas();
        ventasEmpleado.add(v);
        e.setListaVentas(ventasEmpleado);
        controlPers.modificarEmpleado(e);
        
        Cliente c = obtenerCliente(idCliente);
        List<Venta> comprasCliente = c.getListaVentas();
        comprasCliente.add(v);
        c.setListaVentas(comprasCliente);
        controlPers.modificarCliente(c);
        
    }

    private PaqueteTuristico obtenerPaquete(int idPaquete) {
        return controlPers.obtenerPaquete(idPaquete);
    }

    public List<Venta> obtenerVentas() {
        return controlPers.obtenerVentas();
    }

    public Map<Integer, Persona> obtenerVentaCliente() {
        Map<Integer, Persona> clienteVenta = new HashMap<>();
        List<Cliente> clientes = obtenerClientes();
        for(Cliente c: clientes){
            for(Venta v : c.getListaVentas()){
                clienteVenta.put(v.getIdVenta(), c);
            }
        }
        return clienteVenta;
    }
    
    public Map<Integer, Persona> obtenerVentaEmpleado() {
        Map<Integer, Persona> empleadoVenta = new HashMap<>();
        List<Empleado> Empleados = obtenerEmpleados();
        for(Empleado c: Empleados){
            for(Venta v : c.getListaVentas()){
                empleadoVenta.put(v.getIdVenta(), c);
            }
        }
        return empleadoVenta;
    }

    private List<Empleado> obtenerEmpleados() {
        return controlPers.obtenerEmpleados();
    }

    private List<Cliente> obtenerClientes() {
        return controlPers.obtenerClientes();
    }

}
