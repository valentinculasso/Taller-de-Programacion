/*
2- Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular, para el estacionamiento:
- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
por piso. El estacionamiento inicialmente no tiene autos.
- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
estacionamiento con los datos recibidos y sin autos.
 */
package ejercicio2repasoo;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
//    private int dimL [];
    private Auto [][] autos;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
//        this.dimL = new int[5]; // Si manejas dimL, vos tendrias que ingresar susecivamente, el cual esta mal porque tenes que ingresar en la pos X e Y.
        this.autos = new Auto [5][10];
        for(int i=0; i<5; i++){ // Como yo tengo que cargar los autos en numeros random, inicializo todo en null. Porque si no me especifica el ejercicio
            for(int j=0; j<10; j++) // si tengo que usar dimL (que para cada piso se ingresan sucesivamente) y me dice que se cargan autos en posiciones
                autos[i][j] = null; // random, la verdad no me queda otra que hacer esto.
        }
    }
    
    public void registrarAuto(Auto unAuto, int X, int Y){ // X e Y validos y el lugar esta desocupado.
        autos[X][Y] = unAuto;
    }
    
    public String buscarPatente(String patente){
        String aux = "Auto inexistente";
        boolean encontre = false;
        int i = 0, j = 0;
        while((i<5)&&(!encontre)){
            j = 0;
            while((j<10)&&(!encontre)){
                if(autos[i][j] != null){ // pregunto esto, porque no puedo comparar si en la matriz una posicion es null
                    if(autos[i][j].getPatente().equals(patente)){
                        aux = "El auto se encuentra en el piso " + i + " en la plaza " + j;
                        encontre = true;
                    }
                }
                j++;
            }
            i++;
        }
        return aux;
    }
    
    public int CantAutos(int Y){
        int cant = 0;
        for(int i = 0; i<5; i++)
            if(autos[i][Y] != null)
                cant++;
        return cant;
    }
    
    private String estadoPlaza(int unPiso, int unaPlaza){
        String aux;
        
        aux = " ---Plaza libre--- ";
        if (autos[unPiso][unaPlaza] != null){
            aux = autos[unPiso][unaPlaza].toString();
        }
        
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = " ";
        for(int i=0; i<5; i++)
            for(int j=0; j<10; j++)
                aux += "Estacionamiento{ Piso " + i + " Plaza " + j + " " + estadoPlaza(i, j) + '}' + " \n";
        return aux;
    }
    
    
    
}
