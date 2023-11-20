/*
5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio5_Practica2 {
    
     public static void main(String[] args){
        
         // vector con partidos como elementos, hay que manejar dimension logica hasta "ZZZ" o 20 (vector completo)
         
         Partido [] vector = new Partido[20];
         
         String local = " ";
         String visitante = " ";
         int golesLocal;
         int golesVisitante;
         int dimL = 0;
         
         while((dimL < 20)&&(!visitante.equals("ZZZ"))){
             visitante = Lector.leerString();
             if(!visitante.equals("ZZZ")){
                 local = Lector.leerString();
                 golesLocal = Lector.leerInt();
                 golesVisitante = Lector.leerInt();
                 vector[dimL] = new Partido(local, visitante, golesLocal, golesVisitante);
                 dimL++;
             } // fin if
        } // fin while 
         
         int cantidadPartidosGanadosRiver = 0;
         int cantidadGolesBocaLocal = 0;
         for(int i=0; i<dimL; i++){
             // Manera facil
             String ganador = vector[i].getGanador();
             if(ganador.equals("River")){
                 cantidadPartidosGanadosRiver ++;
             }
             //Inciso C)
             if(vector[i].getLocal().equals("Boca")){
                 cantidadGolesBocaLocal += vector[i].getGolesLocal();
             }
             // Fin inciso C)
             System.out.println(vector[i].getLocal() + " " + vector[i].getGolesLocal() + " VS " + vector[i].getGolesVisitante() + " " + vector[i].getVisitante());
         } // fin for
         
         System.out.println("La cantidad partidos ganados de River como local y visitante es de " + cantidadPartidosGanadosRiver);
         System.out.println("La cantidad de goles que marco Boca como local es de " + cantidadGolesBocaLocal);
    }
}
