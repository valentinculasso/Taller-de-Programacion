/*

 */
package ejercicio4repaso;


public class Corista extends Persona{
    private int tonoFundamental;

    public Corista(int tonoFundamental, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.tonoFundamental = tonoFundamental;
    }


    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return "Corista{" + super.toString() + "tonoFundamental=" + tonoFundamental + '}';
    }
    
}
