package Logica;

import Logica.ServicioTuristico;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-27T13:06:34")
@StaticMetamodel(PaqueteTuristico.class)
public class PaqueteTuristico_ { 

    public static volatile SingularAttribute<PaqueteTuristico, String> descripcion;
    public static volatile SingularAttribute<PaqueteTuristico, Double> costo;
    public static volatile SingularAttribute<PaqueteTuristico, Integer> idPaquete;
    public static volatile ListAttribute<PaqueteTuristico, ServicioTuristico> listaServicios;
    public static volatile SingularAttribute<PaqueteTuristico, Boolean> habilitado;

}