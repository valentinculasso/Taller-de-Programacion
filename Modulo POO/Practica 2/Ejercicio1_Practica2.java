/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio1_Practica2 {
   
    public static void main(String[] args){
       
        String nombre;
        int DNI;
        int edad;
       
        nombre = Lector.leerString();
        DNI = Lector.leerInt();
        edad = Lector.leerInt();
       
        Persona p = new Persona(nombre,DNI,edad);
       
        String s = p.toString();
        System.out.println(s);
       
        int j = p.getDNI();
        System.out.println(j);
       
       
    }
}