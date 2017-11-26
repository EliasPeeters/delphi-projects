object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
  object Eingabe: TEdit
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Eingabe'
    OnChange = EingabeChange
  end
  object PnlAusgabe: TPanel
    Left = 136
    Top = 176
    Width = 185
    Height = 41
    Caption = 'PnlAusgabe'
    TabOrder = 1
  end
end
