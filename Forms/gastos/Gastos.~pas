unit Gastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LibGastos, Buttons, ComCtrls, DateUtils;
  
type
  TFrmGastos = class(TForm)
    cntGastos: TGroupBox;
    lstFecha: TListBox;
    cntBuscarGasto: TGroupBox;
    txtBuscar: TEdit;
    btnBuscar: TBitBtn;
    btnNuevoGasto: TBitBtn;
    btnBuscarGasto: TBitBtn;
    btnListarGastos: TBitBtn;
    cntNuevoGasto: TGroupBox;
    txtGastoNombre: TEdit;
    Label1: TLabel;
    dateTimePickerGasto: TDateTimePicker;
    txtMontoGasto: TEdit;
    lblImporte: TLabel;
    lblFecha: TLabel;
    txtCantidadGasto: TEdit;
    lblCantidad: TLabel;
    btnGuardarGasto: TButton;
    txtCodigoGasto: TEdit;
    cntTipoGasto: TGroupBox;
    btnMateriaPrima: TButton;
    btnGastoCorriente: TButton;
    btnServicios: TButton;
    btnSueldos: TButton;
    btnImpuestos: TButton;
    btnOtros: TButton;
    txtCancelarCarga: TButton;
    lstConcepto: TListBox;
    lstCantidad: TListBox;
    lstMonto: TListBox;
    lstSubtotal: TListBox;
    lstTipo: TListBox;
    lblColumnFecha: TLabel;
    lblColumnConcepto: TLabel;
    lblColumnCantidad: TLabel;
    lblColumnMonto: TLabel;
    lblColumnSubtotal: TLabel;
    lblColumnTipo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarGastoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNuevoGastoClick(Sender: TObject);
    procedure btnGuardarGastoClick(Sender: TObject);
    procedure btnMateriaPrimaClick(Sender: TObject);
    procedure btnServiciosClick(Sender: TObject);
    procedure btnGastoCorrienteClick(Sender: TObject);
    procedure btnSueldosClick(Sender: TObject);
    procedure btnImpuestosClick(Sender: TObject);
    procedure btnOtrosClick(Sender: TObject);
    procedure txtCancelarCargaClick(Sender: TObject);
    procedure lstFechaClick(Sender: TObject);
    procedure lstConceptoClick(Sender: TObject);
    procedure lstCantidadClick(Sender: TObject);
    procedure lstMontoClick(Sender: TObject);
    procedure lstSubtotalClick(Sender: TObject);
    procedure lstTipoClick(Sender: TObject);
    procedure btnListarGastosClick(Sender: TObject);
    procedure txtMontoGastoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCantidadGastoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGastos: TFrmGastos;
  ruta_gastos: string;
  current_container: string; // Estoy mostrando algun groupbox? Le digo container al groupbox
  
  nuevoGasto:tipoGasto;
  nuevoGastoCodigo:integer;

  currentPosicion:integer;

  gasto:tipoGasto;

  i:integer; // Puntero
  resultado_busqueda:Integer;

  busquedaGastos:tipoFiltrado;
implementation

{$R *.dfm}

{**** IMPLEMENTACIONES ****}
Procedure AbrirContainer(container:string);
begin
  // Hay algun container abierto?
  if current_container <> '' then
    begin
      { Existe una limitacion en Pascal de no poder usar case of con strings.
      Voy a tener que hacer un if anidado para saber que container cerrar }

      // Busqueda de gasto
      if (current_container = 'buscar') then
        Gastos.FrmGastos.cntBuscarGasto.Visible := false;

      // Seleccionar tipo de gasto
      if (current_container = 'tipo') then
        Gastos.FrmGastos.cntTipoGasto.Visible := false;

      // Cargar nuevo gasto
      if (current_container = 'nuevo') then
        Gastos.FrmGastos.cntNuevoGasto.Visible := false;
    end;

    { Si container esta vacio simplemente es porque queria cerrar el container
    que estuviera abierto }
    if container = '' then
      current_container := ''
    else
      begin
        // Abrir el nuevo container
        current_container := container;

        { Nuevamente la limitacion de Pascal con el case of de strings. }

        // Busqueda de gasto
        if (current_container = 'buscar') then
          begin
            // Abrir container
            Gastos.FrmGastos.cntBuscarGasto.Visible := true;

            // Focus en txtBuscar
            Gastos.FrmGastos.txtBuscar.SetFocus;
          end;

        // Cargar nuevo gasto
        if (current_container = 'nuevo') then
          begin
            // Abrir container
            Gastos.FrmGastos.cntNuevoGasto.Visible := true;
          end;

        // Seleccionar tipo de gasto
        if (current_container = 'tipo') then
          begin
            // Abrir container
            Gastos.FrmGastos.cntTipoGasto.Visible := true;
          end;
      end;
