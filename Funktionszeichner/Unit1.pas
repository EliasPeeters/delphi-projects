unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MalKasten: TPaintBox;
    EdtEingabeFunktion: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Malen;
    procedure Button1Click(Sender: TObject);
    procedure EdtEingabeFunktionChange(Sender: TObject);
    procedure Malx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Eingabe: String;

implementation

{$R *.dfm}

procedure TForm1.Malx;
begin
with MalKasten.Canvas do
  begin
    Pen.Color:= cl3dlight;
    Moveto(0,500);
    LineTo(800, 0);
  end;
end;


procedure TForm1.EdtEingabeFunktionChange(Sender: TObject);
begin
  Eingabe:= EdtEingabeFunktion.Text;
  if Eingabe= 'x' then
  begin
    Malx;
  end;

end;

procedure TForm1.Malen;
begin
  with MalKasten.Canvas do
  begin
    Rectangle(0, 0, 800, 500);
    MoveTo(0,250);
    LineTo(800, 250);
    MoveTo(400, 0);
    LineTo(400, 500);
    MoveTo(800,250);
    Lineto(790, 240);
    MoveTo(800 ,250);
    Lineto(790, 260);
    MoveTo(400, 0);
    LineTo(390, 10);
    MoveTo(400, 0);
    LineTo(410, 10);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Malen;
end;

end.
