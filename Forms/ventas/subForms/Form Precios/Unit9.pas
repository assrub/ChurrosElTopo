unit Unit9;

interface

uses 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, unit1, registroVentas, registroPrecios,
  archivosPrecios, jpeg;

type
  TForm9 = class(TForm)
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Panel3: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit12: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Panel4: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Edit30: TEdit;
    Edit29: TEdit;
    Edit31: TEdit;
    Panel5: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Edit22: TEdit;
    Edit21: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Panel6: TPanel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Edit40: TEdit;
    Edit39: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Panel38: TPanel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label118: TLabel;
    Label120: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Label26: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Label51: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Precios: TImage;
    SpeedButton2: TSpeedButton;
    Image2: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure Edit21KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22KeyPress(Sender: TObject; var Key: Char);
    procedure Edit23KeyPress(Sender: TObject; var Key: Char);
    procedure Edit24KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit27KeyPress(Sender: TObject; var Key: Char);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure Edit20KeyPress(Sender: TObject; var Key: Char);
    procedure Edit29KeyPress(Sender: TObject; var Key: Char);
    procedure Edit30KeyPress(Sender: TObject; var Key: Char);
    procedure Edit31KeyPress(Sender: TObject; var Key: Char);
    procedure Edit33KeyPress(Sender: TObject; var Key: Char);
    procedure Edit34KeyPress(Sender: TObject; var Key: Char);
    procedure Edit35KeyPress(Sender: TObject; var Key: Char);
    procedure Edit36KeyPress(Sender: TObject; var Key: Char);
    procedure Edit37KeyPress(Sender: TObject; var Key: Char);
    procedure Edit38KeyPress(Sender: TObject; var Key: Char);
    procedure Edit39KeyPress(Sender: TObject; var Key: Char);
    procedure Edit40KeyPress(Sender: TObject; var Key: Char);
    procedure Edit41KeyPress(Sender: TObject; var Key: Char);
    procedure Edit42KeyPress(Sender: TObject; var Key: Char);
    procedure Edit43KeyPress(Sender: TObject; var Key: Char);
    procedure Edit44KeyPress(Sender: TObject; var Key: Char);
    procedure Edit45KeyPress(Sender: TObject; var Key: Char);
    procedure Edit46KeyPress(Sender: TObject; var Key: Char);
    procedure Edit47KeyPress(Sender: TObject; var Key: Char);
    procedure Edit48KeyPress(Sender: TObject; var Key: Char);
  


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure Guard_Prec_Prod();
begin
  //Guardamosx
  seek(archivosPrecios.A, 0);
  write(archivosPrecios.A, P);
end;


procedure TForm9.FormCreate(Sender: TObject);
var
pos:integer;
begin

 AbrirArchivo(archivosPrecios.A);

 pos:= archivosPrecios.BuscarInt(archivosPrecios.A, 1);

   { messageDlg(intToStr(pos), mtConfirmation,[mbOk],0);}

    if pos <> -1 then
    begin
      //Abro el archivo
      archivosPrecios.CapturarInfo(archivosPrecios.A,pos,P);

      //CARGAMOS LOS EDITS
      edit1.text:= floatToStr(P.Churros.U_Simple);
      edit2.text:= floatToStr(P.Churros.D_Simple);
      edit3.text:= floatToStr(P.Churros.U_Tradicional);
      edit4.text:= floatToStr(P.Churros.D_Tradicional);
      edit5.text:= floatToStr(P.Churros.U_Gourmet);
      edit6.text:= floatToStr(P.churros.D_Gourmet);
      edit7.text:= floatToStr(P.Churros.U_Salados);
      edit8.text:= floatToStr(P.churros.D_Slados);
      edit9.text:= floatToStr(P.churros.U_Baniados);
      edit10.text:= floatToStr(P.churros.D_Baniados);

      edit11.text:= floatToStr(p.cubanitos.U_Tradicional);
      edit12.text:= floatToStr(p.cubanitos.D_Tradicional);
      edit13.text:= floatToStr(p.cubanitos.U_Gourmet);
      edit14.text:= floatToStr(p.cubanitos.D_Gourmet);
      edit15.text:= floatToStr(p.cubanitos.U_BaniadoT);
      edit16.text:= floatToStr(p.cubanitos.D_BaniadoT);
      edit17.text:= floatToStr(p.cubanitos.U_BaniadoG);
      edit18.text:= floatToStr(p.cubanitos.D_BaniadoG);

      edit21.text:= floatToStr(P.Donas.U_Simple);
      edit22.text:= floatToStr(P.Donas.D_Simple);
      edit23.text:= floatToStr(P.Donas.U_Tradicional);
      edit24.text:= floatToStr(P.Donas.D_Tradicional);
      edit25.text:= floatToStr(P.Donas.U_B_Simple);
      edit26.text:= floatToStr(P.Donas.D_B_Simple);
      edit27.text:= floatToStr(P.Donas.U_B_Decorado);
      edit28.text:= floatToStr(P.Donas.D_B_Decorado);
      edit19.text:= floatToStr(P.Donas.U_B_Especial);  
      edit20.text:= floatToStr(P.Donas.D_B_Especial);


      edit29.text:= floatToStr(P.tortafritas.U_simple);
      edit30.text:= floatToStr(P.tortafritas.D_Simple);

      edit31.text:= floatToStr(P.chipa.U_simple);

     // edit33.text:= floatToStr(P.pastelitos.U_simple);
     // edit34.text:= floatToStr(P.pastelitos.D_simple);
      edit35.text:= floatToStr(P.pastelitos.U_chico);
      edit36.text:= floatToStr(P.pastelitos.D_chico);
      edit37.text:= floatToStr(P.pastelitos.U_grande);
      edit38.text:= floatToStr(P.pastelitos.D_grande);

      edit39.text:= floatToStr(P.Berlinesas.U_Simple);
      edit40.text:= floatToStr(P.Berlinesas.D_Simple);
      edit41.text:= floatToStr(P.Berlinesas.U_Tradicional);
      edit42.text:= floatToStr(P.Berlinesas.D_Tradicional);
      edit43.text:= floatToStr(P.Berlinesas.U_Gourmet);
      edit44.text:= floatToStr(P.Berlinesas.D_Gourmet);
      edit45.text:= floatToStr(P.Berlinesas.U_Salados);
      edit46.text:= floatToStr(P.Berlinesas.D_Slados);
      edit47.text:= floatToStr(P.Berlinesas.U_Baniados);
      edit48.text:= floatToStr(P.Berlinesas.D_Baniados);
    end;

   archivosPrecios.CerrarArchivo(archivosPrecios.A);
