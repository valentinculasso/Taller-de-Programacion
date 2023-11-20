/*

 */
package ejercicio4repaso;


public abstract class Persona {
    private String nombre;
    private int DNI;
    private int edad;
    
    public Persona (String unNombre, int unDNI, int unaEdad){
        this.nombre = unNombre;
        this.DNI = unDNI;
        this.edad = unaEdad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "nombre=" + nombre + ", DNI=" + DNI + ", edad=" + edad + '}';
    }
    
    
}
