package tema4;


public class Trabajador extends Persona{
    private String tarea;
    
    public Trabajador(String unaTarea, String unNombre, int unDNI, int unaEdad){
        super(unNombre, unDNI, unaEdad);
        tarea = unaTarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    @Override
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + super.getNombre() + ", mi DNI es " + super.getDNI() + " y tengo " + super.getEdad() + " años." + "Soy " + tarea;
        return aux;
    }
}
