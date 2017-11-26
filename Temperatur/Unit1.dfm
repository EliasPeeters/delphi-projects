object Form1: TForm1
  Left = 0
  Top = 197
  Caption = 'Temperaturen Rechner'
  ClientHeight = 289
  ClientWidth = 554
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 351
    Top = 69
    Width = 33
    Height = 13
    Caption = 'Celsius'
  end
  object Label2: TLabel
    Left = 351
    Top = 128
    Width = 52
    Height = 13
    Caption = 'Fahrenheit'
  end
  object Label3: TLabel
    Left = 356
    Top = 185
    Width = 28
    Height = 13
    Caption = 'Kelvin'
  end
  object EditC: TEdit
    Left = 72
    Top = 66
    Width = 265
    Height = 21
    TabOrder = 0
    OnChange = EditCChange
  end
  object EditF: TEdit
    Left = 72
    Top = 125
    Width = 265
    Height = 21
    Color = clWhite
    TabOrder = 1
    OnChange = EditFChange
  end
  object EditK: TEdit
    Left = 72
    Top = 179
    Width = 265
    Height = 21
    TabOrder = 2
    OnChange = EditKChange
  end
  object PnlHelp: TPanel
    Left = 432
    Top = 16
    Width = 97
    Height = 33
    Cursor = crNo
    Caption = 'Versteh ich nicht'
    TabOrder = 3
    OnClick = PnlHelpClick
  end
  object PnlK: TPanel
    Left = 62
    Top = 179
    Width = 10
    Height = 21
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
  end
  object PnlF: TPanel
    Left = 62
    Top = 125
    Width = 10
    Height = 21
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
  end
  object PnlC: TPanel
    Left = 62
    Top = 66
    Width = 10
    Height = 21
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
  end
end
