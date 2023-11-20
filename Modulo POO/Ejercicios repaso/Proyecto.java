/*
Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo).
 */
package ejercicio1repaso;


public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private int dimF;
    private int dimL;
    private Investigador [] investigadores;
    
    public Proyecto(String unNombre, int unCodigo, String unNombreDirector){
        nombre = unNombre;
        codigo = unCodigo;
        nombreDirector = unNombreDirector;
        dimF = 50;
        dimL = 0;
        investigadores = new Investigador[dimF];
    }
    
    // Hago get y set de dimL para poder "traer" la dimL para algo, y tambien un set para poder modificarla.
    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Investigador getInvestigadores(int pos) {
        return investigadores[pos];
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    // Agregar investigador
    public void AgregarInvestigador(Investigador unInvestigador){
        if(dimL < dimF){
            investigadores[dimL] = unInvestigador;
            dimL ++;
        }
        else{
            System.out.println("Maximos investigadores alcanzados.");
        }
            
    }
    
   
    // recorro 1 investigador, de ese investigador recorro los subsidios y voy haciendo get.monto y sumandolo. Asi con todos los investigadores (for)
    
    
    // buscar investigador (recibe variable nombre, a buscar) y "otorgar todos los subsidios no otorgados" -> osea cargar el vector subsidios ?
}
