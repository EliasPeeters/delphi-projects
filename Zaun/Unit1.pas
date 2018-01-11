unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer2: TTimer;
    Button1: TButton;
    Edit1: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure DrawZaun;
    procedure FormResize(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DrawZahlmitAnzahl(Zaunanzahl: Integer);
    procedure SpinEdit1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure PaintToFile(const FileName: string);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

procedure TForm1.PaintToFile(const FileName: string);
var
  Bitmap: TBitmap;
  Box: TRect;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.SetSize(Paintbox1.Width, Paintbox1.Height);
    DrawZaun;
    sleep(100);
    Box:= TRect.Create(0,0,Paintbox1.Width, Paintbox1.Height);
    Bitmap.Canvas.CopyRect(Box, Paintbox1.Canvas, Box);
    Bitmap.SaveToFile(FileName);
  finally
    Bitmap.Free;
  end;
end;

procedure TForm1.DrawZaun;
var
I, Position, Zaungroesse, Zaunhoehe: Integer;
begin
  Paintbox1.Canvas.Rectangle(0,0,Paintbox1.Width, Paintbox1.Height);
  Paintbox1.Canvas.Rectangle(0, 105, Paintbox1.Width, 115);
  Paintbox1.Canvas.Rectangle(0, 135, Paintbox1.Width, 145);
  for I := 0 to Position do
  begin
    Zaungroesse:= SpinEdit2.Value;
    Zaunhoehe:= TrackBar1.Position;
    Paintbox1.Canvas.Rectangle(I*20, 125-Zaungroesse, I*20+10, 125+Zaungroesse );
    Position:= I*20+10;
    if Position > Paintbox1.Width then break;
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

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  DrawZahlmitAnzahl(Spinedit1.Value);
  if Checkbox1.Checked then Checkbox1.Checked:= false;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Name:= Edit1.Text;
  PainttoFile(Name);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer1Timer(Sender);
  if Checkbox2.Checked then Checkbox2.Checked:= false;
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

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  DrawZaun;
end;

end.
