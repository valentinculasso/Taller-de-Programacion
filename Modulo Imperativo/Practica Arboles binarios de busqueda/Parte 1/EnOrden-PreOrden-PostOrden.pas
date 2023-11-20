{2. Escribir un programa que:

a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.

Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}


program Ejercicio2;

type

	arbol = ^nodoArbol;
	nodoArbol = record
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;
	
	

procedure InsertarElemento(var a: arbol; elem: integer);
{i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.}
begin
	if (a = nil) // primer elemento
	then begin
		new(a);
		a^.dato:= elem; 
		a^.HI:= nil; 
		a^.HD:= nil;
    end
	else if (elem <= a^.dato) then begin // si es menor voy a la rama izquierda
			InsertarElemento(a^.HI, elem);
		 end
		 else InsertarElemento(a^.HD, elem); // si es mayor voy a la rama derecha
	end;


procedure GenerarArbol(var a: arbol);
var
	num: integer;
begin
	a:= nil;
	writeln('Ingrese un numero: ');
	readln(num);
	while(num <> 0)do begin
		InsertarElemento(a, num);
		writeln('Ingrese un numero: ');
		readln(num);
	end;	
end;

procedure ImprimirEnOrden(a: arbol);
begin
	if(a <> nil)then begin
		ImprimirEnOrden(a^.HI);
		write(a^.dato);
		ImprimirEnOrden(a^.HD);
	end;
end;

procedure ImprimirPreOrden(a: arbol);
begin
	if(a <> nil)then begin
		write(a^.dato);
		ImprimirPreOrden(a^.HI);
		ImprimirPreOrden(a^.HD);
	end;
end;

procedure ImprimirPostOrden(a: arbol);
begin
	if(a <> nil)then begin
		ImprimirPostOrden(a^.HI);
		ImprimirPostOrden(a^.HD);
		write(a^.dato);
	end;
end;

var
	a: arbol;
begin
	GenerarArbol(a);
	writeln('En orden');
	writeln('');
	ImprimirEnOrden(a);
	writeln('');
	writeln('PreOrden');
	writeln('');
	ImprimirPreOrden(a); // Dudas en este ya que si ingreso numeros aleatorios me imprime mal
	writeln('');
	writeln('PostOrden');
	writeln('');
	ImprimirPostOrden(a); // Dudas en este ya que si ingreso numeros aleatorios me imprime mal
end.
