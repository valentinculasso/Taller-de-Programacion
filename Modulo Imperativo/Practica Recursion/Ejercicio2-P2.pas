{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6
}


program Ejercicio2;
	
procedure ImprimirDigitos(numero: integer); // Modulo recursivo para imprimir valores
var
	dig: integer;
begin
	dig:= numero MOD 10; // si numero es 156 - tomo el 6, luego "saco" el ultimo digito - la prox vez q entra toma el 5 - y la siguiente el 1
	numero:= numero DIV 10;
	if(numero <> 0)then
		ImprimirDigitos(numero);
	write(' ',dig,' '); // al poner el write ln aca, imprime correctamente, ya que el ultimo digito tomado es el primero que tengo q imprimir.
						  // de esta manera se imprime en orden.
end;


var
	num: integer;

BEGIN
	write('Ingrese un numero: ');
	read(num);
	while(num <> 0)do begin
		
		ImprimirDigitos(num);
		writeln('');
		write('Ingrese un numero: ');
		readln(num);
	end;	
END.