end;

Function ObtenerNombreTipoGasto(tipo:integer):String;
begin
  case tipo of
    1: ObtenerNombreTipoGasto:='Materia Prima';
    2: ObtenerNombreTipoGasto:='Servicios';
    3: ObtenerNombreTipoGasto:='Gasto Corriente';
    4: ObtenerNombreTipoGasto:='Sueldos';
    5: ObtenerNombreTipoGasto:='Impuestos';
    6: ObtenerNombreTipoGasto:='Otros';
  end;
end;

Procedure LimpiarListbox();
begin
  // Limpiamos el listbox
  Gastos.FrmGastos.lstFecha.Items.Clear;
  Gastos.FrmGastos.lstConcepto.Items.Clear;
  Gastos.FrmGastos.lstCantidad.Items.Clear;
  Gastos.FrmGastos.lstMonto.Items.Clear;
  Gastos.FrmGastos.lstSubtotal.Items.Clear;
  Gastos.FrmGastos.lstTipo.Items.Clear;
end;

// Carga de gastos
Procedure CargarGastos(Gasto:tipoGasto);
var gasto_monto,gasto_subtotal,gasto_fecha,gasto_tipo:String;
begin
  // Establezo la fecha del gasto con su correspondiente espaciado
  gasto_fecha:=IntToStr(DayOf(Gasto.fecha)) + '/' + IntToStr(MonthOf(Gasto.fecha)) + '/' + IntToStr(YearOf(Gasto.fecha));

  // Establezo el monto del gasto con su correspondiente espaciado
  gasto_monto:='$' + FloatToStr(Gasto.monto);

  // Establezco el subtotal de este gasto
  gasto_subtotal:='$' + FloatToStr(Gasto.monto * Gasto.cantidad);

  // Establezo el tipo de gasto
  gasto_tipo:=ObtenerNombreTipoGasto(Gasto.codigo);

  Gastos.FrmGastos.lstFecha.Items.Add(gasto_fecha);
  Gastos.FrmGastos.lstConcepto.Items.Add(gasto.descripcion);
  Gastos.FrmGastos.lstCantidad.Items.Add(IntToStr(Gasto.cantidad));
  Gastos.FrmGastos.lstMonto.Items.Add(gasto_monto);
  Gastos.FrmGastos.lstSubtotal.Items.Add(gasto_subtotal);
  Gastos.FrmGastos.lstTipo.Items.Add(gasto_tipo);
end;

Procedure BuscarGastoPorDescripcion(descripcion:String);
begin
  // Establezco el ultimo elemento
  currentPosicion:=LibGastos.UltimoElemento(LibGastos.RG);

  // Reinicio contador
  resultado_busqueda:=0;

  for i:=0 to currentPosicion do
    begin
      // Quiero obtener los gastos de este mes
      LibGastos.ObtenerGasto(LibGastos.RG, i, gasto);

      if (descripcion = '') or (descripcion = ' ') or (gasto.descripcion = descripcion) then
        begin
          resultado_busqueda:=resultado_busqueda + 1;
          CargarGastos(gasto);
        end;
    end;
end;

