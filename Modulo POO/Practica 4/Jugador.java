/*
2- Queremos representar a los empleados de un club: jugadores y entrenadores.
 Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
 Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
 Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
plus de otro sueldo básico.
 */
package tema4;


public class Jugador extends Empleado{
    private int numeroPartidos;
    private int numeroGoles;
    
    public Jugador (int numPartidos, int numGoles, String unNombre, double unSueldo, int antiguedad){
        super(unNombre, unSueldo, antiguedad);
        numeroPartidos = numPartidos;
        numeroGoles = numGoles;
    }

    public int getNumeroPartidos() {
        return numeroPartidos;
    }

    public void setNumeroPartidos(int numeroPartidos) {
        this.numeroPartidos = numeroPartidos;
    }

    public int getNumeroGoles() {
        return numeroGoles;
    }

    public void setNumeroGoles(int numeroGoles) {
        this.numeroGoles = numeroGoles;
    }
    
    @Override
    public double calcularEfectividad(){
        double aux = (double) numeroGoles/numeroPartidos;
        return aux;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double salario = super.getSueldo();
        double salarioIncrementado = IncrementarSalario();
        double efectividad = calcularEfectividad();
        if(efectividad > 0.5){
            salarioIncrementado += salario;
        }
        return salarioIncrementado;
    }
    
    @Override
    public String toString(){
        // Se supone que como tengo que informar el sueldo a cobrar, se supone que en el programa principal ya debo haberle hecho set y modificado la variable.
        String aux = "Nombre del jugador: " + super.getNombre() + " - Sueldo a cobrar: " + super.getSueldo() + " - Efectividad: " + calcularEfectividad();
        return aux;
    }
}
