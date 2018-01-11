unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Timer1: TTimer;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure NaechsterPixel(XKord, YKord: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Bildmalen;
    procedure Timer1Timer(Sender: TObject);
    procedure PaintToFile(const FileName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.PaintToFile(const FileName: string);
var
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Paintbox1.Width, Paintbox1.Height);
    Bildmalen;
    Bitmap.SaveToFile(FileName);
  finally
    Bitmap.Free;
  end;
end;

procedure TForm1.Bildmalen;
var
xAktuell, yAktuell, I: Integer;
begin
  xAktuell:= 0;
  yAktuell:= 0;
  with PaintBox1.Canvas do
    begin
      moveto(0,0);
      for I := 0 to (PaintBox1.Height*PaintBox1.Width) do
      begin
        NaechsterPixel(xAktuell, YAktuell);
        xAktuell:= xAktuell+1;

        if xAktuell = Paintbox1.Width then
        begin
          yAktuell:= yAktuell+1;
          xAktuell:= 0;

        end;

        if yAktuell = Paintbox1.Height then
        begin
          break;
        end;

      end;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Timer1.Enabled then Timer1.Enabled:= false;
  if not(Timer1.Enabled) then Timer1.Enabled:= true;
end;

procedure TForm1.NaechsterPixel(XKord, YKord: Integer);
begin
  with PaintBox1.Canvas do
  begin
    Randomize;
    Pen.Color:= RGB(Random(255), Random(255), Random(255));
    LineTo(XKord, YKord);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Bildmalen;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Bildmalen;
    PainttoFile('Test');
end;


end.
