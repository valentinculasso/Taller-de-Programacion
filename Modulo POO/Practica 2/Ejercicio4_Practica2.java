/*
4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.

 */
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio4_Practica2 {
    
    public static void main(String[] args){
    
        Persona [][] matriz = new Persona [5][8];
       
        int[] dimLMatriz = new int[5];
       
        int i = 0, j = 0;
        String nombre = " ";
        int edad, dni;
        
        // Ingresar datos
        System.out.println("Ingrese el nombre de la persona ");
        nombre = Lector.leerString();
        if(!nombre.equals("ZZZ")){
            System.out.println("Ingrese el dni de la persona ");
            dni = Lector.leerInt();
            System.out.println("Ingrese la edad de la persona ");
            edad = Lector.leerInt();
            System.out.println("Ingrese el dia en el cual se quiere presentar al casting (0..4): ");
            i = Lector.leerInt();
            matriz[i][j] = new Persona(nombre, dni, edad);
        }
        // Aca lo que hice fue ingresar los datos mas el dia en el que quiere hacer el casting.
        
        while(!nombre.equals("ZZZ")){
            dimLMatriz[i]++; // La cantidad almacenada + 1 ---> tengo que controlar que no se pase de 8 porque si se pasa, estaria fuera de rango
                             // le pongo limite "hasta 8" ya que cuando recorra el for lo haria asi: j<8 (osea de 0..7)
            if(dimLMatriz[i] > 8){
                dimLMatriz[i] --;
            }
            // Ingresar datos
            System.out.println("Ingrese el nombre de la persona ");
            nombre = Lector.leerString();
            if (!nombre.equals("ZZZ")) {
                System.out.println("Ingrese el dni de la persona ");
                dni = Lector.leerInt();
                System.out.println("Ingrese la edad de la persona ");
                edad = Lector.leerInt();
                System.out.println("Ingrese el dia en el cual se quiere presentar al casting (0..4): ");
                i = Lector.leerInt();
                if(dimLMatriz[i] > 7){
                    System.out.println("No quedan turnos en el dia ingresado.");
                }
                else{
                    j = dimLMatriz[i];
                    matriz[i][j] = new Persona(nombre, dni, edad);
                }
            }
        }  
        
        for(i=0; i<5; i++){
                int limite = dimLMatriz[i];
                for(j=0; j<limite; j++) // si limite es 8 -> j va "hasta" 8 -> 0..1..2..3..4..5..6..7..corta
                    System.out.println(matriz[i][j].toString());
                   
        }
        
    }
}

/* 
    public void agregarMatriz(Auto auto){
        
        if(dimL[i] < limite){
            matriz[i][j]= auto; // por ejemplo matriz[0][5]
            dimL[i]++;
        }
        else{
            i++;
            if(i<5){ // 5 a modo de ejemplo
                matriz[i][j] = auto; // por ejemplo matriz[1][0]
                diml[i]++;
            }
        }
    }
*/