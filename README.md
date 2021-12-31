# TP Final - Sistema para Agencia de Turismo
El siguiente proyecto fue realizado en el curso de <code>Desarrollador Web Fullstack Java</code> del Polotic Misiones en el 2021.
Fue diseñado para que los empleados de la agencia puedan gestionar los clientes, servicios y paquetes turisticos y ventas de la empresa.

## Indice
1. <a href="#acerca-de-la-implementacion">Acerca de la Implementacion</a>
2. <a href="#imagenes">Imagenes de las Interfaces</a>
3. <a href="#etapas-del-proyecto">Etapas del Proyecto</a>
4. <a href="#aclaraciones">Aclaraciones</a>


## Acerca de la Implementacion
- El sistema fue implementado con <code>Java</code> usando el IDE Netbeans. <br>
- La aplicacion tiene formato web por lo que se utilizo <code>JSP</code> (Java Server Pages), <code>JPA</code> (Java Persistence API) con Base de Datos <code>MySQL</code> y se tuvieron en cuenta los principios de la Programacion Orientada a Objetos.
<br>- Se diferenciaron las capas de Logica, Persistencia e Interfaz Grafica creando una Controladora de Logica, una Controladora de Persistencia y los respectivos <code>Servlets</code> para lograr la comunicacion entre la interfaz y la capa logica.
<br>- Se realizan validaciones de los campos mediante Javascript utilizando <code>JQuery</code>. <br>- Se utilizo una plantilla para la interfaz que luego se la personalizo utilizando <code>Bootstrap</code>.

## Imagenes

<div align="center">
  <b>Registro y LogIn de Usuario</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147799611-f5cd8ca6-206b-4cce-83bf-7ce24b383aee.png" height="800px" alt="login">
  <br><br>
  <b>Seccion de perfil de Empleado</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147799730-38941b15-b8b5-4cec-bb3f-00d2a2d8012a.png" height="600px" alt="empleado">
  <br><br>
  <b>Seccion de Servicios Turisticos</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147799790-7bb457b4-b261-426a-b291-3f66c6ef747f.png" height="600px" alt="servicios">  
  <br><br>
  <b>Seccion de Paquetes Turisticos</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147800144-82c3d817-4df9-4aea-a8d2-120c0ce3ec13.png" height="600px" alt="paquetes">
  <br><br>
  <b>Seccion de Ventas</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147800051-a9002559-b4da-4525-8b3a-dd4d88b9b617.png" height="800px" alt="venta">
  <br><br>
  <b>Seccion de Estadisticas</b>
  <br><br>
  <img src="https://user-images.githubusercontent.com/75265449/147799893-8b5a1be4-8685-491f-beb6-e0349840d94a.png"  height="600px"  alt="estadisticas">
</div>

## Etapas del proyecto
1 - Se comenzo analizando los requerimientos que el sistema debia cumplir a partir del enunciado brindado por la profesora del curso.
<br>
2 - Se realizo el <code>Diagrama de Clases</code> teniendo en cuenta herencias y cardinalidades.
<div align="center">
  <img src="https://user-images.githubusercontent.com/75265449/147800332-b4af781d-4359-4d27-a29a-696d735408a4.png" alt="diagrama-clases" width="80%">
</div>
<br>

3 - Se realizo la implementacion de las siguientes funcionalidades:
<br>
<li> Registro y login de usuario</li>
<li> Alta y Modificacion de empleados</li>
<li> Alta, Baja y Modificacion de clientes</li>
<li> Alta, Baja y Modificacion de servicios turisticos</li>
<li> Alta, Baja y Modificacion de paquetes turisticos</li>
<li> Alta y seccion de estadisticas de ventas</li>


## Aclaraciones
Para correr el codigo, los datos de la base de datos son:
NOMBRE DE BASE DE DATOS: tpfinal
URL: jdbc:mysql://localhost:3307/tpfinal?serverTimezone=UTC
PUERTO: 3307
USUARIO: root
CONTRASENA: 
