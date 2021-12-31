
package Logica;

import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona{
    @OneToMany
    private List<Venta> listaVentas;
    @Basic
    private Boolean habilitado;
    
    public Cliente() {
    }

    public Cliente(int idPersona, String nombre, String apellido, String dni, Date fechaNac, String celular, String email, String nacionalidad, Direccion direccion, Boolean habilitado) {
        super(idPersona, nombre, apellido, dni, fechaNac, celular, email, nacionalidad, direccion);
        this.habilitado = habilitado;
    }
    
    public Cliente(List<Venta> listaVentas, int idPersona, String nombre, String apellido, String dni, Date fechaNac, String celular, String email, String nacionalidad, Direccion direccion, Boolean habilitado) {
        super(idPersona, nombre, apellido, dni, fechaNac, celular, email, nacionalidad, direccion);
        this.listaVentas = listaVentas;
        this.habilitado = habilitado;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    @Override
    public String toString() {
        return "Cliente{" + "listaVentas=" + listaVentas + '}';
    }
    
    
}
