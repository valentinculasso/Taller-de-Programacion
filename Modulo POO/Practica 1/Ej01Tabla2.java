/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // Declaro vector de enteros con indices de 0 a 10
        int i; // Declaro variable i (indice)
        int numero;
        for (i=0;i<DF;i++)  // Aca cargo el vector
            tabla2[i]=2*i;
        System.out.println("2x" + "6" + "="+ tabla2[6]);
        
        // Generar numeros aleatorios hasta obener el numero 11
        
        numero = GeneradorAleatorio.generarInt(11);
        while (numero != 10){
            numero = GeneradorAleatorio.generarInt(11);
            System.out.println("2x" + numero + "= " + tabla2[numero]);
        }
    }  
}
