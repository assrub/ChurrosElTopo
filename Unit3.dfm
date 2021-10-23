object Form3: TForm3
  Left = 406
  Top = 232
  Width = 619
  Height = 375
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 144
    Top = 32
    Width = 337
    Height = 273
    Color = clRed
    ParentColor = False
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 88
      Width = 78
      Height = 24
      Caption = 'USUARIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 136
      Width = 120
      Height = 24
      Caption = 'CONTRASE'#209'A'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 64
      Top = 16
      Width = 234
      Height = 24
      Caption = 'Sistema de carga de Stock'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 152
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 152
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 128
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Entrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
