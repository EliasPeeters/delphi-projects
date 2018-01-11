unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure KreisMalen;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Brush.Color:= rgb(255,255,255);
  Paintbox1.Canvas.Rectangle(0,0, Paintbox1.Width, Paintbox1.Height);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Paintbox1.Width:= Form1.Width;
  Paintbox1.Height:= Form1.Height;
end;

procedure TForm1.KreisMalen;
begin
  with Paintbox1.Canvas do
  begin
    Brush.Color:= rgb(Random(255),Random(255),Random(255));
    Ellipse(Random(Paintbox1.Width),Random(Paintbox1.Height),Random(Paintbox1.Width),Random(Paintbox1.Height));
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Kreismalen;
end;

end.
