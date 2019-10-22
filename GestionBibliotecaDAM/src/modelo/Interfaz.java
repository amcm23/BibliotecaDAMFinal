package modelo;

import Vista.Vista;
import java.awt.Component;

/**
 *
 * @author DAM
 */

public class Interfaz {
    Vista interfaces = null;
    
    public Interfaz(Vista interfaces){
        this.interfaces = interfaces;
    }
    public void Cambio(Component c){
        interfaces.Contenedor.removeAll();
        interfaces.Contenedor.add(c);
        interfaces.Contenedor.repaint();
        interfaces.Contenedor.revalidate();
        interfaces.pack();
    }
}
