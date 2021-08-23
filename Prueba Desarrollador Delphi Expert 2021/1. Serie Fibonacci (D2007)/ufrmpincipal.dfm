object frmpincipal: Tfrmpincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Generador serie fibonacci'
  ClientHeight = 362
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 345
    Caption = '1. Serie Fibonacci. (se recomienda manejo de recursividad).'
    TabOrder = 0
    object Label1: TLabel
      Left = 154
      Top = 27
      Width = 148
      Height = 13
      Caption = 'Elementos de la serie Fibonacci'
    end
    object SpinEdit1: TSpinEdit
      Left = 100
      Top = 24
      Width = 48
      Height = 22
      MaxValue = 20
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object Memo1: TMemo
      Left = 19
      Top = 55
      Width = 283
      Height = 274
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object Button1: TButton
      Left = 19
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Generar '
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
