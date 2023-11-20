/*
De cada investigador se tiene: nombre completo, categoría (1 a 5) y especialidad.
Además, cualquier investigador puede pedir hasta un máximo de 5 subsidios.
 */
package ejercicio1repaso;


public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private int dimF2;
    static int dimL2;
    private Subsidio [] subsidios;
    
    public Investigador(String unNombreCompleto, int unaCategoria, String unaEspecialidad){
        nombreCompleto = unNombreCompleto;
        categoria = unaCategoria;
        especialidad = unaEspecialidad;
        dimF2 = 5;
        dimL2 = 0;
        subsidios = new Subsidio[dimF2]; 
        for(int i= 0; i< dimF2; i++) // INICIALIZAR ESTO ES IMPORTANTISIMO PORQUE SI NO NO ANDA LA PORQUERIA
            subsidios[i] = new Subsidio(0, " "); // aca hace de cuenta que lo inicializas en cero
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    // Agrego un subsidio
    public void AgregarSubsidio(int pos, double unMonto, String unMotivo){
        if((dimL2 < dimF2) && (subsidios[dimL2].getEstado().equals("No otorgado"))){
            subsidios[dimL2].setMontoPedido(unMonto);
            subsidios[dimL2].setMotivo(unMotivo);
            dimL2 ++;
        }
    }
}
