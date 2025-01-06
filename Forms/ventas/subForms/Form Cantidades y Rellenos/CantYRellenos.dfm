object Form8: TForm8
  Left = 416
  Top = 160
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 397
  ClientWidth = 419
  Color = clBlack
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
    Width = 393
    Height = 73
    Color = clBlack
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 91
      Height = 20
      Caption = 'CANTIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 160
      Top = 16
      Width = 193
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
  end
  object Panel2: TPanel
    Left = 16
    Top = 96
    Width = 393
    Height = 73
    Color = clBlack
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 83
      Height = 20
      Caption = 'RELLENO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 160
      Top = 24
      Width = 193
      Height = 26
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 20
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 16
    Top = 176
    Width = 393
    Height = 73
    Color = clBlack
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 75
      Height = 20
      Caption = 'BA'#209'ADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 160
      Top = 24
      Width = 193
      Height = 26
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 20
      ParentFont = False
      TabOrder = 0
      OnEnter = ComboBox2Enter
    end
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 272
    Width = 369
    Height = 49
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 336
    Width = 369
    Height = 49
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
