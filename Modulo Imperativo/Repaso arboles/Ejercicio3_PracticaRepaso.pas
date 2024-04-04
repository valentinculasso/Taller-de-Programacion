3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
   
}


program Ejercicio3Repaso;
const
	dimF = 10;
type
	// Vector de arbol -> arbol busqueda eficiente por codigo -> finaliza con codigo -1
	RangoRubro = 1..dimF;
	producto = record
		codigo: integer;
		rubro: RangoRubro; // Esta variable iria en el arbol? Porque ya que el vector es por rubro, seria medio inutil tener esta variable en cada nodo del arbol
		stock: integer;
		precio: real;
	end;
	
	productoArbol = record
		codigo: integer;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: productoArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array[RangoRubro]of arbol;

procedure generarVectorArboles(var v: vector);

	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to dimF do begin
			v[i]:= nil;
		end;
	end;
	
	procedure LeerProducto(var p: producto);
	begin
		writeln('Ingrese el codigo del producto: ');
		readln(p.codigo);
		if(p.codigo <> -1)then begin
			writeln('Ingrese el rubro del producto: ');
			readln(p.rubro);
			writeln('Ingrese el stock del producto: ');
			readln(p.stock);
			writeln('Ingrese el precio del producto: ');
			readln(p.precio);
		end;
	end;
	
	procedure armarRegistro(p: producto; var p2: productoArbol);
	begin
		p2.codigo:= p.codigo;
		p2.stock:= p.stock;
		p2.precio:= p.precio;
	end;
	
	procedure GenerarArbol(var a: arbol; p: producto);
	var
		p2: productoArbol;
	begin
		if(a = nil)then begin
			new(a);
			armarRegistro(p, p2);
			a^.dato:= p2;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if(p.codigo <= a^.dato.codigo)then
				GenerarArbol(a^.HI, p)
			else
				GenerarArbol(a^.HD, p)
		end;
	end;
	
var
	p: producto;
begin
	InicializarVector(v);
	LeerProducto(p);
	while(p.codigo <> -1)do begin
		GenerarArbol(v[p.rubro], p); //v[p.rubro] -> accedo al arbol de ese rubro
		LeerProducto(p);
	end;
end;

function IncisoB(a: arbol; rubro: integer; codigo: integer): boolean;
{b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.}
begin
	if(a = nil)then
		IncisoB:= false
	else begin
		if(a^.dato.codigo = codigo)then
			IncisoB:= true
		else begin
			if(codigo < a^.dato.codigo)then
				IncisoB:= IncisoB(a^.HI, rubro, codigo)
			else
				IncisoB:= IncisoB(a^.HD, rubro, codigo)
		end
	end;
end;

procedure IncisoC(v: vector);
{c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.}
	
	function retornarNodoMayor(a: arbol): arbol; // Uso procedure ya que debo retornar el codigo y el stock en 2 variables
	begin
		if(a = nil)then
			retornarNodoMayor:= nil
		else
			if(a^.HD = nil)then
				retornarNodoMayor:= a
			else
				retornarNodoMayor:= retornarNodoMayor(a^.HD);
	end;

var
	i: integer;
	a: arbol;
begin
	for i:= 1 to dimF do begin
		a:= retornarNodoMayor(v[i]);
		if(a <> nil)then
			writeln('El codigo mas grande es ', a^.dato.codigo,' y tiene un stock de ', a^.dato.stock,' unidades')
		else
			writeln('Arbol vacio');
	end;
end;

procedure IncisoD(v: vector; cod1: integer; cod2: integer);
{d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}
	
	procedure retornarCantidad(a: arbol; cod1: integer; cod2: integer; var cant: integer);
	begin
		if(a <> nil)then begin
			if(a^.dato.codigo > cod1)then
				if(a^.dato.codigo < cod2)then begin// Si entra a este if quiere decir que el nodo esta entre los dos codigos ingresados (cod1 y cod2)
					cant:= cant + 1;
					retornarCantidad(a^.HI, cod1, cod2, cant); // Debo "revisar" por izquierda y por derecha para abarcar todos los codigos posibles entre los valores ingresados (cod1 y cod2)
					retornarCantidad(a^.HD, cod1, cod2, cant);
				end
				else
					retornarCantidad(a^.HI, cod1, cod2, cant) // Si viene aca es porque el codigo actual es mayor que cod2 (limite superior)
			else
				retornarCantidad(a^.HD, cod1, cod2, cant); // si viene aca es porque el codigo actual es menor que cod1 (limite inferior)
		end;
	end;
	
var
	i, cantidad: integer;
begin
	for i:= 1 to dimF do begin
		cantidad:= 0;
		retornarCantidad(v[i], cod1, cod2, cantidad);
		writeln('La cantidad de productos con codigos entre ', cod1,' y ', cod2,' es de ', cantidad,' productos');
	end;
end;

var
	v: vector;
	rubro: RangoRubro;
	codigo, cod1, cod2: integer;
	a: arbol;

BEGIN
	generarVectorArboles(v);
	writeln('Ingrese el rubro del producto: ');
	readln(rubro);
	writeln('Ingrese el codigo del producto: ');
	readln(codigo);
	// Seria correcto chequear el rubro que sea entre 1 y 10 o no hace falta?
	a:= v[rubro]; // ---> le asigno el arbol del rubro ingresado, entonces la funcion seria mucho mas simple de realizar
	if(IncisoB(a, rubro, codigo))then
		writeln('El codigo para el rubro ingresado existe')
	else
		writeln('El codigo para el rubro ingresado no existe');
	// -------------
	IncisoC(v);
	// -------------
	writeln('Ingrese un codigo (limite inferior): ');
	readln(cod1);
	writeln('Ingrese un codigo mayor (limite superior): ');
	readln(cod2);
	IncisoD(v, cod1, cod2);
END.

