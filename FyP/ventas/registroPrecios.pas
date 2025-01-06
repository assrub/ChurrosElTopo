unit registroPrecios;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type

  TChurros=record
                U_Simple:Real;
                D_Simple:Real;
                U_Tradicional:Real;
                D_Tradicional:Real;
                U_Gourmet:Real;
                D_Gourmet:Real;
                U_Salados:Real;
                D_Slados:Real;
                U_Baniados:Real;
                D_Baniados:Real;
                end;

  TCubanitos=record
                U_Tradicional:Real; 
                D_Tradicional:Real;
                U_Gourmet:Real;
                D_Gourmet:Real; 
                U_BaniadoT:Real;
                D_BaniadoT:Real;
                U_BaniadoG:Real;
                D_BaniadoG:Real;
                end;

  TDonas=record
                U_Simple:Real;
                D_Simple:Real;
                U_Tradicional:Real;
                D_Tradicional:Real;
                U_B_Simple:Real;
                D_B_Simple:Real;
                U_B_Decorado:Real;
                D_B_Decorado:Real;
                U_B_Especial:Real;
                D_B_Especial:Real;

                end;

  TtortaFritas=record
                U_Simple:Real;
                D_Simple:Real;
               end;

  TChipa=record
                U_Simple:Real;
                end;

  TPastelitos=record
                U_chico:Real;
                D_chico:Real;
                U_Grande:Real;
                D_Grande:Real;
               end;

   TBerlinesas=record
                U_Simple:Real;
                D_Simple:Real;
                U_Tradicional:Real;
                D_Tradicional:Real;
                U_Gourmet:Real;
                D_Gourmet:Real;
                U_Salados:Real;
                D_Slados:Real;
                U_Baniados:Real;
                D_Baniados:Real;
                end;

   Tprecio=record
                clave:integer;
                borrado:boolean;
                Churros:Tchurros;
                cubanitos:Tcubanitos;
                Donas:Tdonas;
                tortafritas:TtortaFritas;
                chipa:Tchipa;
                Berlinesas:Tberlinesas;
                Pastelitos:Tpastelitos;
   end;

var
   P:Tprecio;
   
implementation
end.
