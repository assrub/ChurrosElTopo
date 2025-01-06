object Form4: TForm4
  Left = 790
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'LISTA DE USUARIOS'
  ClientHeight = 399
  ClientWidth = 658
  Color = clDefault
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 625
    Height = 369
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 8
      Top = 8
      Width = 609
      Height = 353
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      ScrollBars = ssVertical
      TabOrder = 0
      ColWidths = (
        116
        188
        147
        150)
    end
  end
end
