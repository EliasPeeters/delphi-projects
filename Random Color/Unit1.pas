unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Farbe: Integer;

implementation

{$R *.dfm}

function mycolor: TColor;
begin
  result:= RGB(Random(256),Random(256),Random(256));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Randomize;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Color:= mycolor;
  Form1.Color:= Color;
end;

end.
