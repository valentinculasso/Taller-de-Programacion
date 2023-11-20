{3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

 
program Ejercicio3P3;
type
	RangoNotas = 1..10;
	
	finales = record
		codigo: integer;
		nota: RangoNotas;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: finales;
		sig: lista;
	end;
	
	alumno = record
		legajo: integer;
		DNI: integer;
		ingreso: integer;
		finales_rendidos: lista; // "codigos y notas de los finales rendidos" -> ¿Lista? -> no se cuantos codigos y notas de finales hay
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

procedure ModuloA (var a: arbol);
{a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.}
	
	procedure LeerFinal(var a: finales);
	begin
		writeln('Ingrese el codigo del final rendido: ');
		readln(a.codigo);
		if(a.codigo <> -1)then begin
			writeln('Ingrese la nota del final rendido con codigo ', a.codigo);
			readln(a.nota);
		end;
	end;
	
	procedure AgregarAdelante(var L: lista; a: finales);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= a;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure GenerarLista(var L: lista);
	var
		a: finales;
	begin
		LeerFinal(a);
		while(a.codigo <> -1)do begin
			AgregarAdelante(L, a);
			LeerFinal(a);
		end;
	end;
	
	procedure LeerAlumno(var a: alumno);
	begin
		writeln('Ingrese el numero de legajo del alumno: ');
		readln(a.legajo);
		if(a.legajo <> 0)then begin
			writeln('Ingrese el DNI del alumno: ');
			readln(a.DNI);
			writeln('Ingrese el año de ingreso del alumno: ');
			readln(a.ingreso);
			a.finales_rendidos:= nil;
			GenerarLista(a.finales_rendidos); // tendria que leer codigo y tambien la nota de cada final rendido -> registro -> una vez leido -> almaceno en lista
		end;
	end;
	
	procedure Agregar(var a: arbol; p: alumno);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(p.legajo <= a^.dato.legajo)then
				Agregar(a^.HI, p)
			 else
				Agregar(a^.HD, p);
	end;
	
var
	p: alumno;
begin
	a:= nil;
	LeerAlumno(p);
	while(p.legajo <> 0)do begin
		Agregar(a, p);
		LeerAlumno(p);
	end;
end;

procedure ModuloB(a: arbol; legajo: integer);
{b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.}
begin
	if(a <> nil)then begin
		ModuloB(a^.HI, legajo);
		if(a^.dato.legajo < legajo)then begin
			writeln('El DNI y el año de ingreso de alumno con legajo inferior a ',legajo,' es: ',a^.dato.DNI,' y ', a^.dato.ingreso);
		end;
		ModuloB(a^.HD, legajo);
	end;
end;

procedure ModuloC(a: arbol);
{c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.}
	function CalcularMax(a: arbol): integer;
	begin
		if(a^.HD = nil)then begin
			CalcularMax:= a^.dato.legajo;
		end
		else
			CalcularMax:= CalcularMax(a^.HD);
	end;

var
	maximo: integer;
begin
	if(a <> nil)then begin
		maximo:= CalcularMax(a);
		write('El numero de legajo mas grande es: ', maximo);
	end;
end;

procedure ModuloD(a: arbol);
{d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}

	procedure CalcularDNImax(DNI: integer; var max: integer);
	begin
		if(DNI > max)then begin
			max:= DNI;
		end;
	end;
	
	procedure RecorrerArbol(a: arbol; var dniMax: integer);
	begin
		if(a <> nil)then begin
			CalcularDNImax(a^.dato.DNI, dniMax);
			RecorrerArbol(a^.HI, dniMax);
			RecorrerArbol(a^.HD, dniMax);
		end;
	end;
	
var
	dniMax: integer;
begin
	dniMax:= 0;
	RecorrerArbol(a, dniMax);
	writeln('El DNI mas grande es ', dniMax);
end;

procedure ModuloE(a: arbol);
{e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.}
	
	function LegajoImpar(legajo: integer): integer;
	var
		dig, par: integer;
	begin
		par:= 0;
		while(legajo <> 0)and(par <> 0)do begin
			dig:= legajo MOD 10;
			if(dig MOD 2 = 0)then
				par:= par + 1;
			legajo:= legajo DIV 10;
		end;
		if(par <> 0)then
			LegajoImpar:= 0
		else
			LegajoImpar:= 1;
	end;
	
	procedure CantidadLegajosPar(a: arbol; var cantidad: integer);
	begin
		if(a <> nil)then begin
			cantidad:= cantidad + LegajoImpar(a^.dato.legajo);
			// Tengo que recorrer todo el arbol
			CantidadLegajosPar(a^.HI, cantidad);
			CantidadLegajosPar(a^.HD, cantidad);
		end;
	end;
var
	cantidad: integer;
begin
	cantidad:= 0;
	CantidadLegajosPar(a, cantidad);
	writeln('La cantidad de alumnos con legajo par es de ', cantidad);
end;

procedure ModuloE2 (a: arbol);
{e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.}

// recorrer el arbol y tambien recorrer la lista en cada nodo del arbol, y asi cargar en una variable el legajo y promedio mayores
begin

end;

procedure ModuloF(a: arbol; valor: integer);
{f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

// Aca tengo que trabajar con la lista, recorrerla, calcular el promedio de cada alumno y si cumple imprimirlo
	
	procedure CumplePromedio(L: lista; valor: integer; var promedio: integer);
	var
		suma, cantidad: integer;
	begin
		suma:= 0;
		cantidad:= 0;
		while(L <> nil)do begin
			suma:= suma + L^.dato.nota;
			cantidad:= cantidad + 1;
			L:= L^.sig;
		end;
		promedio:= suma DIV cantidad;
	end;

var	
	promedio: integer;
begin
	if(a <> nil)then begin
		promedio:= 0;
		CumplePromedio(a^.dato.finales_rendidos, valor, promedio);
		if(promedio > valor)then
			writeln('El legajo del alumno cuyo promedio supera el valor ',valor,' es ',a^.dato.legajo,' y su promedio es ',promedio);
		// recorro todo el arbol
		ModuloF(a^.HI, valor);
		ModuloF(a^.HD, valor);
	end;
end;

var
	a: arbol;
	legajo, valor: integer;
BEGIN
	ModuloA(a);
	writeln('Ingrese un numero de legajo: ');
	readln(legajo);
	ModuloB(a, legajo);
	ModuloC(a);
	ModuloD(a);
	ModuloE(a);
	writeln('Ingrese un valor de promedio: ');
	readln(valor);
	ModuloF(a, valor);
END.

