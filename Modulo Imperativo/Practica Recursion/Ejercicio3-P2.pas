{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
}


program Ejercicio3;

type
	// declaro lista de numeros enteros
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

procedure imprimirLista(l:lista);
begin
    while (l <> nil) do begin
        writeln(l^.dato);
        l:=l^.sig;
    end;
end;

procedure AgregarAdelante(var L: lista; num: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= L;
	L:= nue;
end;

procedure CargarLista(var L:lista; n: integer); // procedure CargarLista(var L:lista; n:integer);
{a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.}

begin
	n:= random(100);
	if(n <> 0)then begin
		AgregarAdelante(L, n);
		CargarLista(L, n);
	end;
end;

procedure devolverminimo(L: lista; var minimo: integer);
{b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.}
begin
	if(L <> NIL)then
		if(L^.dato < minimo) or (minimo = 0)then
			minimo:= L^.dato;
		DevolverMinimo(L^.sig, minimo);
end;

procedure DevolverMaximo(L: lista; var maximo: integer);
{c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.}
begin
	if(L <> NIL)then
		if(L^.dato > maximo) or (maximo = 0)then
			maximo:= L^.dato;
		DevolverMaximo(L^.sig, maximo);
end;

function ChequearSiEsta(L: lista; num: integer): boolean; 
{d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}
begin
	if(L <> NIL)then
		if(L^.dato = num)then
			ChequearSiEsta:= true
		else
			ChequearSiEsta:= ChequearSiEsta(L^.sig, num);
end;

var
	L:lista; numero, max, min, num_buscar: integer;
	
BEGIN
	randomize;
	numero:= -1;
	L:= NIL;
	max:= 0;
	min:= 0;
	CargarLista(L, numero); // Inciso A
	ImprimirLista(L);
	devolverminimo(L, min); // Inciso B
	writeln;
	writeln('El valor minimo de la lista es: ',min);
	DevolverMaximo(L, max); // Inciso C
	writeln;
	writeln('El valor maximo de la lista es: ',max);
	writeln;
	writeln('Ingrese un numero a buscar en la lista: ');
	readln(num_buscar);
	if(ChequearSiEsta(L, num_buscar))then
		writeln('El elemento buscado se encuentra en la lista')
	else
		writeln('El elemento no se encuentra en la lista');
END.

