unit Historial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LibGastos, registroVentas, archivosVentas, jpeg,
  ExtCtrls, ComCtrls, DateUtils;

type
  TFormHistorial = class(TForm)
    GroupGastos: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    GroupVentas: TGroupBox;
    Label1: TLabel;
    Button3: TButton;
    GastoDescripcion: TListBox;
    GastoCantidad: TListBox;
    GastoMonto: TListBox;
    GastoSubtotal: TListBox;
    GastoTipo: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TotalGastos: TLabel;
    FechaGastos: TMonthCalendar;
    Label8: TLabel;
    FechaVentas: TMonthCalendar;
    VentaFecha: TListBox;
    VentaCodigo: TListBox;
    VentaOperador: TListBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    VentaSubtotal: TListBox;
    Label12: TLabel;
    TotalVentas: TLabel;
    Label13: TLabel;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure GastoDescripcionClick(Sender: TObject);
    procedure GastoTipoClick(Sender: TObject);
    procedure GastoCantidadClick(Sender: TObject);
    procedure GastoMontoClick(Sender: TObject);
    procedure GastoSubtotalClick(Sender: TObject);
    procedure VentaCodigoClick(Sender: TObject);
    procedure VentaFechaClick(Sender: TObject);
    procedure VentaOperadorClick(Sender: TObject);
    procedure VentaSubtotalClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistorial: TFormHistorial;
  base_gastos, base_ventas:string; { Rutas de las bases de datos }
  posicion:integer; { Posicion del ultimo elemento en la base de datos }
  resultados:integer; { Resultados de la busqueda }
  i:integer; { Para recorrer los archivos }

  gasto:tipoGasto; { Para guardar el gasto que estoy leyendo }

  total_gastos, total_ventas:double; { Subtotal de ventas y gastos }
  subtotal:double; { Para calcular el subtotal }

  fecha_formateada, fecha2_formateada:string;
implementation

{$R *.dfm}

{ Mostrar gasto en la tabla }
Procedure MostrarGasto(nuevo_gasto:tipoGasto);
var
  tipo_gasto:string; { Filtrar el nombre del tipo de gasto }
begin
  FormHistorial.GastoDescripcion.Items.Add(nuevo_gasto.descripcion);

  { Establezo el nombre del tipo de gasto }
  case nuevo_gasto.codigo of
    1: tipo_gasto:='Materia Prima';
    2: tipo_gasto:='Servicios';
    3: tipo_gasto:='Gasto Corriente';
    4: tipo_gasto:='Sueldos';
    5: tipo_gasto:='Impuestos';
    6: tipo_gasto:='Otros';
  end;
  FormHistorial.GastoTipo.Items.Add(tipo_gasto);

  FormHistorial.GastoCantidad.Items.Add(IntToStr(nuevo_gasto.cantidad));
  FormHistorial.GastoMonto.Items.Add('$' + FloatToStr(nuevo_gasto.monto));

  { Calculo el subtotal }
  subtotal:=nuevo_gasto.cantidad * nuevo_gasto.monto;
  FormHistorial.GastoSubtotal.Items.Add('$' + FloatToStr(subtotal));
  
  { Agrego al subtotal }
  total_gastos:=total_gastos + subtotal;
end;

{ Mostrar venta en la tabla }
Procedure MostrarVenta(numero:integer;fecha:TDateTime;operador:string;subtotal:double);
begin
  FormHistorial.VentaCodigo.Items.Add(IntToStr(numero));
  FormHistorial.VentaFecha.Items.Add(DateTimeToStr(fecha));
  FormHistorial.VentaOperador.Items.Add(operador);
  FormHistorial.VentaSubtotal.Items.Add('$' + FloatToStr(subtotal));

  { Agrego al subtotal }
  total_ventas:=total_ventas + subtotal;
end;

