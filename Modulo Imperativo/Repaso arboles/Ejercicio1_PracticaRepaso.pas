{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.
}


program Ejercicio1Repaso;
const
	dimF = 300;
type
	
	oficina = record
		codigo: integer;
		DNI: integer;
		valor: real;
	end;

	vector = array[1..dimF]of oficina;

procedure ModuloA (var v: vector; var dimL: integer);
{a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.}
	procedure LeerOficina(var a: oficina);
	begin
		writeln('Ingrese el codigo de identificacion: ');
		readln(a.codigo);
		if(a.codigo <> -1)then begin
			writeln('Ingrese el DNI del propietario: ');
			readln(a.DNI);
			writeln('Ingrese el valor de la expensa: ');
			readln(a.valor);
		end;
	end;
	
var
	a: oficina;
begin
	LeerOficina(a);
	while(a.codigo <> -1)and(dimL < dimF)do begin
		dimL:= dimL + 1;
		v[dimL]:= a;
		LeerOficina(a);
	end;
end;

procedure ModuloB(var v: vector; dimL: integer);
{b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.}
var
	i, j, pos: integer;
	item: oficina;
begin
	for i:= 1 to dimL-1 do begin
		pos:= i;
		for j:= i+1 to dimL do begin
			if(v[j].codigo < v[i].codigo)then
				pos:= j;
		end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

procedure ImprimirB(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln(v[i].codigo);
		writeln(v[i].DNI);
		writeln(v[i].valor);
	end;
end;

procedure ModuloC(v: vector; dimL: integer; codigo: integer; var posicion: integer);
{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.}
var
	pri, ult, medio: integer;
begin
	pri:= 1;
	ult:= dimL;
	medio:= (pri + ult) div 2; 							// si dimL es 100, medio es 100/2 = 50 + 1?
	while(pri <= ult)and(v[medio].codigo <> codigo)do begin
		if(v[medio].codigo < codigo)then begin
			ult:= medio - 1;
		end
		else begin
			pri:= medio + 1;
		end;
	end;
	if(pri <= ult)and(codigo = v[medio].codigo)then
		posicion:= medio
	else
		posicion:= 0;
end;

var
	v: vector; dimL: integer;
	codigo, posicion: integer;
BEGIN
	dimL:= 0;
	ModuloA(v, dimL);
	ModuloB(v, dimL); // ordenamiento de vectores
	ImprimirB(v, dimL);
	writeln('Ingrese un codigo de identificacion de oficina: ');
	readln(codigo);
	ModuloC(v, dimL, codigo, posicion); // busqueda dicotomica
	if(posicion = 0)then
		writeln('No se encontro la oficina')
	else
		writeln('Oficina encontrada'); // bueno aca me dice que retorne el dni, pero qsy lo deberia imprimir en el modulo, ya que si no tendria que buscar y retornar el dni tambien, ademas de la posicion
END.

