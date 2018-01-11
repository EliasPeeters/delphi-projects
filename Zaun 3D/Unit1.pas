unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SpinEdit1: TSpinEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure DrawZaun;
    procedure FormResize(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DrawZahlmitAnzahl(Zaunanzahl: Integer);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

procedure TForm1.DrawZaun;
var
I, Position: Integer;
begin
  Paintbox1.Canvas.Rectangle(0,0,Paintbox1.Width, Paintbox1.Height);
  Paintbox1.Canvas.Rectangle(0, 105, Paintbox1.Width, 115);
  Paintbox1.Canvas.Rectangle(0, 135, Paintbox1.Width, 145);
  for I := 0 to Position do
  begin
    Paintbox1.Canvas.Rectangle(I*20, 100, I*20+10, 150);
    Position:= I*20+10;
    if Position > Paintbox1.Width  then break;
  end;

end;

procedure TForm1.DrawZahlmitAnzahl(Zaunanzahl: Integer);
var
I: Integer;
begin
  Paintbox1.Canvas.Rectangle(0,0,Paintbox1.Width, Paintbox1.Height);
  Paintbox1.Canvas.Rectangle(0, 105, Paintbox1.Width, 115);
  Paintbox1.Canvas.Rectangle(0, 135, Paintbox1.Width, 145);
  for I := 0 to Zaunanzahl do
  begin
    Paintbox1.Canvas.Rectangle(I*20, 100, I*20+10, 150);
  end;
end;

{$R *.dfm}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer1Timer(Sender);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Paintbox1.Width:= Form1.Width;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  DrawZahlmitAnzahl(Spinedit1.Value);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    DrawZaun;
  end;
end;

end.
