package Logica;

import Logica.Venta;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-27T13:06:34")
@StaticMetamodel(Cliente.class)
public class Cliente_ extends Persona_ {

    public static volatile ListAttribute<Cliente, Venta> listaVentas;
    public static volatile SingularAttribute<Cliente, Boolean> habilitado;

}