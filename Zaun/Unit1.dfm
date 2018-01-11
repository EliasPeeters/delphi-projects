object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 520
  ClientWidth = 958
  Color = clBtnFace
  DoubleBuffered = True
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
    Left = 4
    Top = 0
    Width = 793
    Height = 409
  end
  object Label1: TLabel
    Left = 409
    Top = 425
    Width = 80
    Height = 19
    Caption = 'Zaunanzahl'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 537
    Top = 425
    Width = 70
    Height = 19
    Caption = 'Zaunh'#246'he'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 673
    Top = 425
    Width = 91
    Height = 19
    Caption = 'Zaunposition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 440
    Width = 177
    Height = 41
    Caption = 'Automatisches Z'#228'une zeichnen'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 215
    Top = 440
    Width = 162
    Height = 41
    Caption = 'Manuell Zaunanzahl festlegen'
    TabOrder = 1
    OnClick = CheckBox2Click
  end
  object SpinEdit1: TSpinEdit
    Left = 393
    Top = 450
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 10
    OnChange = SpinEdit1Change
  end
  object SpinEdit2: TSpinEdit
    Left = 520
    Top = 450
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 25
  end
  object TrackBar1: TTrackBar
    Left = 647
    Top = 450
    Width = 150
    Height = 45
    Max = 1000
    TabOrder = 4
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 816
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 816
    Top = 429
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 8
    Top = 184
  end
  object Timer2: TTimer
    Left = 848
    Top = 80
  end
end
