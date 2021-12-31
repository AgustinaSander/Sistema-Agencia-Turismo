
package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Venta implements Serializable{
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    private int idVenta;
    @Basic
    private Date fecha;
    private String medioDePago;
    @ManyToMany
    private List<ServicioTuristico> listaServicios;
    @ManyToMany
    private List<PaqueteTuristico> listaPaquetes;

    public Venta() {
    }

    public Venta(Date fecha, String medioDePago, List<ServicioTuristico> listaServicios, List<PaqueteTuristico> listaPaquetes) {
        this.fecha = fecha;
        this.medioDePago = medioDePago;
        this.listaServicios = listaServicios;
        this.listaPaquetes = listaPaquetes;
    }

    public Venta(int idVenta, Date fecha, String medioDePago, List<ServicioTuristico> listaServicios, List<PaqueteTuristico> listaPaquetes) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.medioDePago = medioDePago;
        this.listaServicios = listaServicios;
        this.listaPaquetes = listaPaquetes;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }

    public List<ServicioTuristico> getListaServicios() {
        return listaServicios;
    }

    public void setListaServicios(List<ServicioTuristico> listaServicios) {
        this.listaServicios = listaServicios;
    }

    public List<PaqueteTuristico> getListaPaquetes() {
        return listaPaquetes;
    }

    public void setListaPaquetes(List<PaqueteTuristico> paquetes) {
        this.listaPaquetes = paquetes;
    }

    @Override
    public String toString() {
        return "Venta{" + "idVenta=" + idVenta + ", fecha=" + fecha + ", medioDePago=" + medioDePago + ", listaServicios=" + listaServicios + ", listaPaquetes=" + listaPaquetes + '}';
    }

    
}
