/*
Una estacion de GNC quiere administrar la informacion correspondiente a la carga de gas. La estacion posee una direccion.
precio por m3 y la informacion de sus 6 surtidores. De cada surtidor se conoce si se encuentra fuera de servicio y la 
informacion de las ventas (como maximo V). De cada venta se registra: DNI, cant m3 cargados, monto abonado, medio de pago (debido, credito o efectivo).

1. Genere las clases necesarias. Provea constructores para crear: la estacion para 6 surtidores, a partir de una direccion, un precio por m3 y un maximo de V
de ventas por surtidor; cada surtidor en servicio y con capacidad para V ventas (inicialmente sin ventas); y cada venta a partir de la informacion necesaria.
 */
package ejercicio2repaso;

import PaqueteLectura.Lector;

public class Ejercicio2Repaso {

    public static void main(String[] args) {
        
        
        Estacion estacion = new Estacion("Avellaneda 123", 250, 1);
        
        int DNI = Lector.leerInt();
        double m3 = Lector.leerDouble();
        double monto = m3*estacion.getPreciom3();
        String metodoPago = "Efectivo";
        
        Venta ventas = new Venta(DNI, m3, monto, metodoPago);
        
        estacion.AgregarVenta(0, ventas); // agrego una venta al surtidor 2
        
        //
        
        int DNI2 = Lector.leerInt();
        double me3 = Lector.leerDouble();
        double monto2 = me3*estacion.getPreciom3();
        String metodoPago2 = "Efectivo";
        
        Venta ventas2 = new Venta(DNI2, me3, monto2, metodoPago2);
        
        estacion.AgregarVenta(1, ventas2); // agrego una venta al surtidor 2
        
        //
        estacion.MarcarFueraServicio(15);
        
        System.out.println(estacion.toString());
        

        Venta maxVenta = estacion.CalcularMayorVenta();
        System.out.println("La maxima venta es " + maxVenta.toString());
    }
    
}
