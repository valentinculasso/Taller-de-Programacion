/*
De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.
 */
package ejercicio1repaso;


public class Subsidio {
    private double montoPedido;
    private String motivo, estado;
    
    
    public Subsidio(double unMontoPedido, String unMotivo){
        montoPedido = unMontoPedido;
        motivo = unMotivo;
        estado = "No otorgado";
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