{ Buscar gastos }
Procedure BuscarGastos(fecha:TDateTime);
begin
  { Busco el ultimo elemento en la base de datos }
  posicion:=LibGastos.UltimoElemento(LibGastos.RG);

  { Establezco los resultados de la busqueda como 0 }
  resultados:=0;

  { Establezo el subtotal de gastos a 0 }
  total_gastos:=0.00;

  { Formateo la fecha }
  fecha_formateada:=IntToStr(DayOf(fecha)) + '/' + IntToStr(MonthOf(fecha)) + '/' + IntToStr(YearOf(fecha));

  { Comienzo a recorrer la base de datos }
  for i:=0 to posicion do
  begin
    { Obtener el gasto i }
    LibGastos.ObtenerGasto(LibGastos.RG, i, gasto);

    { Formateo la fecha }
    fecha2_formateada:=IntToStr(DayOf(gasto.fecha)) + '/' + IntToStr(MonthOf(gasto.fecha)) + '/' + IntToStr(YearOf(gasto.fecha));

    { Comprobar si esta en la fecha que indique }
    if (fecha2_formateada = fecha_formateada) then
    begin
      { Sumo 1 resultado }
      resultados:=resultados + 1;

      { Lo muestro en las tablas }
      MostrarGasto(gasto);
    end;
  end;

  { Si no hubo resultados se lo digo al usuario }
  if resultados = 0 then
    showmessage('No hay gastos en esta fecha')
  else { Hay resultados, entonces muestro el total de gastos }
    FormHistorial.TotalGastos.Caption := '$' + FloatToStr(total_gastos);
end;

{ Buscar ventas }
Procedure BuscarVentas(fecha:TDateTime);
begin
  { Busco el ultimo elemento en la base de datos }
  posicion:=archivosVentas.UltimoElemento(archivosVentas.A);

  { Establezco los resultados de la busqueda como 0 }
  resultados:=0;

  { Establezo el subtotal de ventas a 0 }
  total_ventas:=0.00;

  { Formateo la fecha }
  fecha_formateada:=IntToStr(DayOf(fecha)) + '/' + IntToStr(MonthOf(fecha)) + '/' + IntToStr(YearOf(fecha));

  { Comienzo a recorrer la base de datos }
  for i:=0 to posicion do
  begin
    { Obtener la venta i }
    CapturarInfo(archivosVentas.A, i, registroVentas.B);

    { Formateo la fecha }
    fecha2_formateada:=IntToStr(DayOf(registroVentas.B.fechaSola)) + '/' + IntToStr(MonthOf(registroVentas.B.fechaSola)) + '/' + IntToStr(YearOf(registroVentas.B.fechaSola));

    { Comprobar si esta en la fecha que indique }
    if (fecha2_formateada = fecha_formateada) then
    begin
      { Sumo 1 resultado }
      resultados:=resultados + 1;

      { Lo muestro en las tablas }
      MostrarVenta(registroVentas.B.clave, registroVentas.B.time, registroVentas.B.operador, registroVentas.B.Total);
    end;
  end;

  { Si no hubo resultados se lo digo al usuario }
  if resultados = 0 then
    showmessage('No hay ventas en esta fecha')
  else { Hay resultados, entonces muestro el total de ventas }
    FormHistorial.TotalVentas.Caption := '$' + FloatToStr(total_ventas);
end;

{ Limpiar las tablas de los gastos }
Procedure LimpiarGastos();
begin
  FormHistorial.GastoDescripcion.Items.Clear;
  FormHistorial.GastoTipo.Items.Clear;
  FormHistorial.GastoCantidad.Items.Clear;
  FormHistorial.GastoMonto.Items.Clear;
  FormHistorial.GastoSubtotal.Items.Clear;
end;

{ Limpiar las tablas de las ventas }
Procedure LimpiarVentas();
begin
  FormHistorial.VentaCodigo.Items.Clear;
  FormHistorial.VentaFecha.Items.Clear;
  FormHistorial.VentaOperador.Items.Clear;
  FormHistorial.VentaSubtotal.Items.Clear;
end;

{ Codigo para seleccionar todas las columnas de gatos
sacada del formulario de gastos}
Procedure SeleccionarGasto(item:integer);
begin
  FormHistorial.GastoDescripcion.Selected[item]:= True;
  FormHistorial.GastoTipo.Selected[item]:= True;
  FormHistorial.GastoCantidad.Selected[item]:= True;
  FormHistorial.GastoMonto.Selected[item]:= True;
  FormHistorial.GastoSubtotal.Selected[item]:= True;
