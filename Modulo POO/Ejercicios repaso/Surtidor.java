

package ejercicio2repaso;


public class Surtidor {
    private boolean estado;
    private int dimF;
    private int dimL;
    private Venta [] infoVentas;

    public Surtidor(int V) {
        this.estado = true;
        this.dimF = V;
        this.dimL = 0;
        this.infoVentas = new Venta[dimF];
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    public void AgregarVenta(Venta unaVenta){
        infoVentas[dimL] = unaVenta;
        dimL ++;
    }
    
    public double CalcularM3(){
        double m3 = 0;
        for(int i=0; i<dimL; i++)
            m3 += infoVentas[i].getM3();
        return m3;
    }
    
    public Venta CalcularVentas(){
        double max = 0;
        Venta maxVenta = null;
        for(int i=0; i<dimL; i++)
            if(infoVentas[i].getMonto() > max){
                maxVenta = infoVentas[i];
                max = infoVentas[i].getMonto();
            }
        return maxVenta;
    }

                
    
    
    @Override
    public String toString() {
        String aux = "Estado=" + estado + " ; Ventas: " + "\n";
        for(int i=0; i<dimL ;i++)
            aux += "Venta numero " + i+1 +  infoVentas[i].toString() + "\n";
        
        return aux;
    }
    
    
    
}
