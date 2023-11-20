{El hipermercado Carrefour necesita un sistema para obtener estadisticas sobre las compras realizadas por sus clientes.
* a) Implementar un modulo que lea informacion de todas las compras de 2023, los almacene y retorne una estructura de datos
* eficiente para la busqueda por CODIGO DE CLIENTE, donde para cada codigo de cliente se almacenen JUNTAS todas sus compras.
* De cada compra se conoce: codigo de cliente, numero de factura, cantidad de productos y monto. La lectura finaliza con el codigo de cliente 0.
* b) Implementar un modulo que reciba la estructura generada en a), un codigo de cliente y retorne la cantidad de compras y el monto total gastado por dicho cliente durante el 2023.
* c) Realizar un modulo que reciba la estructura generada en a) y dos numeros de factura X e Y, y retorne todas las ventas cuyo numero de factura esten entre X e Y (incluidos)
}


program ParcialTURNOA;

type
	compra = record
		codigo_cliente: integer;
		numero_factura: integer;
		cantidad_productos: integer;
		monto: real;
	end;
	
	compras = record
		nro_factura: integer;
		cant_productos: integer;
		montoL: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: compras;
		sig: lista;
	end;
	
	registro = record
		codigo: integer;
		lis: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: registro;
		HI: arbol;
		HD: arbol;
	end;


procedure ModuloA(var a: arbol);
{* a) Implementar un modulo que lea informacion de todas las compras de 2023, los almacene y retorne una estructura de datos
* eficiente para la busqueda por CODIGO DE CLIENTE, donde para cada codigo de cliente se almacenen JUNTAS todas sus compras.
* De cada compra se conoce: codigo de cliente, numero de factura, cantidad de productos y monto. La lectura finaliza con el codigo de cliente 0.}
	
	procedure LeerCompra(var p: compra);
	begin
		readln(p.codigo_cliente);
		if(p.codigo_cliente <> 0)then begin
			readln(p.numero_factura);
			readln(p.cantidad_productos);
			readln(p.monto);
		end;
	end;
	
	procedure ArmarRegistro(var p2: compras; p: compra);
	begin
		p2.nro_factura:= p.numero_factura;
		p2.cant_productos:= p.cantidad_productos;
		p2.montoL:= p.monto;
	end;
	
	procedure AgregarAdelante(var L: lista; p: compras);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure AgregarArbol(var a: arbol; p: compra);
	var
		p2: compras;
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.codigo:= p.codigo_cliente;
			a^.dato.lis:= nil;
			ArmarRegistro(p2, p);
			AgregarAdelante(a^.dato.lis, p2);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(a^.dato.codigo = p.codigo_cliente)then begin
				ArmarRegistro(p2, p);
				AgregarAdelante(a^.dato.lis, p2);
			 end
			 else if(p.codigo_cliente < a^.dato.codigo)then
					AgregarArbol(a^.HI, p)
				  else
					AgregarArbol(a^.HD, p);
	end;

var
	p: compra;
begin
	LeerCompra(p);
	while(p.codigo_cliente <> 0)do begin
		AgregarArbol(a, p);
		LeerCompra(p);
	end;
end;

procedure ModuloB(a: arbol; codigo: integer; var cant_compras: integer; var monto_total: real);
{b) Implementar un modulo que reciba la estructura generada en a), un codigo de cliente y retorne la cantidad de compras y el monto total gastado por dicho cliente durante el 2023.}
		
		function buscarCodigo(a: arbol; codigo: integer): arbol;
		begin
			if(a = nil)then
				buscarCodigo:= nil
			else if(a^.dato.codigo = codigo)then
					buscarCodigo:= a
			else if(codigo < a^.dato.codigo)then
					buscarCodigo(a^.HI, codigo)
				 else
					buscarCodigo(a^.HD, codigo);
		end;
		
		procedure calcular(L: lista; var cant_compras: integer; var monto_total: real);
		begin
			if(L <> nil)then begin
				cant_compras:= cant_compras + 1;
				monto_total:= monto_total + L^.dato.montoL;
				calcular(L^.sig, cant_compras, monto_total);
			end;
		end; 
		
var
	bus: arbol;
begin
	if(a <> nil)then begin
		bus:= buscarCodigo(a, codigo);
		calcular(bus^.dato.lis, cant_compras, monto_total);
	end;
end;

procedure ModuloC(a: arbol; X: integer; Y: integer; var L: lista);
{c) Realizar un modulo que reciba la estructura generada en a) y dos numeros de factura X e Y
* y retorne todas las ventas cuyo numero de factura esten entre X e Y (incluidos)}
	
	procedure AgregarListaNueva(var L: lista; p: compras);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure RetornarVentas(L: lista; x: integer; y: integer; var L2: lista);
	begin
		if(L <> nil)then begin
			if(L^.dato.nro_factura >= x)then begin
				if(L^.dato.nro_factura <= y)then
					AgregarListaNueva(L2, L^.dato);
					RetornarVentas(L^.sig, x, y, L2);
			end
			else
				RetornarVentas(L^.sig, x, y, L2);
		end;
	end;

begin
	if(a <> nil)then begin
		RetornarVentas(a^.dato.lis, X, Y, L);
		ModuloC(a^.HI, X, Y, L);
		ModuloC(a^.HD, X, Y, L);
	end;
end; 

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	cod, cant_compras, X, Y: integer;
	monto_total: real;
	L: lista;
BEGIN
	ModuloA(a);
	// b)
	cant_compras:= 0;
	monto_total:= 0;
	writeln('Ingrese un codigo a buscar: ');
	readln(cod);
	ModuloB(a, cod, cant_compras, monto_total);
	writeln('Imprimir resultados'); // dejo el espacio para imprimir cant compras y monto total
	// c)
	L:= nil;
	writeln('Ingrese un numero de factura: ');
	readln(X);
	writeln('Ingrese un numero de factura: ');
	readln(Y);
	ModuloC(a, X, Y, L);
END.