end;

{ Codigo para seleccionar todas las columnas de ventas}
Procedure SeleccionarVenta(item:integer);
begin
  FormHistorial.VentaCodigo.Selected[item]:= True;
  FormHistorial.VentaFecha.Selected[item]:= True;
  FormHistorial.VentaOperador.Selected[item]:= True;
  FormHistorial.VentaSubtotal.Selected[item]:= True;
end;

procedure TFormHistorial.FormCreate(Sender: TObject);
begin
  { Voy a indicar las rutas de los archivos }
  base_gastos:='Db\gastos\';
  base_ventas:='Db\ventas\';

  { Abro los archivos}
  LibGastos.ActivarGastos(LibGastos.RG, base_gastos, 'dbGastos.dat');
  archivosVentas.Activar(archivosVentas.A, base_ventas, 'dbVentas.dat');

  { Cambio las fechas }
  FechaGastos.Date := Date;
end;

procedure TFormHistorial.Button1Click(Sender: TObject);
begin
  { Oculto la caja de ventas y muestro la de gastos }
  GroupVentas.Visible := False;
  GroupGastos.Visible := True;
end;

procedure TFormHistorial.Button2Click(Sender: TObject);
begin
  {Oculto la caja de gastos y muestro la de ventas }
  GroupGastos.Visible := False;
  GroupVentas.Visible := True;
end;

procedure TFormHistorial.Button3Click(Sender: TObject);
begin
  { Limpio los gastos actuales }
  LimpiarGastos();
  
  { Buscar gastos }
  BuscarGastos(FechaGastos.Date);
end;

procedure TFormHistorial.GastoDescripcionClick(Sender: TObject);
begin
  if GastoDescripcion.ItemIndex > -1 then
      SeleccionarGasto(GastoDescripcion.ItemIndex);
end;

procedure TFormHistorial.GastoTipoClick(Sender: TObject);
begin
  if GastoTipo.ItemIndex > -1 then
      SeleccionarGasto(GastoTipo.ItemIndex);
end;

procedure TFormHistorial.GastoCantidadClick(Sender: TObject);
begin
  if GastoCantidad.ItemIndex > -1 then
      SeleccionarGasto(GastoCantidad.ItemIndex);
end;

procedure TFormHistorial.GastoMontoClick(Sender: TObject);
begin
  if GastoMonto.ItemIndex > -1 then
      SeleccionarGasto(GastoMonto.ItemIndex);
end;

procedure TFormHistorial.GastoSubtotalClick(Sender: TObject);
begin
  if GastoSubtotal.ItemIndex > -1 then
      SeleccionarGasto(GastoSubtotal.ItemIndex);
end;

procedure TFormHistorial.VentaCodigoClick(Sender: TObject);
begin
  if VentaCodigo.ItemIndex > -1 then
      SeleccionarVenta(VentaCodigo.ItemIndex);
end;

procedure TFormHistorial.VentaFechaClick(Sender: TObject);
begin
  if VentaFecha.ItemIndex > -1 then
      SeleccionarVenta(VentaFecha.ItemIndex);
end;

procedure TFormHistorial.VentaOperadorClick(Sender: TObject);
begin
  if VentaOperador.ItemIndex > -1 then
      SeleccionarVenta(VentaOperador.ItemIndex);
end;

procedure TFormHistorial.VentaSubtotalClick(Sender: TObject);
begin
  if VentaSubtotal.ItemIndex > -1 then
      SeleccionarVenta(VentaSubtotal.ItemIndex);
end;

procedure TFormHistorial.Button4Click(Sender: TObject);
begin

   archivosVentas.Activar(archivosVentas.A, base_ventas, 'dbVentas.dat');
  { Limpio las ventas actuales }
  LimpiarVentas();

  { Buscar ventas }
  BuscarVentas(FechaVentas.Date);
  ARCHIVOSVENTAS.CerrarArchivo(archivosVentas.A);
end;

end.
