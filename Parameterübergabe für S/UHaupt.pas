unit UHaupt;


interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Math, Vcl.Samples.Spin;

type
  TAuto = Record
    Anfangx: Integer;
    Anfangy: Integer;
  End;


  TFrmAnwendung = class(TForm)
    ImgBild: TImage;
    BtnZeichnen: TButton;
    BtnLoeschen: TButton;
    PnlHelp: TPanel;
    Drawatbegin: TTimer;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure BtnZeichnenClick(Sender: TObject);
    procedure BtnLoeschenClick(Sender: TObject);
    procedure CreatKirche(Anfangx, Anfangy, Groesse: Integer);
    procedure AutoMalen(Anfangx, Anfangy, Groesse: Real);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PnlHelpClick(Sender: TObject);
    procedure DrawatbeginTimer(Sender: TObject);
    procedure AutoAuto(Auto: TAuto);
    procedure Timer1Timer(Sender: TObject);


  private
    procedure StrassenZeichnen;
  public
    { public Public-Deklarationen }
  end;

var

FrmAnwendung: TFrmAnwendung;
Anfangx: Real = 500;
Anfangy: Real = 550;
Autos: Array [0..10]  of TAuto;

implementation

{$R *.DFM}

procedure TFrmAnwendung.FormActivate(Sender: TObject);
begin
  ImgBild.Canvas.Rectangle (0,0,ImgBild.Width,ImgBild.Height)
end;

function Hausgroesseberechnen(Anfangy: Real): Real;
begin
  result:= 1 / 92 * Anfangy + 31/23;
end;

procedure TFrmAnwendung.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  close

  else if Key = #119 then
  Anfangy:= Anfangy-10

  else if Key = #115 then
  Anfangy:= Anfangy+10

  else if Key = #97 then
  Anfangx:= Anfangx-5

  else  if Key = #100 then
  Anfangx:= Anfangx+5;


  ImgBild.Canvas.Rectangle(0,0,ImgBild.Width, ImgBild.Height);

  BtnZeichnenClick(Sender);

  AutoMalen(Anfangx, Anfangy, Hausgroesseberechnen(Anfangy)*3);

end;

procedure TFrmAnwendung.PnlHelpClick(Sender: TObject);
begin
  ShowMessage('Press w,a,s,d to controll the car; esc for exit');
end;

procedure TFrmAnwendung.BtnLoeschenClick(Sender: TObject);
begin
   ImgBild.Canvas.Rectangle (0,0,ImgBild.Width,ImgBild.Height)
end;

procedure TFrmAnwendung.StrassenZeichnen;
begin
  with ImgBild.Canvas do
    begin
      Pen.Width := 2;
      LineTo (140,PenPos.Y);
      LineTo (385,200);
      LineTo (30,200);
      LineTo (48,180);
      LineTo (400,180);
      LineTo (480,70);
      LineTo (0,70);
      Moveto (0,60);
      LineTo (780,60);
      LineTo (775,70);
      LineTo (510,70);
      LineTo (322,370);
      LineTo (600,370);
      LineTo (670,225);
      LineTo (695,225);
      LineTo (625,400);
      LineTo (305,400);
      LineTo (230,520);
      LineTo (ImgBild.Width,PenPos.Y);
      MoveTo (0,PenPos.Y+70);
      LineTo (ImgBild.Width,PenPos.Y);
      MoveTo (0,520+35);
      While PenPos.X <= ImgBild.Width do
        begin
          MoveTo (PenPos.X+13,PenPos.Y);
          LineTo (PenPos.X+5,PenPos.Y)
        end;
      Pen.Width := 1
    end
end;

procedure TFrmAnwendung.Timer1Timer(Sender: TObject);
var
I: Integer;
begin
  AutoAuto(Autos[1]);

end;

procedure TFrmAnwendung.DrawatbeginTimer(Sender: TObject);
begin
   BtnZeichnenClick(Sender);
   DrawatBegin.Enabled:= false;
end;

function HausAnfangx(Hausnummer: Integer): Integer;
begin
  case Hausnummer of
    1: result:= -30;
    2: result:= 230;
    3: result:= 400;
    4: result:= 570;
    5: result:= 340;
    6: result:= 470;
    7: result:= 50;
    8: result:= 130;
    9: result:= 210;
    10: result:= 290;
    11: result:= 5;
    12: result:= 55;
    13: result:= 105;
    14: result:= 155;
    15: result:= 205;
    16: result:= 255;
    17: result:= 305;
    18: result:= 355;
    19: result:= 405;
    20: result:= 455;
    21: result:= 505;
    22: result:= 555;
    23: result:= 605;
    24: result:= 655;
    25: result:= 705;


  end;
end;

function HausAnfany(Hausnummer: Integer): Integer;
begin
  case Hausnummer of
    1: result:= 520;
    2: result:= 520;
    3: result:= 520;
    4: result:= 520;
    5: result:= 370;
    6: result:= 370;
    7: result:= 180;
    8: result:= 180;
    9: result:= 180;
    10: result:= 180;
    11: result:= 60;
    12: result:= 60;
    13: result:= 60;
    14: result:= 60;
    15: result:= 60;
    16: result:= 60;
    17: result:= 60;
    18: result:= 60;
    19: result:= 60;
    20: result:= 60;
    21: result:= 60;
    22: result:= 60;
    23: result:= 60;
    24: result:= 60;
    25: result:= 60;
  end;
end;

procedure TFrmAnwendung.AutoMalen(Anfangx, Anfangy, Groesse: Real);
begin
   ImgBild.Canvas.Rectangle(trunc(Anfangx), trunc(Anfangy),trunc(Anfangx + Groesse), trunc(Anfangy + Groesse))
end;

procedure TFrmAnwendung.CreatKirche(Anfangx, Anfangy, Groesse: Integer);
begin
with ImgBild.Canvas do
  begin
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

procedure TFrmAnwendung.BtnZeichnenClick(Sender: TObject);
var
Groesse2: Integer;
I: Integer;
begin
  with ImgBild.Canvas do
    begin
      MoveTo (0,520);
      StrassenZeichnen;
    end;

  for I := 1 to 10 do
  begin
    CreatKirche(HausAnfangx(I), HausAnfany(I), Trunc(Hausgroesseberechnen(HausAnfany(I))));
  end;

  for I := 1  to 14 do
  Begin
    CreatKirche(I*50+5, 60, 2);
  End;
end;

procedure TFrmAnwendung.AutoAuto(Auto: TAuto);
begin
      Auto.Anfangx:= Auto.Anfangx+100;
      AutoMalen(Auto.Anfangx, Auto.Anfangy, 10);
end;




end.


