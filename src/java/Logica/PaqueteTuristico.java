
package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class PaqueteTuristico implements Serializable{
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    private int idPaquete;
    @Basic
    private double costo;
    private String descripcion;
    private Boolean habilitado;
    @ManyToMany
    private List<ServicioTuristico> listaServicios;

    public PaqueteTuristico() {
    }

    public PaqueteTuristico(double costo, String descripcion, Boolean habilitado, List<ServicioTuristico> listaServicios) {
        this.costo = costo;
        this.descripcion = descripcion;
        this.listaServicios = listaServicios;
        this.habilitado = habilitado;
    }

    public PaqueteTuristico(int idPaquete, double costo, String descripcion, Boolean habilitado, List<ServicioTuristico> listaServicios) {
        this.idPaquete = idPaquete;
        this.costo = costo;
        this.descripcion = descripcion;
        this.listaServicios = listaServicios;
        this.habilitado = habilitado;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    

    public int getIdPaquete() {
        return idPaquete;
    }

    public void setIdPaquete(int idPaquete) {
        this.idPaquete = idPaquete;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public List<ServicioTuristico> getListaServicios() {
        return listaServicios;
    }

    public void setListaServicios(List<ServicioTuristico> listaServicios) {
        this.listaServicios = listaServicios;
    }

    @Override
    public String toString() {
        return "PaqueteTuristico{" + "idPaquete=" + idPaquete + ", costo=" + costo + ", descripcion=" + descripcion + ", listaServicios=" + listaServicios + '}';
    }

   
    
    
}
