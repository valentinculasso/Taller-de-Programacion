/*

 */
package ejercicio4repaso;


public class CoroPorHileras extends Coro{
    private Corista [][] coristaHileras;
    private int dimFilas;
    private int dimColum;
    private int dimLF;
    private int dimLC;

    public CoroPorHileras(Corista[][] coristaHileras, int dimFilas, int dimColum, String unNombre, Director unDirector, Corista unCorista) {
        super(unNombre, unDirector, unCorista);
        this.dimFilas = dimFilas;
        this.dimColum = dimColum;
        dimLF = 0;
        dimLC = 0;
        this.coristaHileras = new Corista [dimFilas][dimColum];
    }
    
    public void agregarCorista(Corista unCorista){
        if((dimLF < dimFilas)&&(dimLC < dimColum)){ // podria sacar la condicion de columnas, pq en si nunca la tomaria por el codigo q esta abajo
            coristaHileras[dimLF][dimLC] = unCorista;
            dimLC++;
            if(dimLC == dimColum){
                dimLC = 0; // Si llegue al maximo de columnas la reinicio a 0 y paso a la siguiente fila
                dimLF++; 
                if(dimLF == dimFilas){ // chequeo si llegue al maximo de filas
                    dimLC = dimColum; // me paro al final de la columna, y la fila quedaria en la ultima tambien
                }
            }
        }
    }
    
    public boolean DeterminarSiEstaLLeno(){
        boolean aux = false;
        if((dimLF == dimFilas)&&(dimLC == dimColum))
                aux = true;
        return aux;
    }
    
    public boolean DeterminarSiEstanOrdenados(){       // mas o menos es algo asi
        boolean aux = true;
//        int tonoactual;
        int tonoSiguiente;
        for(int i=0; i<dimLF; i++){
            for(int j=0; j<dimLC; j++){ //
                int tonoacutal = coristaHileras[i][j].getTonoFundamental(); // no se porque si no declaro la variable aca me marca error
                tonoSiguiente = coristaHileras[i + 1][j + 1].getTonoFundamental();
                if(tonoacutal != tonoSiguiente) {
                    aux = false;
                    i = dimLF;         
                    j= dimLC; 
                }
            }
        }
        return aux;
    }

}

