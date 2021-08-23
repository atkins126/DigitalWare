object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Calcular Salario'
  ClientHeight = 76
  ClientWidth = 390
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
    Left = 24
    Top = 12
    Width = 107
    Height = 13
    Caption = 'Nombre del empleado:'
  end
  object Label2: TLabel
    Left = 24
    Top = 42
    Width = 89
    Height = 13
    Caption = 'Horas Trabajadas:'
  end
  object Button1: TButton
    Left = 232
    Top = 36
    Width = 137
    Height = 25
    Caption = 'calcular salario'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtNombre: TEdit
    Left = 152
    Top = 8
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object edtHoras: TSpinEdit
    Left = 152
    Top = 37
    Width = 57
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
end
