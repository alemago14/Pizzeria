package pizzerias;
// Generated 02/05/2021 17:41:00 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tamanopizza generated by hbm2java
 */
public class Tamanopizza  implements java.io.Serializable {


     private int idtamanoPizza;
     private String nombre;
     private int cantPorciones;
     private Set pizzas = new HashSet(0);

    public Tamanopizza() {
    }

	
    public Tamanopizza(int idtamanoPizza, String nombre, int cantPorciones) {
        this.idtamanoPizza = idtamanoPizza;
        this.nombre = nombre;
        this.cantPorciones = cantPorciones;
    }
    public Tamanopizza(int idtamanoPizza, String nombre, int cantPorciones, Set pizzas) {
       this.idtamanoPizza = idtamanoPizza;
       this.nombre = nombre;
       this.cantPorciones = cantPorciones;
       this.pizzas = pizzas;
    }
   
    public int getIdtamanoPizza() {
        return this.idtamanoPizza;
    }
    
    public void setIdtamanoPizza(int idtamanoPizza) {
        this.idtamanoPizza = idtamanoPizza;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getCantPorciones() {
        return this.cantPorciones;
    }
    
    public void setCantPorciones(int cantPorciones) {
        this.cantPorciones = cantPorciones;
    }
    public Set getPizzas() {
        return this.pizzas;
    }
    
    public void setPizzas(Set pizzas) {
        this.pizzas = pizzas;
    }




}