Procedure BuscarGastoPorFecha(fecha:TDateTime);
begin
  // Establezco el ultimo elemento
  currentPosicion:=LibGastos.UltimoElemento(LibGastos.RG);

  // Reinicio contador
  resultado_busqueda:=0;

  for i:=0 to currentPosicion do
    begin
      // Quiero obtener los gastos de este mes
      LibGastos.ObtenerGasto(LibGastos.RG, i, gasto);

      if (gasto.fecha = fecha) then
        begin
          resultado_busqueda:=resultado_busqueda + 1;
          CargarGastos(gasto);
        end;
    end;
end;

Procedure SeleccionarItem(item:integer);
begin
  Gastos.FrmGastos.lstFecha.Selected[item]:= True;
  Gastos.FrmGastos.lstConcepto.Selected[item]:= True;
  Gastos.FrmGastos.lstCantidad.Selected[item]:= True;
  Gastos.FrmGastos.lstMonto.Selected[item]:= True;
  Gastos.FrmGastos.lstSubtotal.Selected[item]:= True;
  Gastos.FrmGastos.lstTipo.Selected[item]:= True;
end;

Procedure LimpiarCarga();
begin
    Gastos.FrmGastos.txtGastoNombre.Text := '';
    Gastos.FrmGastos.txtMontoGasto.Text := '';
    Gastos.FrmGastos.txtCantidadGasto.Text := '1';
    Gastos.FrmGastos.dateTimePickerGasto.Date := Date;
end;

procedure TFrmGastos.FormCreate(Sender: TObject);
var espaciado:String;
begin
  // Definir la ruta del archivo
  ruta_gastos:='Db\gastos\';
  LibGastos.ActivarGastos(LibGastos.RG, ruta_gastos, 'dbGastos.dat');

  // Actualizo la fecha actual en el date time picker
  dateTimePickerGasto.Date := Date;

  // Limpiar listbox
  LimpiarListbox();

  // Cargamos los gastos
  BuscarGastoPorFecha(dateTimePickerGasto.Date);
end;

// Compruebo si los campos no estan vacios, si estan todos completos retorno true
Function ComprobarCargarGasto(nombre,monto,cantidad:String):boolean;
begin
  // Por el momento el return es verdadero, y sera anulado si algun campo esta vacio
  ComprobarCargarGasto:=true;
  
  if (nombre = '') or (nombre = ' ') then
    ComprobarCargarGasto:=false;

  if (monto = '') or (monto = ' ') then
    ComprobarCargarGasto:=false;

  if (cantidad = '') or (cantidad = ' ') then
    ComprobarCargarGasto:=false;
end;

Procedure AbrirCargaGasto(codigo:integer; descripcion:String);
begin
  // Establezco el codigo del tipo de gasto que quiero cargar
  Gastos.FrmGastos.txtCodigoGasto.Text := IntToStr(codigo);

  // Cambiar el nombre del container
  Gastos.FrmGastos.cntNuevoGasto.Caption := 'Cargar nuevo gasto: ' + descripcion;

  // Abro el container de carga
  AbrirContainer('nuevo');

  // Establezo el focus
  Gastos.FrmGastos.txtGastoNombre.SetFocus;
end;

procedure TFrmGastos.btnBuscarGastoClick(Sender: TObject);
begin
  // Visualizar container de busqueda
  AbrirContainer('buscar');
end;

procedure TFrmGastos.btnBuscarClick(Sender: TObject);
var
  qnty_gastos:Integer;
begin
  // Buscar gasto
  // Comprobar que el campo de texto no este vacio
  if (txtBuscar.Text = '') or (txtBuscar.Text = ' ') then
    begin
      showmessage('Ingrese un concepto para buscar');
    end
  else
    begin
      // Limpio listbox
      LimpiarListbox();

      // Obtengo los gastos con el criterio de busqueda
      BuscarGastoPorDescripcion(txtBuscar.Text);

      // Obtuve algun resultado?
      if resultado_busqueda = 0 then
        begin
          showmessage('No existen gastos con el concepto indicado');

          // Limpiamos el campo de texto
          txtBuscar.Text := '';
          txtBuscar.setFocus;

          // Re-establezco los items de la fecha actual
          BuscarGastoPorFecha(dateTimePickerGasto.Date);
        end;
    end;
end;

