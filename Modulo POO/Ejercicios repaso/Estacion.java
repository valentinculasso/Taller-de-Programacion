
package ejercicio2repaso;

public class Estacion {
    private String direccion;
    private double preciom3;
    private Surtidor [] surtidores;

    public Estacion(String direccion, double preciom3, int V) {
        this.direccion = direccion;
        this.preciom3 = preciom3;
        this.surtidores = new Surtidor[2]; // Aca solo cree un vector para 6 objetos de tipo surtidor
        for(int i=0; i<2; i++)
            surtidores[i] = new Surtidor(V); // Creo cada surtidor con un maximo de ventas.
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPreciom3() {
        return preciom3;
    }

    public void setPreciom3(double preciom3) {
        this.preciom3 = preciom3;
    }

    public Surtidor[] getSurtidores() {
        return surtidores;
    }

    public void setSurtidores(Surtidor[] surtidores) {
        this.surtidores = surtidores;
    }
    
    
    
    public void AgregarVenta(int N, Venta unaVenta){
        // Como no me lo pide el ejercicio no pregunto el estado del surtidor.
        surtidores[N].AgregarVenta(unaVenta);
    }
    
    public void MarcarFueraServicio(int X){
        double totalm3;
        for(int i=0; i<2; i++){
               totalm3 = surtidores[i].CalcularM3();
               if(totalm3 < X)
                   surtidores[i].setEstado(false);
        }
    }
    
    public Venta CalcularMayorVenta (){
        Venta maximaVenta, maximaVentaSig = null;
        for(int i=0; i<2; i++){
            maximaVenta = surtidores[i].CalcularVentas();
            if(maximaVentaSig == null)
                maximaVentaSig = maximaVenta;
            else{
                if(maximaVentaSig.getMonto() < maximaVenta.getMonto())
                    maximaVentaSig = maximaVenta;
            }
        }
        return maximaVentaSig;
    }
    
    
    @Override
    public String toString() {
        
        String aux = " Estacion de servicio: " + direccion + ", preciom3=" + preciom3 + " \n";
        
        for(int i=0; i<2; i++){
            aux += "Surtidor " + i + surtidores[i].toString();
        }
        
        return aux;
    }
    
    
    
}
