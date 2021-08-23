object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 159
  ClientWidth = 374
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
    Left = 168
    Top = 8
    Width = 172
    Height = 40
    Caption = 'Ing. Rodolfo Jimenez B.'#13#10'Cliente DCOM (Frontend )'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 113
    Height = 25
    Caption = 'Administrar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 9
    Width = 113
    Height = 105
    Caption = ' Opciones '
    Items.Strings = (
      'Productos'
      'Clientes'
      'Facturas')
    TabOrder = 1
  end
end
