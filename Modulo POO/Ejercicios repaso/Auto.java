/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2repasoo;


public class Auto {
    private String nombre;
    private String patente;

    public Auto(String unnombre, String unapatente) {
        this.nombre = unnombre;
        this.patente = unapatente;
    }

    public String getPatente() {
        return patente;
    }

    
    
    
    
    @Override
    public String toString() {
        return "Auto{" + "nombre=" + nombre + ", patente=" + patente + '}';
    }
    
    
}
