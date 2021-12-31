package Logica;

import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-27T13:06:34")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Date> fecha;
    public static volatile SingularAttribute<Venta, PaqueteTuristico> paqueteTuristico;
    public static volatile ListAttribute<Venta, ServicioTuristico> listaServicios;
    public static volatile SingularAttribute<Venta, String> medioDePago;
    public static volatile SingularAttribute<Venta, Integer> idVenta;

}