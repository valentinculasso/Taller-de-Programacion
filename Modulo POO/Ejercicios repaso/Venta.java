
package ejercicio2repaso;


public class Venta {
    private int DNI;
    private double m3;
    private double monto;
    private String metodoPago;

    public Venta(int unDNI, double metros3, double unMonto, String unMetodoPago) {
        this.DNI = unDNI;
        this.m3 = metros3;
        this.monto = unMonto;
        this.metodoPago = unMetodoPago;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public double getM3() {
        return m3;
    }

    public void setM3(double m3) {
        this.m3 = m3;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    @Override
    public String toString() {
        return "DNI=" + DNI + ", m3=" + m3 + ", monto=" + monto + ", metodoPago=" + metodoPago;
    }
    
    
    
}
