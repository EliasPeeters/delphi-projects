object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 254
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 793
    Height = 177
  end
  object CheckBox1: TCheckBox
    Left = 48
    Top = 192
    Width = 177
    Height = 41
    Caption = 'Automatisches Z'#228'une zeichnen'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 240
    Top = 192
    Width = 162
    Height = 41
    Caption = 'Manuell Zaunanzahl festlegen'
    TabOrder = 1
  end
  object SpinEdit1: TSpinEdit
    Left = 408
    Top = 202
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
    OnChange = SpinEdit1Change
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 8
    Top = 184
  end
end
