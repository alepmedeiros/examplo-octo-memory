object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 239
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 3
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Object'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 3
    Top = 34
    Width = 386
    Height = 201
    TabOrder = 1
  end
  object Button2: TButton
    Left = 84
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Builder'
    TabOrder = 2
    OnClick = Button2Click
  end
end
