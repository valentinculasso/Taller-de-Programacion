{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}


program Ejercicio5;
const
	dimF = 20;
type
	SubRango = 1..20;
	vector = array[SubRango]of integer;


procedure CargarVector(var v: vector; var i: integer);
{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.}
var
	n: integer;
begin
	if(i <= dimF)then begin
		n:= random(100);
		v[i]:= n;
		i:= i+1;
		CargarVector(v, i);
	end;
end;

procedure ordenarVector(var v:vector); // Lo ordeno porque basicamente la busqueda dicotomica sirve para vectores ordenados.
var
    i,j,actual:integer;
    
begin
    for i:=1 to dimF-1 do begin
        for j:=i+1 to dimF do begin
            if(v[j]<v[i]) then begin
                actual:=v[i];
                v[i]:=v[j];
                v[j]:=actual;
            end;
        end;
    end;
end;

procedure ImprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln(v[i]);
	end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: SubRango; dato:integer; var pos: integer);
var
    medio:integer;
begin
    if (ini>fin) then begin
        pos := -1;
        writeln('No encontrado');
    end
    else begin
        medio := (ini+fin) div 2;
		if (v[medio] = dato) then begin
            pos := medio;
            writeln('Encontrado');
    end
	else if (v[medio] < dato) then
        busquedaDicotomica(v, ini, medio-1, dato, pos) // Buscar en la izquierda
    else
        busquedaDicotomica(v, medio+1, fin, dato, pos); // Buscar en la derecha
    end;
end;

var
	v: vector; i: integer;
	ini, fin: SubRango;
	num: integer;
	pos: integer;
BEGIN
	randomize;
	CargarVector(v, i);
	ImprimirVector(v);
	readln(num);
	ini:= 1;
	fin:= dimF;
	pos:= 1;
	busquedaDicotomica(v, ini, fin, num, pos);
	
END.

