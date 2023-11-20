/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.

 */
package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej04Practica1 {
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        // Declaro la matriz de 8x4
        int [][] edificio = new int [4][8];
        
        // Ingreso valores
        int oficina = GeneradorAleatorio.generarInt(4);
        int piso = GeneradorAleatorio.generarInt(8);
        System.out.println("La persona ingresada concurrio a la oficina [" + oficina + "] del piso [" + piso + "]");
        while (piso != 7){
            edificio[oficina][piso] += 1; // Sumo "cant + 1" 
            oficina = GeneradorAleatorio.generarInt(4);
            piso = GeneradorAleatorio.generarInt(8);
            System.out.println("La persona ingresada concurrio a la oficina [" + oficina + "] del piso [" + piso + "]");
        }
        // Imprimir matriz
        int i, j;
        for(i=0; i<4; i++)
            for(j=0; j<8; j++)
                System.out.println("matriz [" + i + "]" + "[" + j + "]" + " = "+ edificio[i][j]);
    
    }
}
