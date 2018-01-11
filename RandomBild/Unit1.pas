unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure MalBild;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintToFile(const FileName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ImageCounter: Integer;

const
  Scale: Integer = 100;

implementation

{$R *.dfm}

procedure TForm1.PaintToFile(const FileName: string);
var
  Bitmap: TBitmap;
  Box: TRect;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Paintbox1.Width, Paintbox1.Height);
    MalBild;
    Box:= TRect.Create(0,0,Paintbox1.Width, Paintbox1.Height);
    Bitmap.Canvas.CopyRect(Box, Paintbox1.Canvas, Box);
    Bitmap.SaveToFile(FileName);
  finally
    Bitmap.Free;
  end;
end;

function SchwarzWeiss: TColor;
var
Zahl: Integer;
begin
  Zahl:=Random(2);
  result:= rgb(Zahl*255, Zahl*255, Zahl*255);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.MalBild;
var
X, Y: Integer;
begin
  for X := 0 to 7 do
  begin
    for Y := 0 to 7 do
    begin
      Paintbox1.Canvas.Brush.Color:= SchwarzWeiss;
      Paintbox1.Canvas.Pen.Color:= Paintbox1.Canvas.Brush.Color;
      PaintBox1.Canvas.Rectangle(X*Scale, Y*Scale, (X+1)*Scale, (Y+1)*Scale);
    end;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  PainttoFile(IntToStr(ImageCounter)+'.bmp');
  IMageCounter:= ImageCounter+1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  PainttoFile('Test.bmp');
end;

end.