end;
procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
P.clave:= 1;

P.Churros.U_Simple:=strtofloat(edit1.text);
P.Churros.D_Simple:=strtofloat(edit2.text);
P.Churros.U_Tradicional:=strtofloat(edit3.text);
P.Churros.D_Tradicional:=strtofloat(edit4.text);
P.Churros.U_Gourmet:=strtofloat(edit5.text);
P.churros.D_Gourmet:=strtofloat(edit6.text);
P.Churros.U_Salados:=strtofloat(edit7.text);
P.churros.D_Slados:=strtofloat(edit8.text);
P.churros.U_Baniados:=strtofloat(edit9.text);
P.churros.D_Baniados:=strtofloat(edit10.text);

p.cubanitos.U_Tradicional:=strtofloat(edit11.text);
p.cubanitos.D_Tradicional:=strtofloat(edit12.text);
p.cubanitos.U_Gourmet:=strtofloat(edit13.text);
p.cubanitos.D_Gourmet:=strtofloat(edit14.text);
p.cubanitos.U_BaniadoT:=strtofloat(edit15.text);
p.cubanitos.D_BaniadoT:=strtofloat(edit16.text);
p.cubanitos.U_BaniadoG:=strtofloat(edit17.text);
p.cubanitos.D_BaniadoG:=strtofloat(edit18.text);

P.Donas.U_Simple:=strtofloat(edit21.text);
P.Donas.D_Simple:=strtofloat(edit22.text);
P.Donas.U_Tradicional:=strtofloat(edit23.text);
P.Donas.D_Tradicional:=strtofloat(edit24.text);
P.Donas.U_B_Simple:=strtofloat(edit25.text);
P.Donas.D_B_Simple:=strtofloat(edit26.text);
P.Donas.U_B_Decorado:=strtofloat(edit27.text);
P.Donas.D_B_Decorado:=strtofloat(edit28.text);
P.Donas.U_B_Especial:=strtofloat(edit19.text);
P.Donas.D_B_Especial:=strtofloat(edit20.text);


P.tortafritas.U_simple:=strtofloat(edit29.text);
P.tortafritas.D_Simple:=strtofloat(edit30.text);

P.chipa.U_simple:=strtofloat(edit31.text);

//P.pastelitos.U_simple:=strtofloat(edit33.text);
//P.pastelitos.D_simple:=strtofloat(edit34.text);
P.pastelitos.U_chico:=strtofloat(edit35.text);
P.pastelitos.D_chico:=strtofloat(edit36.text);
P.pastelitos.U_grande:=strtofloat(edit37.text);
P.pastelitos.D_grande:=strtofloat(edit38.text);

P.Berlinesas.U_Simple:=strtofloat(edit39.text);
P.Berlinesas.D_Simple:=strtofloat(edit40.text);
P.Berlinesas.U_Tradicional:=strtofloat(edit41.text);
P.Berlinesas.D_Tradicional:=strtofloat(edit42.text);
P.Berlinesas.U_Gourmet:=strtofloat(edit43.text);
P.Berlinesas.D_Gourmet:=strtofloat(edit44.text);
P.Berlinesas.U_Salados:=strtofloat(edit45.text);
P.Berlinesas.D_Slados:=strtofloat(edit46.text);
P.Berlinesas.U_Baniados:=strtofloat(edit47.text);
P.Berlinesas.D_Baniados:=strtofloat(edit48.text);


      archivosPrecios.AbrirArchivo(archivosPrecios.A);

   Guard_Prec_Prod;

   archivosPrecios.CerrarArchivo(archivosPrecios.A);
   close;
end;

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
form9.Close;
end;



procedure TForm9.Image3Click(Sender: TObject);
begin
showmessage('Creado por: Matias Rain, Ezequiel Tiznado y Ruben Moreno');
end;

procedure TForm9.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;


procedure TForm9.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit18KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit21KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit22KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit23KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit24KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit27KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit20KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit29KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit30KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit31KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit33KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit34KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit35KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit36KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit37KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit38KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit39KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit40KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit41KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit42KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit43KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit44KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit45KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit46KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit47KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

procedure TForm9.Edit48KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

end.
