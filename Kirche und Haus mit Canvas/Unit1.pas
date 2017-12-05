unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure CreatKirche;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Groesse, Anfangx, Anfangy: Integer;


implementation


procedure TForm1.CreatKirche;
begin
  Groesse:= 15;
  Anfangx:= 50;
  Anfangy:= 400;
  with PaintBox1.Canvas do
  begin
    Label1.Visible:= true;
    Label1.Left:= Anfangx+3*Groesse;
    Label1.Top:= Anfangy-11*Groesse;
    moveto(Anfangx, Anfangy);
    Lineto(Anfangx, Anfangy-Groesse*16);
    moveto(Anfangx, Anfangy);
    Lineto(Anfangx+6*Groesse,Anfangy);
    moveto(Anfangx+6*Groesse,Anfangy);
    Lineto(Anfangx+6*Groesse, Anfangy-Groesse*16);
    moveto(Anfangx+6*Groesse, Anfangy-Groesse*16);
    Lineto(Anfangx, Anfangy-Groesse*16);
    moveto(Anfangx+6*Groesse,Anfangy);
    Lineto(Anfangx+22*Groesse,Anfangy);
    moveto(Anfangx+22*Groesse,Anfangy);
    Lineto(Anfangx+22*Groesse, Anfangy-8*Groesse);
    moveto(Anfangx+22*Groesse,Anfangy-8*Groesse);
    Lineto(Anfangx+6*Groesse,Anfangy-8*Groesse);
    moveto(Anfangx, Anfangy-16*Groesse);
    Lineto(Anfangx+3*Groesse, Anfangy-20*Groesse);
    moveto(Anfangx+3*Groesse, Anfangy-20*Groesse);
    Lineto(Anfangx+6*Groesse, Anfangy-16*Groesse);
    moveto(Anfangx+22*Groesse, Anfangy-8*Groesse);
    Lineto(Anfangx+18*Groesse, Anfangy-12*Groesse);
    moveto(Anfangx+6*Groesse, Anfangy-12*Groesse);
    Lineto(Anfangx+18*Groesse, Anfangy-12*Groesse);
    moveto(Anfangx+2*Groesse, Anfangy);
    Lineto(Anfangx+2*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+4*Groesse, Anfangy-2*Groesse);
    lineto(Anfangx+4*Groesse, Anfangy);
    moveto(Anfangx+3*Groesse, Anfangy);
    Lineto(Anfangx+3*Groesse, Anfangy-2*Groesse);
    Pie(Anfangx+2*Groesse, Anfangy-3*Groesse, Anfangx+4*Groesse, Anfangy-1*Groesse, Anfangx+4*Groesse, Anfangy-2*Groesse, Anfangx+2*Groesse, Anfangy-2*Groesse);
    Ellipse(Anfangx+1*Groesse, Anfangy-14*Groesse, Anfangx+5*Groesse, Anfangy-10*Groesse);
    moveto(Anfangx+7*Groesse, Anfangy-2*Groesse);  //Fenster 1
    Lineto(Anfangx+7*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+7*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+9*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+9*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+9*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+9*Groesse, Anfangy-2*Groesse);
    Lineto(Anfangx+7*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+11*Groesse, Anfangy-2*Groesse);  //Fenster 2
    Lineto(Anfangx+11*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+11*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+13*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+13*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+13*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+13*Groesse, Anfangy-2*Groesse);
    Lineto(Anfangx+11*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+15*Groesse, Anfangy-2*Groesse);  //Fenster 3
    Lineto(Anfangx+15*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+15*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+17*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+17*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+17*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+17*Groesse, Anfangy-2*Groesse);
    Lineto(Anfangx+15*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+19*Groesse, Anfangy-2*Groesse);  //Fenster 4
    Lineto(Anfangx+19*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+19*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+21*Groesse, Anfangy-6*Groesse);
    moveto(Anfangx+21*Groesse, Anfangy-6*Groesse);
    Lineto(Anfangx+21*Groesse, Anfangy-2*Groesse);
    moveto(Anfangx+21*Groesse, Anfangy-2*Groesse);
    Lineto(Anfangx+19*Groesse, Anfangy-2*Groesse);
  end;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CreatKirche;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label1.Caption:=' ' + TimeToStr(Now);
end;

end.
