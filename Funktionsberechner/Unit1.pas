unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    function BerechneY(Y: Integer; Funktion: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Funktion: String;
  YWert: Integer;


implementation

{$R *.dfm}

function XAnzahlInEinemString(Str: String): integer;
var
I, AktuelleStelle, AktuelleStellePos, Anzahl: Integer;
begin
  AktuelleStelle:= 0;
  for I := 0 to Str.Length do
  begin
    AktuelleStellePos:= PosEx('x', Str, AktuelleStelle);
    if 0 = PosEx('x', Str, AktuelleStelle) then
    begin
      result:= Anzahl;
    end;
    Anzahl:= Anzahl+1;
    AktuelleStelle:= AktuelleStellePos;
  end;

end;


function TForm1.BerechneY(Y: Integer; Funktion: string): string;
var
  AktuelleStelle, I :           Integer;
  AktuelleStellePos:            Integer;
  VorherigeStelle:              String;
  ReplaceStringwithMultiplier:  String;
  StringSchnitt1:               String;
  StringSchnitt2:               String;
begin
  AktuelleStelle:= 1;
  AktuelleStellePos:= 0;
  VorherigeStelle:= '';
  StringSchnitt1:= '';
  StringSchnitt2:= '';
  for I := 0 to Funktion.Length do
  begin
    if  0 <> PosEx('x', Funktion, AktuelleStelle) then
    begin
      AktuelleStellePos:= PosEx('x', Funktion, AktuelleStelle);
      VorherigeStelle:= Copy(Funktion, AktuelleStellePos-1, AktuelleStellePos-1);
      if
      (VorherigeStelle = '0') or
      (VorherigeStelle = '1') or
      (VorherigeStelle = '2') or
      (VorherigeStelle = '3') or
      (VorherigeStelle = '4') or
      (VorherigeStelle = '5') or
      (VorherigeStelle = '6') or
      (VorherigeStelle = '7') or
      (VorherigeStelle = '8') or
      (VorherigeStelle = '9')
      then
      begin
        ReplaceStringwithMultiplier:= '*' + IntToStr(Y);
        StringSchnitt1:= Copy(Funktion, 1 , AktuelleStellePos-1);
        StringSchnitt2:= Copy(Funktion, AktuelleStellePos+1 , Funktion.Length);
        Funktion:= StringSchnitt1 + ReplaceStringwithMultiplier + StringSchnitt2;
      end
      else
      begin
        StringSchnitt1:= Copy(Funktion, 1 , AktuelleStellePos-1);
        StringSchnitt2:= Copy(Funktion, AktuelleStellePos+1 , Funktion.Length);
        Funktion:= StringSchnitt1 + IntToStr(Y) + StringSchnitt2;
      end;
      AktuelleStelle:= AktuelleStellePos;
      VorherigeStelle:= '';
    end;
  end;
  result:= Funktion;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
Funktion:= Edit1.Text;
YWert:= StrToInt(Edit2.Text);
Edit3.Text:=(BerechneY(YWert,Funktion));

end;
end.
