object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 660
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 9
    Top = 25
    Width = 481
    Height = 481
    Stretch = True
  end
  object Image2: TImage
    Left = 504
    Top = 25
    Width = 481
    Height = 481
    Stretch = True
  end
  object Label1: TLabel
    Left = 384
    Top = 88
    Width = 35
    Height = 13
    Caption = 'zu klein'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 576
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 512
    Width = 482
    Height = 22
    MaxValue = 2147483647
    MinValue = 1
    TabOrder = 0
    Value = 0
  end
  object PnlVersuche: TPanel
    Left = 504
    Top = 512
    Width = 481
    Height = 25
    Caption = 'Spiel hat noch nicht begonnen'
    TabOrder = 1
  end
  object Los: TButton
    Left = 8
    Top = 552
    Width = 977
    Height = 49
    Caption = 'Los/ neu start'
    TabOrder = 2
    OnClick = LosClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 619
    Width = 482
    Height = 33
    Caption = 'Panel1'
    TabOrder = 3
  end
  object TrackBar1: TTrackBar
    Left = 504
    Top = 607
    Width = 481
    Height = 45
    Max = 2750
    Min = 250
    Frequency = 250
    Position = 1500
    TabOrder = 4
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 991
    Top = 23
    Width = 33
    Height = 41
    Caption = 'II'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 328
    Top = 496
  end
end
