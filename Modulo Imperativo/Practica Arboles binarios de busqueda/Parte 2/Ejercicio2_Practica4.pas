{2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
}


program Ejercicio2;

type
	
	prestamo = record
		isbn: integer;
		socio: integer;
		dia_prestamo: integer;
		mes_prestamo: integer;
		cant_dias: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: prestamo;
		HI: arbol;
		HD: arbol;
	end;
	
	prestamo2 = record
		socio: integer;
		dia_prestamo: integer;
		mes_prestamo: integer;
		cant_dias: integer;
	end;
	
	listaM = ^nodo;
	nodo = record
		dato: prestamo2;
		sig: listaM;
	end;
	
	registro = record
		isbn2: integer;
		lista: listaM;
	end;
	
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		dato: registro;
		HI: arbol2;
		HD: arbol2;
	end;
	
procedure GenerarArbol1(var a: arbol);
	
	procedure LeerPrestamo(var p: prestamo);
	begin
		readln(p.isbn);
		if(p.isbn <> -1)then
			readln(p.socio);
	end;

	procedure AgregarArbol1(var a: arbol; p: prestamo);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(p.isbn <= a^.dato.isbn)then
				AgregarArbol1(a^.HI, p)
			else
				AgregarArbol1(a^.HD, p);
	end;
	
var
	p: prestamo;
begin
	a:= nil;
	LeerPrestamo(p);
	while(p.isbn <> -1)do begin
		AgregarArbol1(a, p);
		LeerPrestamo(p);
	end;
end;

procedure GenerarArbol2(var a2: arbol2);

	procedure LeerPrestamo(var p: prestamo);
	begin
		readln(p.isbn);
		if(p.isbn <> -1)then
			readln(p.socio);
	end;
	
	procedure AgregarAdelante(var L: listaM; p: prestamo2);
	var
		nuevo: listaM;
	begin
		new(nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure armarRegistro(p: prestamo; var p2: prestamo2);
	begin
		p2.socio:= p.socio;
		p2.dia_prestamo:= p.dia_prestamo;
		p2.mes_prestamo:= p.mes_prestamo;
		p2.cant_dias:= p.cant_dias;
	end;
	
	procedure AgregarArbol2(var a2: arbol2; p: prestamo);
	var
		p2: prestamo2;
	begin
		if(a2 = nil)then begin
			new(a2);
			armarRegistro(p, p2);
			a2^.dato.isbn2:= p.isbn; // Le asigno el codigo isbn
			a2^.dato.lista:= nil; // Inicializo la lista de ese nodo en nil
			AgregarAdelante(a2^.dato.lista, p2); // Agrego a la lista
			a2^.HI:= nil; // Inicializo nodo izquierdo en nil
			a2^.HD:= nil; // Inicializo nodo derecho en nil
		end
		else begin
			if(p.isbn = a2^.dato.isbn2)then
				AgregarAdelante(a2^.dato.lista, p2)
			else
				if(p.isbn <= a2^.dato.isbn2)then
 					AgregarArbol2(a2^.HI, p)
				else
					AgregarArbol2(a2^.HD, p)
		end;
	end;

var
	p: prestamo;
begin
	a2:= nil;
	LeerPrestamo(p);
	while(p.isbn <> -1)do begin
		AgregarArbol2(a2, p);
		LeerPrestamo(p);
	end;
end;

function ISBNmasGrandeArbol1(a: arbol): integer;
{b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.}
begin
	if(a^.HD = nil)then
		ISBNmasGrandeArbol1:= a^.dato.isbn
	else
		ISBNmasGrandeArbol1:= ISBNmasGrandeArbol1(a^.HD);
end;

function ISBNmasGrandeArbol2(a2: arbol2): integer;
{c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.}
begin
	if(a2^.HD = nil)then
		ISBNmasGrandeArbol2:= a2^.dato.isbn2
	else
		ISBNmasGrandeArbol2:= ISBNmasGrandeArbol2(a2^.HD);
end;

procedure CantidadPrestamosArbol1(a: arbol; socio: integer; var cantidad: integer);
{d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
// Debo recorrer toda el arbol y ver cuantos prestamos hay con un numero de socio.
begin
	if(a <> nil)then begin
		if(a^.dato.socio = socio)then
			cantidad:= cantidad + 1;
		CantidadPrestamosArbol1(a^.HI, socio, cantidad);
		CantidadPrestamosArbol1(a^.HD, socio, cantidad);
	end;
end;

procedure CantidadPrestamosArbol2(a2: arbol2; socioB: integer; var cantidad: integer);
{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
// Una vez localizado el nro de socio debo recorrer la lista y contar.
	
	procedure recorrerLista(L: listaM; var cantidad: integer; socio: integer);
	begin
		if(L <> nil)then begin
			if(L^.dato.socio = socio)then
				cantidad:= cantidad + 1;
			recorrerLista(L^.sig, cantidad, socio);
		end;
	end;
	
begin
	if(a2 <> nil)then begin // LA ESTRUCTURA ESTA ORDENADA POR ISBN (CODIGO DEL LIBRO POR ASI DECIRLO) POR LO QUE UN LIBRO PUEDE HABERSE PRESTADO A DIFERENTES SOCIOS, ENTRE ELLOS EL BUSCADO. POR LO QUE DEBO RECORRER CADA LISTA DE CADA NODO
		recorrerLista(a2^.dato.lista, cantidad, socioB);
		CantidadPrestamosArbol2(a2^.HI, socioB, cantidad); // recorro todo el arbol
		CantidadPrestamosArbol2(a2^.HD, socioB, cantidad);
	end;
end;

// procedure retornarNuevaEstructura(a: arbol);
{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
* 
* // PUEDO RECIBIR EL ARBOL, RECORRERLO TODO, Y CALCULAR LA CANT DE VECES QUE SE PRESTO (DEBO RECORRER TODO EL ARBOL PARA CADA ISBN)

// procedure retornarNuevaEstructura2(a2: arbol2);
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}

 // ESTE ES MAS FACIL QUE EL ANTERIOR, YA QUE EL ARBOL ESTA ORDENADO POR ISBN Y CADA NODO TIENE UNA LISTA CON TODOS LOS PRESTAMOS. ENTONCES PARA SACAR LA CANTIDAD SOLO DEBO RECORRER LA LISTA

var
	a: arbol;
	a2: arbol2;
	nroSocio: integer;
	cantidad: integer;
BEGIN
	GenerarArbol1(a); // punto a i)
	GenerarArbol2(a2); // punto a ii)
	ISBNmasGrandeArbol1(a); // punto B
	ISBNmasGrandeArbol2(a2); // punto C
	writeln('Ingrese un numero de socio a buscar: ');
	readln(nroSocio);
	cantidad:= 0;
	CantidadPrestamosArbol1(a, nroSocio, cantidad); // punto D
	writeln('La cantidad de prestamos realizados al socio con numero ', nroSocio,' es de ', cantidad);
	cantidad:= 0;
	CantidadPrestamosArbol2(a2, nroSocio, cantidad); // punto E
	writeln('La cantidad de prestamos realizados al socio con numero ', nroSocio,' es de ', cantidad);
{	RetornarEstructuraNueva(a); // punto F
	RetornarEstructuraNueva(a2); // punto G}
END.

