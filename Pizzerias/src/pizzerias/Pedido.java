package pizzerias;
// Generated 02/05/2021 17:41:00 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Pedido generated by hbm2java
 */
public class Pedido  implements java.io.Serializable {


     private int idpedido;
     private Estadopedido estadopedido;
     private Factura factura;
     private Date fechaHoraCracion;
     private Date fechaHoraEntrega;
     private String nombreCliente;
     private Set detallepedidos = new HashSet(0);

    public Pedido() {
    }

	
    public Pedido(int idpedido, Estadopedido estadopedido, Factura factura, Date fechaHoraCracion, Date fechaHoraEntrega, String nombreCliente) {
        this.idpedido = idpedido;
        this.estadopedido = estadopedido;
        this.factura = factura;
        this.fechaHoraCracion = fechaHoraCracion;
        this.fechaHoraEntrega = fechaHoraEntrega;
        this.nombreCliente = nombreCliente;
    }
    public Pedido(int idpedido, Estadopedido estadopedido, Factura factura, Date fechaHoraCracion, Date fechaHoraEntrega, String nombreCliente, Set detallepedidos) {
       this.idpedido = idpedido;
       this.estadopedido = estadopedido;
       this.factura = factura;
       this.fechaHoraCracion = fechaHoraCracion;
       this.fechaHoraEntrega = fechaHoraEntrega;
       this.nombreCliente = nombreCliente;
       this.detallepedidos = detallepedidos;
    }
   
    public int getIdpedido() {
        return this.idpedido;
    }
    
    public void setIdpedido(int idpedido) {
        this.idpedido = idpedido;
    }
    public Estadopedido getEstadopedido() {
        return this.estadopedido;
    }
    
    public void setEstadopedido(Estadopedido estadopedido) {
        this.estadopedido = estadopedido;
    }
    public Factura getFactura() {
        return this.factura;
    }
    
    public void setFactura(Factura factura) {
        this.factura = factura;
    }
    public Date getFechaHoraCracion() {
        return this.fechaHoraCracion;
    }
    
    public void setFechaHoraCracion(Date fechaHoraCracion) {
        this.fechaHoraCracion = fechaHoraCracion;
    }
    public Date getFechaHoraEntrega() {
        return this.fechaHoraEntrega;
    }
    
    public void setFechaHoraEntrega(Date fechaHoraEntrega) {
        this.fechaHoraEntrega = fechaHoraEntrega;
    }
    public String getNombreCliente() {
        return this.nombreCliente;
    }
    
    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }
    public Set getDetallepedidos() {
        return this.detallepedidos;
    }
    
    public void setDetallepedidos(Set detallepedidos) {
        this.detallepedidos = detallepedidos;
    }




}


