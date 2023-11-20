{Aerolineas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el codigo de vuelo, 
* codigo de cliente, codigo ciudad destino y monto del pasaje.
* a) Implementar un modulo que lea pasajes, genere y retorne una estructura adecuada para la busqueda por codigo
* de ciudad destino, donde para cada codigo de ciudad destino se almacenan juntos todos los pasajes (codigo de vuelo,
* codigo de cliente y monto de pasaje). La lectura finaliza con el monto de pasaje 0.
* b) Implementar un modulo que reciba la estructura generada en a) y un codigo de ciudad destino y retorne todos los pasajes
* hacia esa ciudad destino.
* c) Realizar un modulo que reciba la estructura generada en a) y retorne el codigo de ciudad de destino con mayor cantidad
* de pasajes vendidos.
}


program EjercicioParcial;

type
	pasaje = record
		codigo_vuelo: integer;
		codigo_cliente: integer;
		codigo_ciudad: integer;
		monto_pasaje: real;
	end;
	
	pasajes = record
		cod_vuelo: integer;
		cod_cliente: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pasajes;
		sig: lista;
	end;
	
	registroArbol = record
		cod_ciudad: integer;
		lis: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: registroArbol;
		HI: arbol;
		HD: arbol;
	end;
	
procedure ModuloA(var a: arbol);
{a) Implementar un modulo que lea pasajes, genere y retorne una estructura adecuada para la busqueda por codigo
* de ciudad destino, donde para cada codigo de ciudad destino se almacenan juntos todos los pasajes (codigo de vuelo,
* codigo de cliente y monto de pasaje). La lectura finaliza con el monto de pasaje 0.}
	
	procedure LeerPasaje(var p: pasaje);
	begin
		writeln('Ingrese el monto del pasaje: ');
		readln(p.monto_pasaje);
		if(p.monto_pasaje <> 0)then begin
			writeln('Ingrese el codigo de vuelo: ');
			readln(p.codigo_vuelo);
			writeln('Ingrese el codigo de cliente: ');
			readln(p.codigo_cliente);
			writeln('Ingrese el codigo de ciudad: ');
			readln(p.codigo_ciudad);
		end;
	end;
	
	procedure ArmarRegistro(p: pasaje; var p2: pasajes);
	begin
		p2.cod_vuelo:= p.codigo_vuelo;
		p2.cod_cliente:= p.codigo_cliente;
		p2.monto:= p.monto_pasaje;
	end;
	
	procedure AgregarAdelante(var L: lista; p: pasajes);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure GenerarArbol(var a: arbol; p: pasaje);
	var
		p2: pasajes;
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.cod_ciudad:= p.codigo_ciudad;
			a^.dato.lis:= nil;
			ArmarRegistro(p, p2);
			AgregarAdelante(a^.dato.lis, p2);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(p.codigo_ciudad = a^.dato.cod_ciudad)then begin
				ArmarRegistro(p, p2);
				AgregarAdelante(a^.dato.lis, p2);
		end
		else if(p.codigo_ciudad < a^.dato.cod_ciudad)then
				GenerarArbol(a^.HI, p)
			 else
				GenerarArbol(a^.HD, p);
	end;
	
var
	p: pasaje;
begin
	LeerPasaje(p);
	while(p.monto_pasaje <> 0)do begin
		GenerarArbol(a, p);
		LeerPasaje(p);
	end;
end;	

procedure ModuloB(a: arbol; cod: integer; var L: lista);
{b) Implementar un modulo que reciba la estructura generada en a) y un codigo de ciudad destino y retorne todos los pasajes
* hacia esa ciudad destino.}
	
	function buscarCodigo(a: arbol; cod:integer): arbol;
	begin
		if(a = nil)then
			buscarCodigo:= nil
		else if(a^.dato.cod_ciudad = cod)then
				buscarCodigo:= a
			 else if(cod < a^.dato.cod_ciudad)then
					buscarCodigo(a^.HI, cod)
				  else
					buscarCodigo(a^.HD, cod);
	end;
var
	bus: arbol;

begin
	if(a <> nil)then begin
		bus:= buscarCodigo(a, cod);
		L:= bus^.dato.lis;
	end;
end;

procedure ModuloC(a: arbol; var codigo: integer);
{c) Realizar un modulo que reciba la estructura generada en a) y retorne el codigo de ciudad de destino con mayor cantidad
* de pasajes vendidos.}

// recorro 1 nodo del arbol -> cuento cuantos pasajes vendidos tiene -> calculo maximo -> si es maximo actualizo codigo de ciudad
	
	function CalcularCantidad(L: lista): integer;
	begin
		if(L <> nil)then begin
			CalcularCantidad:= 1 + CalcularCantidad(L^.sig);
		end
		else
			CalcularCantidad:= 0;
	end;
	
	procedure RecorrerArbol(a: arbol; var cod: integer; var max: integer);
	var
		cantidad: integer;
	begin
		if(a <> nil)then begin
			cantidad:= CalcularCantidad(a^.dato.lis);
			if(cantidad > max)then begin
				max:= cantidad;
				codigo:= a^.dato.cod_ciudad;
			end;
			RecorrerArbol(a^.HI, cod, max);
			RecorrerArbol(a^.HD, cod, max);
		end;
	end;

var
	max: integer;
begin
	max:= 0;
	RecorrerArbol(a, codigo, max);
end;

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	codigo: integer;
	L: lista;
	codigo_ciudad_max: integer;
BEGIN
	ModuloA(a);
	writeln('Ingrese un codigo de ciudad destino: ');
	readln(codigo);
	L:= nil;
	ModuloB(a, codigo, L);
	codigo_ciudad_max:= 0;
	ModuloC(a, codigo_ciudad_max);
	writeln('El codigo de ciudad de destino con mayor cantidad de pasajes vendidos es ', codigo_ciudad_max);
END.

