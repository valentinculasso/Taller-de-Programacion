/*
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 
 */
package tema3;

import PaqueteLectura.Lector;

public class Ejercicio1_IncisoB {

    public static void main(String[] args) {
        
        double lado1 = Lector.leerDouble();
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        String relleno = Lector.leerString();
        String linea = Lector.leerString();
        Triangulo triangulo = new Triangulo(lado1, lado2, lado3, relleno, linea);
        
        double perimetro = triangulo.calcularPerimetro();
        double area = triangulo.calcularArea();
        System.out.println("El perimetro del triangulo ingresado es de " + perimetro);
        System.out.println("El area del triangulo ingresado es de " + area);
    }
    
}
