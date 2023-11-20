/*
f) Realice un programa principal que cree un Sistema con reporte anual para 3 años
consecutivos a partir del 2021, para la estación La Plata (latitud -34.921 y longitud -
57.955). Cargue todas las temperaturas (para todos los meses y años). Informe los
promedios anuales, y el mes y año en que se registró la mayor temperatura.
Luego cree un Sistema con informe mensual para 4 años a partir de 2020, para la
estación Mar del Plata (latitud -38.002 y longitud -57.556). Cargue todas las
temperaturas (para todos los meses y años). Informe los promedios mensuales, y el
mes y año en que se registró la mayor temperatura.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio. 
 */
package tema4;

import PaqueteLectura.Lector;

public class Ejercicio6Practica4 {


    public static void main(String[] args) {
        
        Estacion laPlata = new Estacion("La Plata", -34.921, 57.955, 1);
        
        int i, j;
        for(i= 0; i<1; i++)
            for(j= 0; j<11; j++){
                double temperatura = Lector.leerDouble();
                laPlata.registrarTemperatura(i, j, temperatura);
            }
        
        laPlata.mayorTemperatura();
        
        
        
        
        
        
        
        
    }
    
}
