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
la cantidad total de unidades vendidas de ese producto.
}


program Ejercicio2;

type
	dias = 1..31;
	meses = 1..12;
{	fechaH = record
		dia: dias;
		mes: meses;
		anio: integer;
	end;}
	venta = record
		codigo: integer;
		fecha: string;  {fecha: fechaH;}
		cantidad_vendida: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;

procedure LeerVenta(var v: venta);
begin
	writeln('Ingrese el codigo del producto: ');
	readln(v.codigo);
	writeln('Ingrese el dia de la venta: ');
	writeln('Ingrese la fecha: ');
	readln(v.fecha);
{		readln(v.fecha.dia);
		writeln('Ingrese el mes de la venta: ');
		readln(v.fecha.mes);
		writeln('Ingrese el año de la venta: ');
		readln(v.fecha.anio);}
	writeln('Ingrese la cantidad de unidades vendidas: ');
	readln(v.cantidad_vendida);
end;

procedure InsertarElemento(var a: arbol; elem: venta);
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
	else if (elem.codigo <= a^.dato.codigo) then begin // si es menor voy a la rama izquierda
			InsertarElemento(a^.HI, elem);
		 end
		 else InsertarElemento(a^.HD, elem); // si es mayor voy a la rama derecha
	end;

procedure InsertarElementoArbol2(var a2:arbol; elem2: venta);
{ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.}
begin
	if (a2 = nil) // primer elemento
	then begin
		new(a2);
		a2^.dato:= elem2; 
		a2^.HI:= nil; 
		a2^.HD:= nil;
    end
    else if (elem2.codigo = a2^.dato.codigo)then begin
		a2^.dato.cantidad_vendida := a2^.dato.cantidad_vendida + elem2.cantidad_vendida; // sumo las cantidades ya que las tengo que guardar en un arbol nuevo
    end
    else if (elem2.codigo < a2^.dato.codigo)then begin
			InsertarElementoArbol2(a2^.HI, elem2);
		 end
		 else
			InsertarElementoArbol2(a2^.HD, elem2);
end;

procedure GenerarArbol(var a: arbol; var a2: arbol);
var
	v: venta;
begin
	a:= nil;
	a2:= nil;
	LeerVenta(v);
	while(v.codigo <> 0)do begin
		InsertarElemento(a, v);
		InsertarElementoArbol2(a2, v);
		LeerVenta(v);
	end;	
end;
 

procedure RetornarCantVendida(a: arbol; codigo: integer; var cant: integer); 
{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
begin
	if(a <> nil)then begin
		RetornarCantVendida(a^.HI, codigo, cant);
		if(a^.dato.codigo = codigo)then begin
			cant:= a^.dato.cantidad_vendida;
		end;
		RetornarCantVendida(a^.HD, codigo, cant);
	end;
end;

var
	a, a2: arbol;
	cod, cant_total: integer;
BEGIN
	GenerarArbol(a, a2); // Inciso A
	writeln('Ingrese un codigo de producto: ');
	writeln('Ingrese el codigo a buscar en el arbol 1: ');
	readln(cod);
	RetornarCantVendida(a, cod, cant_total); // Inciso B
    writeln;
    writeln('El producto ',cod,' tiene un total de ',cant_total,' unidades vendidas');
    writeln('Ingrese el codigo a buscar en el arbol 2: '); // Inciso C
	readln(cod);
	RetornarCantVendida(a2, cod, cant_total);
    writeln;
    writeln('El producto ',cod,' tiene un total de ',cant_total,' unidades vendidas');
END.

