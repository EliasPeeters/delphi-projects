unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Zahl, Ergebnis: Integer;
  Teiler, AnzTeiler: Integer;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
  while True do
  begin
    Zahl := Zahl + 1;
    AnzTeiler:=0;
    for Teiler := 1 to Zahl do
    begin
      if Zahl mod Teiler = 0 then
        AnzTeiler := AnzTeiler + 1;
    end;
    if AnzTeiler = 24 then
    begin
      Panel1.Caption:=IntToStr(Zahl);
      break;
    end;
  end;
end;


end.

