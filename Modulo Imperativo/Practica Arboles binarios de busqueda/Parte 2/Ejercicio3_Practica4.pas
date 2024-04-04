{3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
}


program Ejercicio3P3;
const
	dimF = 30;
type
	RangoNotas = -1..10;
	RangoNotasAprobadas = 4..10;
	finales = record
		codigo_alumno: integer;
		codigo_materia: integer;
		nota: RangoNotas;
	end;
	
{Estructura 1}
	materia1 = record
		codigo: integer;
		nota: RangoNotasAprobadas;
	end;
{	vector = array[RangoNotas]of materia1 // Podria hacer un vector de las materias aprobadas (pero si un alumno tiene solo 5 aprobadas, gasto memoria en 25 posiciones sin usar)}
	listaArbol = ^nodoListaArbol; // Si hago una lista con las materias aprobadas, sean 2, 5, 10 o incluso las 30 (no se sabe cuantas son por alumno) estaria ahorrando memoria
 				      // Tambien podria hacer un vector, ya que me dan la dimF (cantidad de materias) entonces manejaria solo dimL en caso de no estar cargado
	nodoListaArbol = record
		dato: materia1;
		sig: listaArbol;
	end;
	
	alumno = record
		codigoAlumno: integer;
		materias: listaArbol;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
{Estructura 2}
	materia2 = record
		codigoAlumno: integer;
		nota: RangoNotas;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: materia2;
		sig: lista;
	end;
	
	materia = record
		codigoMateria: integer;
		finales_rendidos: lista;
	end;
	
	vectorMaterias = array[1..DimF]of materia;
// ---------------------------------------------------

procedure GenerarEstructuras(var a: arbol; var v: vectorMaterias);
	
	procedure LeerFinal(var f: finales);
	begin
		writeln('Ingrese la nota del final: ');
		readln(f.nota);
		if(f.nota <> -1)then begin
			writeln('Ingrese el codigo de la materia: ');
			readln(f.codigo_materia);
			writeln('Ingrese el codigo del alumno: ');
			readln(f.codigo_alumno);
		end;
	end;
	
	procedure armarRegistro(f: finales; var m: materia1);
	begin
		m.codigo:= f.codigo_materia;
		m.nota:= f.nota;
	end;
	
	procedure AgregarAdelante(var L: listaArbol; m: materia1);
	var
		nuevo: listaArbol;
	begin
		new(nuevo);
		nuevo^.dato:= m;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure GenerarArbol(var a: arbol; f: finales);
	var
		m: materia1;
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.codigoAlumno:= f.codigo_alumno;
			a^.dato.materias:= nil; // pongo lista de ese nodo en nil
			armarRegistro(f, m); // armo registro
			AgregarAdelante(a^.dato.materias, m); // lo agrego a la lista
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(f.codigo_alumno <= a^.dato.codigoAlumno)then
				GenerarArbol(a^.HI, f)
			else
				GenerarArbol(a^.HD, f);
	end;
	
	procedure armarRegistro2(f: finales; var m: materia2);
	begin
		m.codigoAlumno:= f.codigo_alumno;
		m.nota:= f.nota;
	end;
	
	procedure AgregarAdelante2(var L: lista; m: materia2);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= m;
		nuevo^.sig:= L;
		L:= nuevo;
	end;
	
	procedure GenerarVector(var v: vectorMaterias; f: finales);
	var
		m: materia2;
	begin
		v[f.codigo_materia].codigoMateria:= f.codigo_materia;  // El codigo de materia es de 1 a 30 ?
		armarRegistro2(f, m);
		AgregarAdelante2(v[f.codigo_materia].finales_rendidos, m);
	end;
	
var
	f: finales;
begin
	LeerFinal(f);
	while(f.nota <> -1)do begin
		if(f.nota >= 4)then // Solo lo agrego al arbol si aprobo la materia, ya que el arbol consiste en agregar alumnos con materias aprobadas.
			GenerarArbol(a, f);
		GenerarVector(v, f);
	end;
end;

procedure InicializarVector(var v: vectorMaterias);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		v[i].codigoMateria:= 0;
		v[i].finales_rendidos:= nil;
	end;
end;

// ---------------------------------------------------

procedure retornarPromedios(a: arbol; codigo: integer);
{b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.}
var
	promedio: real;
begin
	if(a <> nil)then
		promedio:= 0;
		if(a^.dato.codigoAlumno > codigo)then begin
			calcularPromedio(a^.dato.materias, promedio); // FALTA HACER ESTE MODULO
			writeln('El alumno con codigo ', a^.dato.codigoAlumno,' tiene promedio ', promedio);
			retornarPromedios(a^.HI, codigo); // Si el codigo del arbol actual es mayor al codigo ingresado entonces busco por la rama izquierda y por la rama derechas mas codigos.
			retornarPromedios(a^.HD, codigo);
		end
		else
			retornarPromedios(a^.HD, codigo); // Si el codigo del arbol actual NO es mayor al codigo ingresado, entonces voy a buscar un codigo mas grande por la rama derecha
end;

// ---------------------------------------------------

procedure retornarCantidad(

{c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los
dos códigos de alumnos ingresados.}
begin

end;

var
	a: arbol;
	v: vectorMaterias;
BEGIN
	InicializarVector(v);
	GenerarEstructuras(a, v);
	
END.
