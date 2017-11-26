object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Factors Calculator'
  ClientHeight = 289
  ClientWidth = 554
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
    Left = 288
    Top = 163
    Width = 185
    Height = 25
    Caption = 'Calculate Number'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 288
    Top = 194
    Width = 185
    Height = 41
    TabOrder = 1
  end
  object EdtZahl1: TEdit
    Left = 288
    Top = 136
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object EdtZahl2: TEdit
    Left = 64
    Top = 136
    Width = 185
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 64
    Top = 163
    Width = 185
    Height = 25
    Caption = 'Calculate factor'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Panel2: TPanel
    Left = 64
    Top = 194
    Width = 185
    Height = 41
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = 64
    Top = 72
    Width = 185
    Height = 41
    Caption = 'Calculate the number of the factors'
    TabOrder = 6
  end
  object Panel4: TPanel
    Left = 288
    Top = 72
    Width = 185
    Height = 41
    Caption = 'Calculate the number with x factors'
    TabOrder = 7
  end
end
