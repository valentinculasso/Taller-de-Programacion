{El correo argentino necesita procesar los envios entregados durante el mes de agosto de 2023. De cada envio se conoce
*el codigo de cliente, dia, codigo postal y peso del paquete.
*a)Implementar un modulo que lea los envios, genere y retorne una estructura adecuada para la busqueda por codigo postal
*donde para cada codigo postal se almacenan junto todos los envios (codigo de cliente, dia y peso del paquete).
* La lectura finaliza con peso de paquete 0.
*b) Implementar un modulo que reciba la estructura generada en a) y un codigo postal, y retorne todos los envios de dicho
* codigo postal.
*c) Realizar un modulo recursivo que reciba la estructura del inciso b) y retorne los dos codigos de cliente correspondientes
* al envio con mayor y menor peso.
}


program Parcial;

type
	RangoDias = 1..31;
	envio = record
		codigo: integer;
		dia: RangoDias;
		cod_postal: integer;
		peso: real;
	end;
	
	envioLista = record
		codigo_cliente: integer;
		diaL: RangoDias;
		peso_paquete: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: envioLista;
		sig: lista;
	end;
	
	envios = record
		codigo_postal: integer;
		lis: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: envios;
		HI: arbol;
		HD: arbol;
	end;


procedure ModuloA(var a: arbol);
{*a)Implementar un modulo que lea los envios, genere y retorne una estructura adecuada para la busqueda por codigo postal
*donde para cada codigo postal se almacenan junto todos los envios (codigo de cliente, dia y peso del paquete).
* La lectura finaliza con peso de paquete 0.}
	procedure LeerEnvio(var p: envio);
	begin
		writeln('Ingrese el peso del envio: ');
		readln(p.peso);
		if(p.peso <> 0)then begin
			writeln('Ingrese el codigo de cliente: ');
			readln(p.codigo);
			writeln('Ingrese el codigo postal: ');
			readln(p.cod_postal);
			writeln('Ingrese el dia del envio: ');
			readln(p.dia);
		end;
	end;
	
	procedure ArmarRegistro(var e: envioLista; p: envio);
	begin
		e.codigo_cliente:= p.codigo;
		e.diaL:= p.dia;
		e.peso_paquete:= p.peso;
	end;
	
	procedure AgregarAdelante(var L: lista; e: envioLista);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= e;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure GenerarArbol(var a: arbol; p: envio);
	var
		e: envioLista;
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.codigo_postal:= p.cod_postal;
			a^.dato.lis:= nil;
			ArmarRegistro(e, p);
			AgregarAdelante(a^.dato.lis, e);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(p.cod_postal = a^.dato.codigo_postal)then begin
				ArmarRegistro(e, p);
				AgregarAdelante(a^.dato.lis, e);
			 end
			 else if(p.cod_postal < a^.dato.codigo_postal)then
					GenerarArbol(a^.HI, p)
				  else
					GenerarArbol(a^.HD, p);
	end;
	
var	
	p: envio;
begin
	LeerEnvio(p);
	while(p.peso <> 0)do begin
		GenerarArbol(a, p);
		LeerEnvio(p);
	end;
end;

procedure ModuloB(a: arbol; codigo_postal: integer; var L: lista);
{*b) Implementar un modulo que reciba la estructura generada en a) y un codigo postal, y retorne todos los envios de dicho
* codigo postal.}
	
	function BuscarCodigoPostal(a: arbol; codigo_postal: integer): arbol;
	begin
		if(a = nil)then
			BuscarCodigoPostal:= nil
		else if(a^.dato.codigo_postal = codigo_postal)then begin
				BuscarCodigoPostal:= a;
			 end
			 else if(codigo_postal < a^.dato.codigo_postal)then
					BuscarCodigoPostal:= BuscarCodigoPostal(a^.HI, codigo_postal)
				  else
					BuscarCodigoPostal:= BuscarCodigoPostal(a^.HD, codigo_postal);
	end;
var
	bus: arbol;
begin
	if(a <> nil)then begin
		bus:= BuscarCodigoPostal(a, codigo_postal);
		L:= bus^.dato.lis;
	end;
end;

procedure ImprimirLista(L: lista);
begin
	if(L <> nil)then begin
		writeln(L^.dato.codigo_cliente);
		writeln(L^.dato.diaL);
		writeln(L^.dato.peso_paquete:2:1);
		ImprimirLista(L^.sig);
	end;
end;


procedure ModuloC(L: lista; var codigoMax: integer; var codigoMin: integer); 
{*c) Realizar un modulo recursivo que reciba la estructura del inciso b) y retorne los dos codigos de cliente correspondientes
* al envio con mayor y menor peso.}
	

	procedure RecorrerLista(L: lista; var codMax: integer; var codMin: integer; var minPeso: real; var maxPeso: real);
	begin
		if(L <> nil)then begin
			if(L^.dato.peso_paquete >= maxPeso)then begin
				maxPeso:= L^.dato.peso_paquete;
				codMax:= L^.dato.codigo_cliente;
			end;
			if(L^.dato.peso_paquete <= minPeso)then begin
				minPeso:= L^.dato.peso_paquete;
				codMin:= L^.dato.codigo_cliente;
			end;
			RecorrerLista(L^.sig, codMax, codMin, maxPeso, minPeso);
		end;
	end;
var
	MayorPeso, MenorPeso: real;
begin
	MayorPeso:= 0;
	MenorPeso:= 9999;
	RecorrerLista(L, codigoMax, codigoMin, MenorPeso, MayorPeso);
end;
{Programa Principal}
var 
	a: arbol;
	codigo_postal, codMax, codMin: integer; // codMax y codMin son codigos de cliente!
	L: lista;
BEGIN
	// A)
	ModuloA(a);
	// B)
	writeln('Ingrese un codigo postal (inciso B): ');
	readln(codigo_postal);
	L:= nil;
	ModuloB(a, codigo_postal, L);
	ImprimirLista(L);
	// C)
	codMax:= 0;
	codMin:= 0;
	ModuloC(L, codMax, codMin);
	writeln('El codigo de cliente que tiene el envio con mayor peso es ',codMax);
	writeln('El codigo de cliente que tiene el envio con menor peso es ',codMin);
END.

