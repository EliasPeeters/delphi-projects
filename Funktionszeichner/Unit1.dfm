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
    Width = 26
    Height = 21
    TabOrder = 0
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
  object Panel2: TPanel
    Left = 874
    Top = 47
    Width = 23
    Height = 21
    Caption = 'x'
    TabOrder = 2
  end
  object TrackBar1: TTrackBar
    Left = 806
    Top = 192
    Width = 150
    Height = 45
    Max = 1000
    Min = 1
    Position = 10
    TabOrder = 3
    OnChange = TrackBar1Change
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 864
    Top = 336
  end
end
