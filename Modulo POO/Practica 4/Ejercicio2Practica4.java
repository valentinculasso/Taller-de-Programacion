package tema4;

import PaqueteLectura.Lector;

public class Ejercicio2Practica4 {

    public static void main(String[] args) {
        
        // Ingresar jugador:
        System.out.println("Ingrese el nombre del jugador ");
        String nombreJugador = Lector.leerString();
        System.out.println("Ingrese el sueldo del jugador ");
        double sueldoJugador = Lector.leerDouble();
        System.out.println("Ingrese la antiguedad del jugador ");
        int antiguedadJugador = Lector.leerInt();
        System.out.println("Ingrese el numerdo de goles del jugador ");
        int numeroGoles = Lector.leerInt();
        System.out.println("Ingrese la cantidad de partidos del jugador ");
        int numeroPartidos = Lector.leerInt();
        
        Jugador jugador = new Jugador(numeroGoles, numeroPartidos, nombreJugador, sueldoJugador, antiguedadJugador);
        
        double sueldoAumentado = jugador.calcularSueldoACobrar(); // el modulo me incrementa y si cumple condicion incrementa nuevamente.
        jugador.setSueldo(sueldoAumentado); // modifico la variable sueldo y le pongo el sueldo correspondiente.
        System.out.println(jugador.toString());
        
    }
    
}
