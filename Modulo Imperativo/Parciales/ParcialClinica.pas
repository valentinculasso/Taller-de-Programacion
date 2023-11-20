{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes.
* a) Implementar un modulo que lea la informacion de las atenciones. De cada atencion se lee: DNI del paciente,
* numero de mes, y codigo de diagnostico (1..15). La lectura finaliza con el mes 0.
* El modulo debe retornar dos estructuras de datos:
* i) Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe almacenarse
* 	la cantidad total de atenciones recibidas.
* ii) Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico.
* b) Implementar un modulo que reciba la estructura generada en a) i , dos numeros de DNI y un valor entero x. Este modulo
* debe retornar la cantidad de pacientes con mas de x atenciones cuyos DNI estan entre los 2 numeros de DNI recibidos.
* c) Implementar un modulo recursivo que reciba la estructura generada en a) ii, y retorne la cantidad de diagnosticos
*  para los cuales la cantidad de atenciones fue cero.
}


program untitled;
const
	dimF = 15;
type
	RangoMes = 0..12;
	RangoDiagnostico = 1..15;
	atencion = record
		DNI_paciente: integer;
		nro_mes: RangoMes;
		codigo_diagnostico: RangoDiagnostico;
	end;

	registro = record
		DNI: integer;
		cant_total: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: registro;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array[RangoDiagnostico]of integer;
	
	

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 15 do begin
		v[i]:= 0;
	end;
end;

procedure ModuloA(var a: arbol; var v: vector);
{* a) Implementar un modulo que lea la informacion de las atenciones. De cada atencion se lee: DNI del paciente,
* numero de mes, y codigo de diagnostico (1..15). La lectura finaliza con el mes 0.
* El modulo debe retornar dos estructuras de datos:
* i) Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe almacenarse
* 	la cantidad total de atenciones recibidas.
* ii) Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico.}
	
	procedure LeerAtencion(var p: atencion);
	begin
		writeln('Ingrese el numero de mes de la atencion: ');
		readln(p.nro_mes);
		if(p.nro_mes <> 0)then begin
			writeln('Ingrese el DNI del paciente: ');
			readln(p.DNI_paciente);
			writeln('Ingrese el codigo de diagnostico: ');
			readln(p.codigo_diagnostico);
		end;
	end;
	
	procedure AgregarArbol(var a: arbol; p: atencion);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.DNI:= p.DNI_paciente;
			a^.dato.cant_total:= 0;
			a^.dato.cant_total:= a^.dato.cant_total + 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(a^.dato.DNI = p.DNI_paciente)then begin
				a^.dato.cant_total:= a^.dato.cant_total + 1;
			 end
			 else if(p.DNI_paciente < a^.dato.DNI)then
					AgregarArbol(a^.HI, p)
				  else
					AgregarArbol(a^.HD, p);
	end;
	
var
	p: atencion;
begin
	LeerAtencion(p);
	while(p.nro_mes <> 0)do begin
		v[p.codigo_diagnostico]:= v[p.codigo_diagnostico] + 1;
		AgregarArbol(a, p);
		LeerAtencion(p);
	end;
end;

procedure ModuloB(a: arbol; dni1: integer; dni2: integer; x: integer; var cant: integer);
{b) Implementar un modulo que reciba la estructura generada en a) i , dos numeros de DNI y un valor entero x. Este modulo
* debe retornar la cantidad de pacientes con mas de x atenciones cuyos DNI estan entre los 2 numeros de DNI recibidos.}
begin
	if(a <> nil)then begin
		if(a^.dato.DNI >= dni1)then begin
			if(a^.dato.DNI <= dni2)then begin
				if(a^.dato.cant_total > x)then begin
					cant:= cant + 1;
					ModuloB(a^.HI, dni1, dni2, x, cant);
					ModuloB(a^.HD, dni1, dni2, x, cant);
				end
			else
				ModuloB(a^.HI, dni1, dni2, x, cant);
		end
		else
			ModuloB(a^.HD, dni1, dni2, x, cant);
		end;
	end;
end;

procedure ModuloC(v: vector; var i: integer; var cant: integer);
{ c) Implementar un modulo recursivo que reciba la estructura generada en a) ii, y retorne la cantidad de diagnosticos
para los cuales la cantidad de atenciones fue cero.}
begin
	if(i <= dimF)then begin
		if(v[i] = 0)then begin
			cant:= cant + 1;
		end;
		i:= i + 1;
		ModuloC(v, i, cant);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	v: vector;
	DNI1, DNI2, valor, cantidad, indice: integer;

BEGIN
	// a)
	InicializarVector(v);
	ModuloA(a, v);
	// b)
	writeln('Ingrese un numero de dni: ');
	readln(DNI1);
	writeln('Ingrese un numero de dni: ');
	readln(DNI2);
	writeln('Ingrese un numero: ');
	readln(valor);
	cantidad:= 0;
	ModuloB(a, DNI1, DNI2, valor, cantidad);
	writeln('La cantidad total de pacientes con mas de ',valor,' atenciones es de ',cantidad);
	// c)
	indice:= 1;
	cantidad:= 0;
	ModuloC(v, indice, cantidad);
END.

