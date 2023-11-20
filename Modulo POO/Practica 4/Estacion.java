/*
6- El Servicio Meteorológico Nacional necesita un sistema que permita registrar, para una
determinada estación meteorológica, la temperatura promedio mensual de N años
consecutivos a partir de un año A dado. Además, necesita dos versiones del sistema: una
que permita reportar el promedio histórico por años y otra que permita reportar el
promedio histórico por meses. Esto se detalla más adelante.
De la estación, interesa conocer: nombre, y latitud y longitud donde se encuentra.
Implemente las clases, constructores y métodos que considere necesarios para:
a) Crear el sistema de registro/reporte, que funcionará en una determinada estación,
para N años consecutivos a partir de un año A. Inicie cada temperatura en un valor
muy alto.
b) Registrar la temperatura de un mes y año recibidos por parámetro. Nota: El mes
está en rango 1..12 y el año está en rango A..A+N-1.
c) Obtener la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
en rango 1..12 y el año está en rango A..A+N-1. En caso de no haberse registrado
temperatura para ese mes/año se retorna el valor muy alto.
d) Devolver un String que concatena el mes y año en que se registró la mayor
temperatura. Nota: Suponga que ya están registradas las temperaturas de todos
los meses y años.
e) Devolver un String con el nombre de la estación, su latitud y longitud, y los promedios
mensuales o anuales según corresponda:
- La versión del sistema que reporta por años deberá calcular el promedio para
cada año (el promedio del año X se calcula con los datos mensuales de ese año).
Ej: “La Plata (34,921 S - 57,955 O):
- Año 2020: 23,8 ºC;
- Año 2021: 26,1 ºC;
- Año 2022: 25,3 ºC. ”
- La versión del sistema que reporta por meses deberá calcular el promedio para
cada mes (el promedio del mes M se calcula con los datos de todos los años en ese
mes).
Ej: “La Plata (34,921 S - 57,955 O):
- Enero: 28,2 ºC;
- Febrero: 26,8 ºC;
- Marzo: 24.3 ºC
- …..”
Nota: Suponga que ya están registradas las temperaturas de todos los meses
y años. Utilice el carácter \n para concatenar un salto de línea.
f) Realice un programa principal que cree un Sistema con reporte anual para 3 años
consecutivos a partir del 2021, para la estación La Plata (latitud -34.921 y longitud -
57.955). Cargue todas las temperaturas (para todos los meses y años). Informe los
promedios anuales, y el mes y año en que se registró la mayor temperatura.
Luego cree un Sistema con informe mensual para 4 años a partir de 2020, para la
estación Mar del Plata (latitud -38.002 y longitud -57.556). Cargue todas las
temperaturas (para todos los meses y años). Informe los promedios mensuales, y el
mes y año en que se registró la mayor temperatura.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio. 
 */
package tema4;


public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    private double [][] registro; // A serian los años, que se ingresa x teclado, y cada año tiene 12 meses, osea una matriz años-meses
    int i, j, A;
    
    public Estacion(String unNombre, double unaLatitud, double unaLongitud, int A){
        nombre = unNombre;
        latitud = unaLatitud;
        longitud = unaLongitud;
        registro = new double[A][12];
        for(i=0; i< A; i++)
            for(j=0; j<11; j++)
                registro[i][j] = 999.00; // El ejercicio me pide que inicie las temperaturas en un valor muy alto
    }

    public double[][] getRegistro() {
        return registro;
    }

    public void setRegistro(double[][] registro) {
        this.registro = registro;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
    
    
    /* b) Registrar la temperatura de un mes y año recibidos por parámetro. Nota: El mes
        está en rango 1..12 y el año está en rango A..A+N-1. */
    
    public void registrarTemperatura(int mes, int año, double temperatura){
        registro[año][mes] = temperatura;
    }
    
    /* c) Obtener la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
    en rango 1..12 y el año está en rango A..A+N-1. En caso de no haberse registrado
    temperatura para ese mes/año se retorna el valor muy alto. */
    
    public double obtenerTemperatura(int mes, int año){
        return registro[año][mes]; // Solo tengo que retornar, ya que el vector esta inicializado en valores muy altos, por lo que si ingreso un mes y año en el cual no registre
    }                              // una temperatura, me va a retornar un valor muy alto (999).
    
    
    /* d) Devolver un String que concatena el mes y año en que se registró la mayor
    temperatura. Nota: Suponga que ya están registradas las temperaturas de todos
    los meses y años. */
    
    public String mayorTemperatura(){ // A es la cantidad de años que tengo que recorrer (la misma que pase en el constructor)
        double max = 0;
        int añoMax = 0, mesMax = 0;
        for(i= 0; i< A; i++) // recorro toda la matriz
            for(j= 0; j<11; j++){
                if(registro[i][j] > max){
                    max = registro[i][j];
                    añoMax = i;
                    mesMax = j;
                }
            }  
        String aux = "El mes y el año en el cual se registro la mayor temperatura es en el año " + añoMax + " en el mes " + mesMax;
        return aux;
    }
    
    /* e) Devolver un String con el nombre de la estación, su latitud y longitud, y los promedios
    mensuales o anuales según corresponda:
    - La versión del sistema que reporta por años deberá calcular el promedio para
    cada año (el promedio del año X se calcula con los datos mensuales de ese año).
    Ej: “La Plata (34,921 S - 57,955 O):
    - Año 2020: 23,8 ºC;
    - Año 2021: 26,1 ºC;
    - Año 2022: 25,3 ºC. ”
    - La versión del sistema que reporta por meses deberá calcular el promedio para
    cada mes (el promedio del mes M se calcula con los datos de todos los años en ese
    mes).
    Ej: “La Plata (34,921 S - 57,955 O):
    - Enero: 28,2 ºC;
    - Febrero: 26,8 ºC;
    - Marzo: 24.3 ºC
    - …..” */
    
 /*   public String devolverString(){
        double sumaAño = 0, promedioAño;
        double sumaMes = 0, promedioMes;
        String aux;
        System.out.println(nombre + "(latitud: " + latitud + " - longitud: " + longitud);
        for(i=0; i<A; i++){
            for(j=0; j<11; j++){
                sumaAño += registro[i][j];
            }
            promedioAño = sumaAño/A;
            return aux = "Año " + i + ": " + promedioAño;
        }
        System.out.println(nombre + "(latitud: " + latitud + " - longitud: " + longitud);
        for(j= 0; j<11; j++){
            for(i= 0; i< A; i++){
                sumaMes += registro[i][j];
            }
            promedioMes = sumaMes/12;
            return aux = "Mes " + j + ": " + promedioMes;
        }
    }
    */
}
