{Se lee informacion de las compras realizadas por los clientes a un supermercado en el año 2022. De cada compra se lee
el codigo de cliente, numero de mes y monto gastado. La lectura finaliza cuando se lee el cliente con codigo 0.
a) Realizar un modulo que lea la informacion de las compras y retorne una estructura de datos eficiente para la busqueda
* por codigo de cliente. Para cada cliente, esta estructura debe acumular el monto total gastado para cada mes del año 2022.
b) Realizar un modulo que reciba la estructura generada en a) y un cliente, y retorne el mes con mayor gasto de dicho cliente.
c) Realizar un modulo que reciba la estructura generada en a) y un numero de mes, y retorne la cantidad de clientes que no gastaron nada en dicho mes.
}


program Parcial2023;

type
	RangoMes = 1..12;
	compra = record
		codigo_cliente: integer;
		mes: RangoMes;
		monto_gastado: real;
	end;
	
	vectorMontoTotal = array[RangoMes]of real;
	
	cliente = record
		codigo: integer;
		monto_total_mes: vectorMontoTotal;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: cliente;
		HI: arbol;
		HD: arbol;
	end;

procedure ModuloA(var a: arbol);
	
	procedure LeerCompra(var c: compra);
	begin
		writeln('Ingrese el codigo de cliente: ');
		readln(c.codigo_cliente);
		if(c.codigo_cliente <> 0)then
			writeln('Ingrese el mes de la compra: ');
			readln(c.mes);
			writeln('Ingrese el monto gastado: ');
			readln(c.monto_gastado);
	end;
	
	procedure InicializarVector(var v: vectorMontoTotal);
	var
		i:integer;
	begin
		for i:= 1 to 12 do begin
			v[i]:= 0;
		end; 
	end; 
	
	procedure Agregar(var a: arbol; c: compra);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.codigo:= c.codigo_cliente;
			InicializarVector(a^.dato.monto_total_mes);
			a^.dato.monto_total_mes[c.mes]:= a^.dato.monto_total_mes[c.mes] + c.monto_gastado;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if(a^.dato.codigo = c.codigo_cliente)then
				a^.dato.monto_total_mes[c.mes]:= a^.dato.monto_total_mes[c.mes] + c.monto_gastado // Si es el mismo codigo (osea mismo cliente) actualizo
			 else if(c.codigo_cliente <= a^.dato.codigo)then
					Agregar(a^.HI, c)
				  else
					Agregar(a^.HD, c);
	end;

var
	c: compra;
begin
	a:= nil;
	LeerCompra(c);
	while(c.codigo_cliente <> 0)do begin
		Agregar(a, c);
		LeerCompra(c);
	end;
end;

procedure ModuloB (a: arbol);
{b) Realizar un modulo que reciba la estructura generada en a) y un cliente, y retorne el mes con mayor gasto de dicho cliente.}
		
	function buscarCliente(a: arbol; num: integer): arbol;
	begin
		if(a = nil)then
			buscarCliente:= nil
		else
			if(a^.dato.codigo = num)then
				buscarCliente:= a
			else
				if(a^.dato.codigo > num)then
					buscarCliente:= buscarCliente(a^.HI, num)
				else
					buscarCliente:= buscarCliente(a^.HD, num);
	end;
	
	function calcularMax(v: vectorMontoTotal): integer;
	var
		i, mes_max: integer;
		max: real;
	begin
		max:= 0;
		mes_max:= 0;
		for i:= 1 to 12 do begin
			if(v[i] > max)then begin
				max:= v[i];
				mes_max:= i;
			end;
		end;
		calcularMax:= mes_max;
	end;
	
var
	aux: arbol;
	num: integer;
begin
	writeln('Ingrese un numero de cliente: ');
	readln(num);
	aux:= buscarCliente(a, num);
	if(aux = nil)then
		writeln('El cliente no existe')
	else begin
		writeln('El mes que mas gasto del cliente con codigo ',num,' fue el mes ', calcularMax(aux^.dato.monto_total_mes));
	end;
end;

procedure ModuloC (a: arbol; mes: RangoMes; var cantidad: integer);
{c) Realizar un modulo que reciba la estructura generada en a) y un numero de mes, y retorne la cantidad de clientes que no gastaron nada en dicho mes.}
	function ChequearGasto(v: vectorMontoTotal; mes: RangoMes): integer;
	begin
		if(v[mes] = 0)then
			ChequearGasto:= 1
		else
			ChequearGasto:= 0;
	end;

begin
	if(a <> nil)then begin
		cantidad:= cantidad + ChequearGasto(a^.dato.monto_total_mes, mes);
		
		ModuloC(a^.HI, mes, cantidad); // Como tengo que retornar la cantidad de clientes que no gastaron nada en dicho mes, tengo que recorrer toda la estructura
		ModuloC(a^.HD, mes, cantidad);
	end;
end;

var
	a: arbol;
	mes: RangoMes;
	cantidad: integer;
BEGIN
	ModuloA(a);
	ModuloB(a); // en teoria deberia retornar el mes con el mayor gasto, por ende varias cosas las tengo que traer del modulo al programa principal
	writeln('Ingrese un numero de mes: ');
	readln(mes);
	cantidad:= 0;
	ModuloC(a, mes, cantidad);
	writeln('La cantidad de clientes que no gastaron nada en el mes ',mes,' es de ',cantidad);
END.

