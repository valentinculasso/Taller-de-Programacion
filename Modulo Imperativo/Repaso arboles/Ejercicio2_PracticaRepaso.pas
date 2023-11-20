{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
   
}

program Ejercicio2Repaso;

type
	auto = record
		patente: string;
		fabricacion: integer;
		marca: string;
		modelo: string;
	end;
	
	arbol1 = ^nodoArbol1;
	nodoArbol1 = record
		dato: auto;
		HI: arbol1;
		HD: arbol1;
	end;
	
	registro = record
			patente: string;
			fabricacion: integer;
			modelo: string;
	end;

	lista = ^nodo;
	nodo = record
		dato: registro;
		sig: lista;
	end;

	auto2 = record
		marca: string;
		lis: lista;
	end;
	
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		dato: auto2;
		HI: arbol2;
		HD: arbol2;
	end;

procedure ModuloA(var a1: arbol1; var a2: arbol2);
{i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben}
	procedure LeerAuto(var a: auto);
	begin
		writeln('Ingrese la patente del auto: ');
		readln(a.patente);
		if(a.patente <> '0000')then begin
			writeln('Ingrese el año de fabricacion del auto: ');
			readln(a.fabricacion);
			writeln('Ingrese la marca del auto: ');
			readln(a.marca);
			writeln('Ingrese el modelo del auto: ');
			readln(a.modelo);
		end;
	end;
	
	procedure AgregarArbol1(var a: arbol1; elem: auto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= elem;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(elem.patente < a^.dato.patente) then 
				AgregarArbol1(a^.HI, elem)
			 else
				AgregarArbol1(a^.HD, elem);
	end;
	
	procedure AgregarAdelante(var L: lista; a: registro);
	var
		nuevo: lista;
	begin
			new(nuevo);
			nuevo^.dato:= a;
			nuevo^.sig:= L;
			L:= nuevo;
	end;

	procedure ArmarRegistro(a: auto; var p: registro);
	begin
			p.patente:= a.patente;
			p.fabricacion:= a.fabricacion;
			p.modelo:= a.modelo;
	end;

	procedure AgregarArbol2(var a: arbol2; elem: auto);
	var
			p: registro;
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.marca:= elem.marca;
			a^.dato.lis:= nil;
			ArmarRegistro(elem, p);
			AgregarAdelante(a^.dato.lis, p);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(elem.marca = a^.dato.marca)then begin
						ArmarRegistro(elem, p);
						AgregarAdelante(a^.dato.lis, p);
		end
		else if(elem.marca < a^.dato.marca) then 
						AgregarArbol2(a^.HI, elem)
				 else
						AgregarArbol2(a^.HD, elem);
	end;
	

var
	r: auto;
	
begin
	LeerAuto(r);
	while (r.patente <> '0000') do begin
		AgregarArbol1(a1, r);
		AgregarArbol2(a2, r); // Le paso el registro o declaro en variables una lista y le asigno los valores?
		LeerAuto(r);
	end;
end;

procedure ModuloB(a: arbol1; var cantidad: integer; marca: string);
{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}
begin
	if(a <> nil)then begin
		if(a^.dato.marca = marca)then begin
			cantidad:= cantidad + 1;
		end;
		ModuloB(a^.HI, cantidad, marca);
		ModuloB(a^.HD, cantidad, marca);
	end;
end;

procedure ModuloC (a: arbol2; var cantidad: integer; marca: string);
{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}
	
	function recorrerLista(L: lista): integer;
	begin
		if(L = nil)then
			recorrerLista:= 0
		else 
			recorrerLista:= 1 + recorrerLista(L^.sig);
	end;
	
begin
	if(a <> nil)then begin
		if(a^.dato.marca = marca)then begin
			cantidad:= recorrerLista(a^.dato.lis);
		end
		else if(marca < a^.dato.marca)then
				ModuloC(a^.HI, cantidad, marca)
			 else
				ModuloC(a^.HD, cantidad, marca);
	end;
end;

procedure ModuloD();
{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}
begin

end;

procedure ModuloE(a: arbol1; patente: string; var modelo: string);
{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}
begin
	if(a <> nil)then begin
		if(a^.dato.patente = patente)then
			modelo:= a^.dato.modelo
		else if(patente < a^.dato.patente)then // Como este arbol esta ordenado por patente, si la patente buscada es menor que la actual, recorro por el lado izquierdo.
				ModuloE(a^.HI, patente, modelo)
			 else
				ModuloE(a^.HD, patente, modelo);
	end;
end;

procedure ModuloF(a: arbol2; patente: string; var modelo: string);
{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
	procedure ChequearPatente(L: lista; patente: string; var modelo: string);
	begin
		if(L <> nil)then begin
			if(L^.dato.patente = patente)then
				modelo:= L^.dato.modelo
			else
				ChequearPatente(L^.sig, patente, modelo);
		end;
	end;
begin
	if(a <> nil)then begin // en este inciso, no puedo acceder a la patente sin antes recorrer la lista, osea este arbol esta ordenado por marca
						   // y en cada marca estan agrupados todos los autos de la misma
		ChequearPatente(a^.dato.lis, patente, modelo);
		if(modelo = ' ')then
			ModuloF(a^.HI, patente, modelo); // este arbol lo tengo que recorrer todo ya que esta ordenado por marca y no por patente
			ModuloF(a^.HD, patente, modelo);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	a1: arbol1;
	a2: arbol2;
	marca, patente, modelo: string;
	cantidad: integer;
BEGIN
	// Inciso A
	ModuloA(a1, a2);
	//
	// Inciso B
	cantidad:= 0;
	writeln('Ingrese una marca: ');
	readln(marca);
	ModuloB(a1, cantidad, marca);
	if(cantidad = 0)then
		writeln('La marca no se encuentra en el arbol')
	else
		writeln('La cantidad de autos de la marca ',marca,' es de ',cantidad);
	//
	// Inciso C
	cantidad:= 0;
	writeln('Ingrese una marca: ');
	readln(marca);
	ModuloC(a2, cantidad, marca);
	if(cantidad = 0)then
		writeln('La marca no se encuentra en el arbol')
	else
		writeln('La cantidad de autos de la marca ',marca,' es de ',cantidad);
	//
	// Inciso D
	
	//
	// Inciso E
	modelo:= ' ';
	writeln('Ingrese una patente: ');
	readln(patente);
	ModuloE(a1, patente, modelo);
	if(modelo = ' ')then
		writeln('La patente buscada no se encontra en la estructura')
	else
		writeln('El modelo del auto con patente ',patente,' es ',modelo);
	//
	// Inciso F
	modelo:= ' '; // le envio modelo ' ' (vacio)
	writeln('Ingrese una patente: ');
	readln(patente);
	ModuloF(a2, patente, modelo);
	if(modelo = ' ')then
		writeln('La patente buscada no se encuentra en la estructura')
	else
		writeln('El modelo del auto con patente ',patente,' es ',modelo);
END.



