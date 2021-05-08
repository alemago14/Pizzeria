package pizzerias;
// Generated 02/05/2021 17:41:00 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Estadopedido generated by hbm2java
 */
public class Estadopedido  implements java.io.Serializable {


     private int idestadoPedido;
     private String nombre;
     private Set pedidos = new HashSet(0);

    public Estadopedido() {
    }

	
    public Estadopedido(int idestadoPedido, String nombre) {
        this.idestadoPedido = idestadoPedido;
        this.nombre = nombre;
    }
    public Estadopedido(int idestadoPedido, String nombre, Set pedidos) {
       this.idestadoPedido = idestadoPedido;
       this.nombre = nombre;
       this.pedidos = pedidos;
    }
   
    public int getIdestadoPedido() {
        return this.idestadoPedido;
    }
    
    public void setIdestadoPedido(int idestadoPedido) {
        this.idestadoPedido = idestadoPedido;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getPedidos() {
        return this.pedidos;
    }
    
    public void setPedidos(Set pedidos) {
        this.pedidos = pedidos;
    }




}