procedure TFrmGastos.btnNuevoGastoClick(Sender: TObject);
begin
  // Abrir container de carga de nuevo gasto
  AbrirContainer('tipo');
end;

procedure TFrmGastos.btnGuardarGastoClick(Sender: TObject);
begin
  // Comprobar si los campos no estan vacios
  if (ComprobarCargarGasto(txtGastoNombre.Text, txtMontoGasto.Text, txtCantidadGasto.Text)) then
    begin
      // Establezo el nuevo gasto
      nuevoGasto.codigo := StrToInt(txtCodigoGasto.Text);
      nuevoGasto.descripcion := txtGastoNombre.Text;
      nuevoGasto.monto := StrToFloat(txtMontoGasto.Text);
      nuevoGasto.fecha := dateTimePickerGasto.Date;
      nuevoGasto.cantidad := StrToInt(txtCantidadGasto.Text);

      // Establezco el ultimo elemento
      currentPosicion:=LibGastos.UltimoElemento(LibGastos.RG);

      //LibGastos.CargarGasto(LibGastos.RG, currentPosicion, nuevoGasto);
      seek(LibGastos.RG, filesize(LibGastos.RG));
      write(LibGastos.RG,nuevoGasto);

      // Limpiar
      LimpiarCarga();

      // Limpiar listbox
      LimpiarListbox();

      // Re-load gastos
      BuscarGastoPorFecha(dateTimePickerGasto.Date);

      // Abrir container de carga de nuevo gasto
      AbrirContainer('tipo');

      // Ok
      showmessage('Gasto cargado correctamente');
    end
  else
    showmessage('Complete todos los campos para guardar el gasto');
end;

procedure TFrmGastos.btnMateriaPrimaClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(1, 'Materia prima');
end;

procedure TFrmGastos.btnServiciosClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(2, 'Servicios');
end;

procedure TFrmGastos.btnGastoCorrienteClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(3, 'Gasto corriente');
end;

procedure TFrmGastos.btnSueldosClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(4, 'Sueldos');
end;

procedure TFrmGastos.btnImpuestosClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(5, 'Impuestos');
end;

procedure TFrmGastos.btnOtrosClick(Sender: TObject);
begin
  // Abrir la carga de gastos
  AbrirCargaGasto(6, 'Otro tipo de gasto');
end;

procedure TFrmGastos.txtCancelarCargaClick(Sender: TObject);
begin
  // Simplemente vuelvo a abrir el container de tipo
  AbrirContainer('tipo');
end;

procedure TFrmGastos.lstFechaClick(Sender: TObject);
begin
   if lstFecha.ItemIndex > -1 then
      SeleccionarItem(lstFecha.ItemIndex);
end;

procedure TFrmGastos.lstConceptoClick(Sender: TObject);
begin
  if lstConcepto.ItemIndex > -1 then
      SeleccionarItem(lstConcepto.ItemIndex);
end;

procedure TFrmGastos.lstCantidadClick(Sender: TObject);
begin
  if lstCantidad.ItemIndex > -1 then
      SeleccionarItem(lstCantidad.ItemIndex);
end;

procedure TFrmGastos.lstMontoClick(Sender: TObject);
begin
  if lstMonto.ItemIndex > -1 then
      SeleccionarItem(lstMonto.ItemIndex);
end;

procedure TFrmGastos.lstSubtotalClick(Sender: TObject);
begin
  if lstSubtotal.ItemIndex > -1 then
      SeleccionarItem(lstSubtotal.ItemIndex);
end;

procedure TFrmGastos.lstTipoClick(Sender: TObject);
begin
  if lstTipo.ItemIndex > -1 then
      SeleccionarItem(lstTipo.ItemIndex);
end;

procedure TFrmGastos.btnListarGastosClick(Sender: TObject);
begin
  LimpiarListbox();
  BuscarGastoPorDescripcion('');
end;

procedure TFrmGastos.txtMontoGastoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9, #44, #46]) then Key:=#0;
end;

procedure TFrmGastos.txtCantidadGastoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8 ,#9]) then Key:=#0;
end;

end.
