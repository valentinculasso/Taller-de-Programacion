/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;


public class Ej05Practica1 {
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        // Matriz de 5x4 : 5 Clientes 4 aspectos
        // cliente 1: 8 6 7 9
        // cliente 2: 10 8 6 9
        // ...
        int [][] clientes = new int [5][4];
        int i, j;
        for(i=0; i<5; i++)
            for(j=0; j<4; j++)
                clientes[i][j] = GeneradorAleatorio.generarInt(10);
        
        for(i=0; i<5; i++)
            for(j=0; j<4; j++)
               System.out.println("matriz [" + i + "]" + "[" + j + "]" + " = "+ clientes[i][j]);
        
        // Calcular calificacion promedio de cada aspecto
        int sumaAspectos;
        for(j = 0; j<4; j++){
            sumaAspectos = 0;
            for(i = 0; i<5; i++){
                sumaAspectos += clientes[i][j];
            }
            int promedio = sumaAspectos/4;
            System.out.println("La calificacion promedio obtenida del aspecto " + j + " es de " + promedio);
        }
                
    }          
}
