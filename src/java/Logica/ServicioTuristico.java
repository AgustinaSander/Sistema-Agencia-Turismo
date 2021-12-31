
package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ServicioTuristico implements Serializable {
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    private int idServicio;
    @Basic
    private String nombre;
    private String descripcion;
    private String destino;
    private double costo;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic
    private Boolean habilitado;
    
    public ServicioTuristico() {
    }

    public ServicioTuristico(int idServicio, String nombre, String descripcion, String destino, Date fecha, double costo, Boolean habilitado) {
        this.idServicio = idServicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.destino = destino;
        this.fecha = fecha;
        this.costo = costo;
        this.habilitado = habilitado;
    }

    public ServicioTuristico(String nombre, String descripcion, String destino, Date fecha, double costo, Boolean habilitado) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.destino = destino;
        this.fecha = fecha;
        this.costo = costo;
        this.habilitado = habilitado;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    @Override
    public String toString() {
        return "ServicioTuristico{" + "idServicio=" + idServicio + ", nombre=" + nombre + ", descripcion=" + descripcion + ", destino=" + destino + ", fecha=" + fecha + ", costo=" + costo + '}';
    }
    
    
}
