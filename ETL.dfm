object FrmIndex: TFrmIndex
  Left = 0
  Top = 0
  Caption = 'Steban'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 85
    Height = 13
    Caption = 'Arquivo de leitura'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 87
    Height = 13
    Caption = 'Arquivo de escrita'
  end
  object LabelAccess: TLabel
    Left = 112
    Top = 112
    Width = 58
    Height = 13
    Caption = 'LabelAccess'
  end
  object edtLeitura: TEdit
    Left = 112
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Z:\arquivo.csv'
  end
  object edtEscrita: TEdit
    Left = 112
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnInput: TButton
    Left = 248
    Top = 43
    Width = 75
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = btnInputClick
  end
  object BtnOutput: TButton
    Left = 248
    Top = 70
    Width = 75
    Height = 25
    Caption = '...'
    TabOrder = 3
  end
  object btnProcessar: TButton
    Left = 8
    Top = 139
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 4
    OnClick = btnProcessarClick
  end
end
