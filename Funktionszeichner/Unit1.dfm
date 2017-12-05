object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 500
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MalKasten: TPaintBox
    Left = 0
    Top = 0
    Width = 800
    Height = 500
    Color = clWhite
    ParentColor = False
  end
  object EdtEingabeFunktion: TEdit
    Left = 855
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'EdtEingabeFunktion'
    OnChange = EdtEingabeFunktionChange
  end
  object Panel1: TPanel
    Left = 816
    Top = 47
    Width = 41
    Height = 21
    Caption = 'f(x)='
    TabOrder = 1
  end
  object Button1: TButton
    Left = 840
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 840
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Mach f(x)=x'
    TabOrder = 3
  end
end
