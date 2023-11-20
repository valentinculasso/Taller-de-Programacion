/*

 */
package ejercicio4repaso;


public class Director extends Persona{
    private int antiguedad;

    public Director(int antiguedad, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{" + super.toString() + "antiguedad=" + antiguedad + '}';
    }
    
    
    
}
