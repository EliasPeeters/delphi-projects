unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls, Math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    SpinEdit1: TSpinEdit;
    PnlVersuche: TPanel;
    Los: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure UpdateImage1(imageName, text: String);  
    procedure UpdateImage2(imageName, text: String);
    procedure LosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Rategesicht;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Zielwert, Versuche, MaxRate, MinRate, Ratewert, MaxZahlen: Integer;
  Ratezeit: Boolean = true; 

const
  Normal: String = 'NORMAL';
  SprechenL: String = 'SPRECHENL';
  SPrechenR: String = 'SPRECHENR';
  Traurig: String = 'TRAURIG';

implementation

{$R *.dfm}

procedure LoadImage(imageName: String; image: TImage);
var S: TResourceStream;
begin
   S:= TResourceStream.Create(0, imageName, 'IMAGE');
  try
    image.Picture.LoadFromStream(S);  
  finally
    S.Free;
  end;
end;

procedure TForm1.LosClick(Sender: TObject);
begin
  MaxZahlen:= SpinEdit1.Value;
  Zielwert:= Random(MaxZahlen) + 1;
  Versuche:= 0;
  PnlVersuche.Caption:='Noch keine Versuche';
  Timer1.Enabled:= True;
  UpdateImage1(SprechenR, 'Rate mal!');
  UpdateImage2(Normal, '');
  MaxRate:= MaxZahlen;
  MinRate:= 1;
  Panel1.Caption:= IntToStr(Zielwert);
  
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Ratezeit then
  begin    
    Ratewert:= (MaxRate+MinRate) div 2;
    UpdateImage1(Normal, '');
    UpdateImage2(SprechenL, IntToStr(Ratewert));
    Versuche:= Versuche + 1;
    PnlVersuche.Caption:='Versuche: ' + IntToStr(Versuche);
  end

  else
  begin
    if Ratewert = Zielwert then
    begin
      UpdateImage1(SprechenR, 'Gewonnen');
      UpdateImage2(Normal, '');
      Timer1.Enabled:= False;
    end

    else if Ratewert < Zielwert then
    begin
      UpdateImage1(SprechenR, 'zu klein');
      Rategesicht;
      MinRate:=Ratewert+1;
    end

    else
    begin
      UpdateImage1(SprechenR, 'zu groß');
      Rategesicht;
      MaxRate:=Ratewert-1;
    end;
  end;
  Ratezeit:= not Ratezeit;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
Timer1.Interval:= TrackBar1.Position;
end;

procedure TForm1.UpdateImage1(imageName, text: String);
begin
  LoadImage(imageName, Image1);
  Label1.Caption:= text;
end;

procedure TForm1.Rategesicht;
begin
  if Versuche > Int(log2(Single(MaxZahlen)) * 0.6) then
  begin
    UpdateImage2(Traurig, '');
  end
  else
  UpdateImage2(Normal, ''); 
  
end;

procedure TForm1.UpdateImage2(imageName, text: String);
begin
  LoadImage(imageName, Image2);
  Label2.Caption:= text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  UpdateImage1(Normal, '');
  UpdateImage2(Normal, '');
end;

end.
