unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    MalKasten: TPaintBox;
    EdtEingabeFunktion: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure Malen;
    procedure Button1Click(Sender: TObject);
    procedure EdtEingabeFunktionChange(Sender: TObject);
    procedure Malx;
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Funktionzeichnen;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Eingabe: Extended;
  XWert8, XWertMinus8 : Integer;


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


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Malen;
  Timer1.Enabled:= false;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Funktionzeichnen;
end;

function XPixelwertZuKoordinatensystem(Pixelwert, Verschiebung, Skalierung: Extended): Extended;
begin
  Result:= (Pixelwert-Verschiebung)/Skalierung;
end;

function YKoordinatensystemZuPixelwert(Koordinatensystem, Verschiebung, Skalierung: Extended): Integer;
begin
  Result:= Round(-(Koordinatensystem*Skalierung)+Verschiebung);
end;

function Graphen (Eingabe, xWert: Extended):Extended;
begin
  Result:= xWert*xWert*Eingabe;
end;

procedure TForm1.FunktionZeichnen;
var
XVerschiebung, YVerschiebung: Extended;
I: Integer;
Skalierung: Extended;
begin
  Malen;
  Eingabe:= StrToFloat(EdtEingabeFunktion.Text);
  Skalierung:= Trackbar1.Position;
  xVerschiebung:= Malkasten.Width div 2;
  yVerschiebung:= Malkasten.Height div 2;



  Malkasten.Canvas.MoveTo(0, YKoordinatensystemZuPixelwert(Graphen(Eingabe, XPixelwertZuKoordinatensystem(0,XVerschiebung, Skalierung)),yVerschiebung, Skalierung));

  for I := 1 to Malkasten.Width-1 do
  begin
    Malkasten.Canvas.LineTo(I, YKoordinatensystemZuPixelwert(Graphen(Eingabe, XPixelwertZuKoordinatensystem(I,XVerschiebung, Skalierung)),yVerschiebung, Skalierung));
  end;
end;

procedure TForm1.EdtEingabeFunktionChange(Sender: TObject);
begin
  FunktionZeichnen;
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
