object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 24
    Top = 24
    Width = 697
    Height = 457
  end
  object Label1: TLabel
    Left = 608
    Top = 288
    Width = 49
    Height = 25
    AutoSize = False
    Caption = 'Label1'
    Visible = False
  end
  object Button1: TButton
    Left = 736
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object TrackBar1: TTrackBar
    Left = 752
    Top = 224
    Width = 150
    Height = 45
    Max = 20
    Min = 5
    Position = 5
    TabOrder = 1
    OnChange = TrackBar1Change
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 752
    Top = 152
  end
end
