
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double
        //Paso 3: Crear el vector para 15 double 
        int DF = 15;
        double [] vector = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double suma = 0.0;
        double promedio = 0.0;
        int cant = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < 15; i++){
            double altura = Lector.leerDouble();
            vector[i] = altura;
            suma += vector[i];
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = suma/15;
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for(i = 0; i < 15; i++)
            if(vector[i] > promedio)
                cant += 1;
        
        
        //Paso 9: Informar la cantidad.
        
        System.out.println("La altura promedio de los 15 jugadores de un equipo de basquet es de " + promedio);
        System.out.println("La cantidad de jugadores con altura por encima del promedio es de " + cant);
    }
    
}
