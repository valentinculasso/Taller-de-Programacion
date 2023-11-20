/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package tema3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String ColorRelleno;
    private String ColorLinea;
    
    public Triangulo (double UnLado1, double UnLado2, double UnLado3, String unColorRelleno, String unColorLinea){
        lado1 = UnLado1;
        lado2 = UnLado2;
        lado3 = UnLado3;
        ColorRelleno = unColorRelleno;
        ColorLinea = unColorLinea;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorRelleno() {
        return ColorRelleno;
    }

    public void setColorRelleno(String ColorRelleno) {
        this.ColorRelleno = ColorRelleno;
    }

    public String getColorLinea() {
        return ColorLinea;
    }

    public void setColorLinea(String ColorLinea) {
        this.ColorLinea = ColorLinea;
    }
    
    // Calcular el perímetro y devolverlo (método calcularPerimetro)
    public double calcularPerimetro(){
        double per = lado1 + lado2 + lado3;
        return per;
    }
    
    // Calcular el área y devolverla (método calcularArea)
    // NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
    //    los lados y s = (a+b+c)/2. La función raíz cuadrada es Math.sqrt(#)
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3)/2;
        double area = Math.sqrt((s*(s - lado1))*(s - lado2)*(s - lado3));
        return area;
    }
}
