/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio3_Practica2 {
   
    public static void main(String[] args) {
       
        Persona [][] matriz = new Persona [5][8];
     
        int dimLi = 0;
        int dimLj = 0;
        
        int i = 0, j = 0;
        String nombre = " ";
        int edad, dni;
       
        while((i<5) && (!nombre.equals("ZZZ"))){
            
            while((j<8) && (!nombre.equals("ZZZ"))){
                
                System.out.println("Ingrese el nombre de la persona ");
                nombre = Lector.leerString();
                
                if(!nombre.equals("ZZZ")){
                    
                    System.out.println("Ingrese el dni de la persona ");
                    dni = Lector.leerInt();
                    System.out.println("Ingrese la edad de la persona ");
                    edad = Lector.leerInt();
                    matriz[i][j]= new Persona(nombre,dni,edad);
                    j++;
                }
                else
                    dimLj = j;
            }
            if(!nombre.equals("ZZZ")){
                j = 0;
                i++;
            }
        } 
        
        dimLi = i; // dimension logica "i" de la matriz
        
        for(i=0; i <= dimLi; i++){ // 0 - 3 -> 0...1...2...3 
            
                // Si bien yo conozco el limite de "j" este limite es para una fila en concreto, entonces limite lo uso siempre y cuando este en la "fila de corte" (dimLi)
                if(i == dimLi){
                    int limite = dimLj;
                    for(j=0; j<limite; j++)
                        System.out.println(matriz[i][j].toString());
                }
                else
                    for(j=0; j<8; j++)
                        System.out.println(matriz[i][j].toString());
                   
        }
    }
}
