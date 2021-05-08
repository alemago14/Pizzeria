/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pizzerias;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Maugouber
 */
public class Controlador {
    //Atributos
    ArrayList<Pedido> pedi;
    ArrayList<Detallepedido> detaP;

    public ArrayList<Detallepedido> getDetaP() {
        return detaP;
    }

    public void setDetaP(ArrayList<Detallepedido> detaP) {
        this.detaP = detaP;
    }
    

    public ArrayList<Pedido> getPedi() {
        return pedi;
    }

    public void setPedi(ArrayList<Pedido> pedi) {
        this.pedi = pedi;
    }

    public Controlador() {
        this.pedi = new ArrayList<Pedido>();
        this.detaP = new ArrayList<Detallepedido>();
    }
    
    
    DefaultTableModel modelo = new DefaultTableModel();
    DefaultTableModel modelo2 = new DefaultTableModel();
    
    public void Iniciar(JTable tabla){
        Session session = HibernateUtil.openSession();
        session.beginTransaction();
        
        Query query = HibernateUtil.getCurrentSession().createQuery("FROM Pedido");
        pedi = (ArrayList<Pedido>) query.list();
        
        session.getTransaction().commit();
        session.close();
        
        Object[] titulos = {"N° Pedido","Fecha","Hora","Cliente"};
        Object[][] info = new Object[pedi.size()][4];
        
        SimpleDateFormat fecha = new SimpleDateFormat("dd/MM/yy");
        SimpleDateFormat hora = new SimpleDateFormat("kk:mm");
        for (int i = 0; i <= pedi.size() - 1; i++) {
            info[i][3] = pedi.get(i).getNombreCliente();
            info[i][0] = pedi.get(i).getIdpedido();
            info[i][1] = fecha.format(pedi.get(i).getFechaHoraCracion());
            info[i][2] = hora.format(pedi.get(i).getFechaHoraCracion());
        }
        
        modelo = new DefaultTableModel(info, titulos);
        tabla.setModel(modelo);
        
    }
    
    public void Pedi2(JTable tabla, JTable tabla2, JLabel eti, JLabel total){
        int ind = tabla.getSelectedRow();
        float ttal = 0;
        ind = ind + 1;
        
        Session session = HibernateUtil.openSession();
        session.beginTransaction();
        
        Query query = HibernateUtil.getCurrentSession().createQuery("FROM Detallepedido WHERE IDPedido = " + ind);
        detaP = (ArrayList<Detallepedido>) query.list();
        Query query2 = HibernateUtil.getCurrentSession().createQuery("FROM Pedido");
        pedi = (ArrayList<Pedido>) query2.list();
        
        session.getTransaction().commit();
        session.close();
       
        
        eti.setText("Pedido N°" + ind + " Cliente: " + (pedi.get(ind - 1).getNombreCliente()) + ".");
        
        Object[] titulos = {"Cant","Pizza","Precio","Subtotal"};
        Object[][] info = new Object[detaP.size()][4];
        
        for (int i = 0; i <= detaP.size() - 1; i++) {
            info[i][0] = detaP.get(i).getCantidad();
            
            session = HibernateUtil.openSession();
            session.beginTransaction();
            query = HibernateUtil.openSession().createQuery("SELECT nombre FROM Pizza WHERE IDPizza = " + detaP.get(i).getPizza().getIdpizza());
            List<Object> lista1 = query.list();
            session.getTransaction().commit();
            session.close();
            info[i][1] = lista1.get(0);
            info[i][2] = detaP.get(i).getPrecio();
            info[i][3] = ((detaP.get(i).getCantidad()) * (detaP.get(i).getPrecio()));
            ttal = ttal + ((detaP.get(i).getCantidad()) * (detaP.get(i).getPrecio()));
        }
        
        modelo2 = new DefaultTableModel(info, titulos);
        tabla2.setModel(modelo2);
        
        total.setText("Total: $" + ttal);
    }
}
