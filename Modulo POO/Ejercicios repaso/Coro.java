/*

 */
package ejercicio4repaso;


public abstract class Coro {
    private String nombre;
    private Director director;
    private Corista corista;

    public Coro(String unNombre, Director unDirector, Corista unCorista) {
        this.nombre = unNombre;
        this.director = unDirector;
        this.corista = unCorista;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    @Override
    public String toString() {
        return "Coro{" + "nombre=" + nombre + director.toString() + '}'; // aca no pongo coristas porq  tengo q hacer un for en cada coro
    }
    
    
    
}
