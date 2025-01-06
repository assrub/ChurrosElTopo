unit LibGastos;

interface

Type
  // Declaracion del tipo Gasto (estructura)
  tipoGasto = record
    codigo:integer; // Codigo del Gasto
    descripcion: string[35];
    monto: double;
    fecha:TDateTime;
    cantidad: Integer; { Cantidad de unidades en este gasto, por ejemplo
    podemos cargar un solo monto de sueldo (ej. $40.000) que lo cobran
    8 empleados. }
    end;
	
  // Tipo de archivo
  tipoArchivoGastos = file of tipoGasto;
  tipoFiltrado = array of tipoGasto;
  

var
	RG: tipoArchivoGastos; // Tipo archivo gastos
	ruta_gastos:string;
	archivo_gastos:string;

Procedure ActivarGastos (var RG:tipoArchivoGastos; ruta_gastos:string; archivo_gastos:string);
Procedure AbrirGastos(var RG:tipoArchivoGastos);
Procedure CerrarGastos(var RG:tipoArchivoGastos);

Procedure CargarGasto(var RG: tipoArchivoGastos; pos:integer; Gasto:tipoGasto);
Procedure ModificarGasto(var posicion: Integer; var descripcion:String; monto: Double; cantidad: Integer);
Procedure EliminarGasto(var posicion: Integer);
Procedure ObtenerGasto(var RG:tipoArchivoGastos; var pos:integer; var Gasto:tipoGasto);

Procedure ObtenerGastos(var RG:tipoArchivoGastos; pos:integer; var Gasto:tipoGasto);
Function PrimerElemento(var RG:tipoArchivoGastos):integer;
Function UltimoElemento(var RG:tipoArchivoGastos):integer;

implementation

// Activar el archivo
Procedure ActivarGastos (var RG:tipoArchivoGastos; ruta_gastos:string; archivo_gastos:string);
begin
	//assign(RG, ruta_gastos + archivo_gastos);
	AssignFile(RG, ruta_gastos + archivo_gastos);
	{$I-} // Desactivar errores de entrada/salida
	reset(RG);
	{$I+} // Volver a activar errores
	
	// Completado?
	if IOResult <> 0 then
		begin
		// Crear archivo
		rewrite(RG);

		// Cerar archivo
		closefile(RG);

		// Vuelvo a abrir el archivo
		reset(RG);
		end;
end;

Procedure AbrirGastos(var RG:tipoArchivoGastos);
begin
	reset(RG);
end;

Procedure CerrarGastos(var RG:tipoArchivoGastos);
begin
	close(RG);
end;

// Agregar gasto
Procedure CargarGasto(var RG: tipoArchivoGastos; pos:integer; Gasto:tipoGasto);
var
	raux:tipoGasto;
	i:integer;
begin
	if filesize(RG) = 0 then
		write(RG, Gasto)
	else
		begin
			i:=filesize(RG) - 1; // Ultimo Elemento
			while i > pos do
			begin
				seek(RG,i);
				read(RG, raux);
				seek(RG,i+1);
				write(RG,raux);
				i:=i-1;
			end;
			
			seek(RG,pos); // Agrego el nuevo registro
			write(RG,Gasto);
		end;
end;

Procedure BuscarGasto();
begin
end;

// Modificar gasto fijo
Procedure ModificarGasto(var posicion: Integer; var descripcion:String; monto: Double; cantidad: Integer);
begin
end;

// Eliminar gasto fijo
Procedure EliminarGasto(var posicion: Integer);
begin
end;

Procedure ObtenerGasto(var RG:tipoArchivoGastos; var pos:integer; var Gasto:tipoGasto);
begin
	seek(RG,pos);
	read(RG,Gasto);
end;

Procedure ObtenerGastos(var RG:tipoArchivoGastos; pos:integer; var Gasto:tipoGasto);
begin
	seek(RG,pos);
	read(RG,Gasto);
end;

// Obtener el primer elemento
Function PrimerElemento(var RG:tipoArchivoGastos):integer;
begin
	PrimerElemento:=0;
end;

// Obtener el ultimo elemento
Function UltimoElemento(var RG:tipoArchivoGastos):integer;
begin
	UltimoElemento:=filesize(RG) - 1;
end;
end.
