unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure DrawSchiff(X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SchiffX, SchiffY: Integer;

implementation

procedure TForm1.DrawSchiff(X, Y: Integer);
begin
  with Paintbox1.Canvas do
  begin
    Polygon([Point(X, Y), Point(X+10, Y+30), Point(X-10,Y+30),Point(X,Y)]);
  end;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  DrawSchiff(SchiffX, SchiffY);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SchiffX:= 100;
  SchiffY:= 100;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #119) and (Key = #97) then
  begin
    SchiffY:= SchiffY-10;
    SchiffX:= SchiffX-10;
  end;

  if Key = #119  then SchiffY:= SchiffY-10;   //w
  if Key = #115  then SchiffY:= SchiffY+10;   //s
  if Key = #97   then SchiffX:= SchiffX-10;   //a
  if Key = #100  then SchiffX:= SchiffX+10;   //d

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Paintbox1.Canvas.Rectangle(0,0, Paintbox1.Width, Paintbox1.Height);
  DrawSchiff(SchiffX, SchiffY);
end;

end.
