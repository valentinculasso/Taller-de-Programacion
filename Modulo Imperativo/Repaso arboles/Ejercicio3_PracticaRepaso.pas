{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes durante 2022.
*a) Implementar un modulo que lea informacion de las atenciones y retorne una estructura de datos que agrupe las atenciones de cada mes.
* Para cada mes, las atenciones deben almacenarse en una estructura eficiente para la busqueda por DNI de paciente.
* De cada atencion se lee: dni del paciente, dia y numero de mes. La lectura finaliza con el mes 0.
*b)
* 
*c)
* 
}


program ParcialTurnoG1530hs;
const
	dimF = 12;
type
	sub_mes = 0..12;
	sub_dias = 1..31;
	atencion = record
		dni: integer;
		dia: sub_dias;
		mes: sub_mes;
	end;
	
	registro = record
		DNI: integer;
		diaA: sub_dias;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: registro;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array[1..12]of arbol;


procedure InicializarVector(var v: vector);
var
	i:integer;
begin
	for i:= 1 to dimF do begin
		v[i]:= nil;
	end;
end;

procedure ModuloA(var v: vector);

	procedure LeerAtencion(var p: atencion);
	begin
		writeln('Ingrese el mes de la atencion: ');
		readln(p.mes);
		if(p.mes <> 0)then begin
			writeln('Ingrese el DNI del paciente: ');
			readln(p.dni);
			writeln('Ingrese el dia de la atencion: ');
			readln(p.dia);
		end;
	end;
	
	procedure AgregarArbol(var a: arbol; p: atencion);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.DNI:= p.dni;
			a^.dato.diaA:= p.dia;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		// else if(p.dni = a^.dato.DNI)then
			//		a^.dato.cantidad:= a^.dato.cantidad + 1;
		else if(p.dni <= a^.dato.DNI)then // Si le pongo menor o igual, si entra el mismo DNI se almacena a la izquierda.
				AgregarArbol(a^.HI, p)
			 else
				AgregarArbol(a^.HD, p);
	end;
	
var
	p: atencion;
begin
	LeerAtencion(p);
	while(p.mes <> 0)do begin
		AgregarArbol(v[p.mes], p);
		LeerAtencion(p);
	end;
end;

procedure ImprimirArbol(a: arbol);
begin
	if(a <> nil)then begin
		writeln('El DNI del paciente es ',a^.dato.DNI);
		writeln('El dia de la atencion fue el dia ',a^.dato.diaA);
		ImprimirArbol(a^.HI);
		ImprimirArbol(a^.HD);
	end;
end;

procedure ImprimirVectorArbol(v : vector);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		ImprimirArbol(v[i]);
	end;
end;

var
	v: vector;

BEGIN
	InicializarVector(v);
	ModuloA(v);
	ImprimirVectorArbol(v);
	
END.

