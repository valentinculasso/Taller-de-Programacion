/*

 */
package ejercicio2repasoo;

import PaqueteLectura.Lector;

public class Ejercicio2REPASOO {

    
    public static void main(String[] args) {
        
        int autosRegistrados = 0;
        String dueño, patente, patenteBuscada;
        int piso, plaza;

        Estacionamiento estacionamiento;
        Auto auto;

        estacionamiento = new Estacionamiento("Estacionamiento Informatica", "Calle 50 y 115");

        while (autosRegistrados < 1) {
            System.out.print("Patente: ");
            patente = Lector.leerString();
            System.out.print("Dueño: ");
            dueño = Lector.leerString();
            System.out.print("piso: ");
            piso = Lector.leerInt();
            System.out.print("plaza: ");
            plaza = Lector.leerInt();
            auto = new Auto(dueño, patente);
            estacionamiento.registrarAuto(auto, piso, plaza);
            autosRegistrados++;
        }

        System.out.println(estacionamiento.toString());
        System.out.println();
        System.out.println(estacionamiento.CantAutos(1) + " autos estacionados en plaza 1");
        System.out.println();
        System.out.print("Patente: ");
        patenteBuscada = Lector.leerString();
        System.out.println(estacionamiento.buscarPatente(patenteBuscada));
        
                
    }
    
}
