{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program Ejercicio4;
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

procedure ImprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln(v[i]);
	end;
end;

procedure DevolverMaximo(v: vector; var max: integer; var indice: integer);
{b. Un módulo recursivo que devuelva el máximo valor del vector.}
begin
	if(indice <= dimF)then begin
		if(v[indice] > max)then begin
			max:= v[indice];
		end;
		indice:= indice + 1;
		DevolverMaximo(v, max, indice);
	end;
end;

procedure SumaValoresVector(v: vector; var suma: integer; var indice: integer);
{c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
begin
	if(indice <= dimF)then begin
		suma:= suma + v[indice];
		indice:= indice + 1;
		SumaValoresVector(v, suma, indice);
	end;
end;

var
	v: vector; i, max, suma: integer;

BEGIN
	randomize;
	i:= 1;
	CargarVector(v, i); // A
	ImprimirVector(v);
	i:= 1;
	max:= -1;
	DevolverMaximo(v, max, i); // B
	writeln('El valor maximo es ', max);
	i:= 1;
	suma:= 0;
	SumaValoresVector(v, suma, i); // C
	writeln('La suma de los valores contenidos en el vector es de: ', suma); 

END.
