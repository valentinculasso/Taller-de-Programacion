/*

 */
package ejercicio4repaso;


public class CoroSemicircular extends Coro {
    private Corista [] corista;
    private int dimC;
    private int dimLC;
    
    public CoroSemicircular(String unNombre, Director unDirector, Corista unCorista, int unDimC){ // dimC es la dimension fisica del vector coristas
        super(unNombre, unDirector, unCorista);
        dimC = unDimC;
        dimLC = 0;
        corista = new Corista[dimC];
    }
    
    public void agregarCorista(Corista unCorista){
        if(dimLC <= dimC){
            corista[dimLC] = unCorista;
            dimLC ++;
        }
    }
    
    public boolean DeterminarSiEstaLLeno(){
        boolean aux = false;
        if(dimLC == dimC)
            aux = true;
        return aux;
    }
    
    public boolean DeterminarSiEstanOrdenados(){
        boolean aux = true;
        int tonoActual;
        int tonoSiguiente;
        for(int i=0; i<dimLC; i++){
            tonoActual = corista[i].getTonoFundamental();
            tonoSiguiente = corista[i+1].getTonoFundamental();
            if(tonoSiguiente < tonoActual){
                System.out.println("Los coristas no estan ordenados correctamente");
                aux = false;
                i = dimLC; // hago esto para que no recorra todo el vector.
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux =  "CoroSemicircular{" + super.toString();
        for(int i=0; i<dimLC; i++)
            aux += corista[i].toString() + "\n"; // Voy sumando al string 
        return aux;
    }
    
    
    
}
