/*
 Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
 Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
 */
package tema4;


public class Entrenador extends Empleado{
    private int cantidadCampeonatos;
    
    public Entrenador(int cantCampeonatos, String unNombre, double unSueldo, int antiguedad){
        super(unNombre, unSueldo, antiguedad);
        cantidadCampeonatos = cantCampeonatos;
    }

    public int getCantidadCampeonatos() {
        return cantidadCampeonatos;
    }

    public void setCantidadCampeonatos(int cantidadCampeonatos) {
        this.cantidadCampeonatos = cantidadCampeonatos;
    }
    
    @Override
    public double calcularEfectividad(){
        double aux = (double) cantidadCampeonatos/ super.getAntiguedad();
        return aux;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double salarioIncrementado = IncrementarSalario();
        if(cantidadCampeonatos >= 1 && cantidadCampeonatos <= 4)
            salarioIncrementado += 5000;
        if(cantidadCampeonatos >= 5 && cantidadCampeonatos <= 10)
            salarioIncrementado += 30000;
//        super.setSueldo(salarioIncrementado);
        return salarioIncrementado;
    }
    
    @Override
    public String toString(){
        // Se supone que como tengo que informar el sueldo a cobrar, se supone que en el programa principal ya debo haberle hecho set y modificado la variable.
        String aux = "Nombre del entrenador: " + super.getNombre() + " - Sueldo a cobrar: " + super.getSueldo() + " - Efectividad: " + calcularEfectividad();
        return aux;
    }
}
