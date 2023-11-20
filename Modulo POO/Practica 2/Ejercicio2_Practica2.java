/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2_Practica2 {

   
    public static void main(String[] args) {
        Persona [] vector = new Persona[15];
        int dimL = 0;
       
        String nombre;
        int DNI;
        int edad;
       
        nombre = GeneradorAleatorio.generarString(10);
        DNI = GeneradorAleatorio.generarInt(60000000);
        edad = GeneradorAleatorio.generarInt(100);
       
        while((dimL < 15)&&(edad != 0)){
            vector[dimL] = new Persona(nombre, DNI, edad);
            dimL += 1;
            nombre = GeneradorAleatorio.generarString(10);
            DNI = GeneradorAleatorio.generarInt(60000000);
            edad = GeneradorAleatorio.generarInt(100);
        }
       
        int cant = 0;
        int min = 60000000;
        Persona minPer = new Persona();
        for(int i = 0; i<15; i++){
            if(vector[i].getEdad() > 65)
                cant++;
            if(vector[i].getDNI() < min){
                min = vector[i].getDNI();
                minPer = vector[i];
            }
        }
        System.out.println("La cantidad de personas mayores de 65 anos es " + cant);
        System.out.println("La persona con menor DNI es " + minPer.toString());
    }
   
}

