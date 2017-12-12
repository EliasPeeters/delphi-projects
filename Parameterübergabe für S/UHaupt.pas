unit UHaupt;


interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFrmAnwendung = class(TForm)
    ImgBild: TImage;
    BtnZeichnen: TButton;
    BtnLoeschen: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BtnZeichnenClick(Sender: TObject);
    procedure BtnLoeschenClick(Sender: TObject);
  //  procedure CreatKirche(Anfangx, Anfangy, Groesse: Integer);

  private
    procedure StrassenZeichnen;
  public
    { public Public-Deklarationen }
  end;

var FrmAnwendung: TFrmAnwendung;

implementation

{$R *.DFM}

procedure TFrmAnwendung.FormActivate(Sender: TObject);
begin
  ImgBild.Canvas.Rectangle (0,0,ImgBild.Width,ImgBild.Height)
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
{
procedure TForm1.CreatKirche(Anfangx, Anfangy, Groesse: Integer);
begin
  Anfangx:= 50;
  Anfangy:= 400;
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
    moveto(Anfangx+31*Groesse, Anfangy);             // Haus
    Lineto(Anfangx+39*Groesse, Anfangy);
    Lineto(Anfangx+39*Groesse, Anfangy-8*Groesse);
    Lineto(Anfangx+31*Groesse, Anfangy-8*Groesse);
    Lineto(Anfangx+31*Groesse, Anfangy);
    moveto(Anfangx+31*Groesse, Anfangy-8*Groesse);
    Lineto(Anfangx+35*Groesse, Anfangy-13*Groesse);
    Lineto(Anfangx+39*Groesse, Anfangy-8*Groesse);
    moveto(Anfangx+32*Groesse, Anfangy);
    Lineto(Anfangx+32*Groesse, Anfangy-3*Groesse);
    Lineto(Anfangx+34*Groesse, Anfangy-3*Groesse);
    Lineto(Anfangx+34*Groesse, Anfangy);
    Moveto(Anfangy+36*Groesse, Anfangy-1*Groesse);
    Lineto(Anfangy+38*Groesse, Anfangy-1*Groesse);
  end;
end;
}



procedure TFrmAnwendung.BtnZeichnenClick(Sender: TObject);

begin
  with ImgBild.Canvas do
    begin
      MoveTo (0,520);
      StrassenZeichnen;

      {Hier müssen die Häuser hin!}

    end
end;

end.


