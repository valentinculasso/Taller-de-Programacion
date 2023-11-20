/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int[5][5];
        int i, j;
        for (i = 0; i<5; i++)
            for(j = 0; j<5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i = 0; i<5 ; i++)
            for ( j = 0; j<5; j++)
                System.out.println("matriz [" + i + "]" + "[" + j + "]" + " = "+ matriz[i][j]);
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sumaFila1 = 0;
        for (j=0; j<5; j++)
            sumaFila1 += matriz[1][j];
        System.out.println("La suma de los elementos de la fila 1 es: " + sumaFila1);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vectorC = new int[5];
        int sumaColumnaJ = 0;
        for(j = 0; j<5; j++){
            for(i = 0; i<5; i++){
                sumaColumnaJ += matriz[i][j];
            }
            vectorC[j] = sumaColumnaJ;
        }
        for(i = 0; i<5; i++)
            System.out.println(vectorC[i]);
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int valor = Lector.leerInt();
        boolean encontre = false;
        int posi = 0, posj = 0;
        for(i = 0; i<5; i++){
            for(j = 0; j<5; j++){
                if(matriz[i][j] == valor){
                    encontre = true;
                    posi = i;
                    posj = j;
                }
            }
        }
        if(encontre == true)
            System.out.println("El valor ingresado se encuentra en la posicion [" + posi + "] [" + posj + "] de la matriz");
        else
            System.out.println("No se encontro el elemento");
    }
}
