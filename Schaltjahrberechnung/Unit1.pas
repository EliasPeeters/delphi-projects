unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Eingabe: TEdit;
    PnlAusgabe: TPanel;
    procedure EingabeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Zahl: Integer;

implementation

{$R *.dfm}

procedure TForm1.EingabeChange(Sender: TObject);
begin
  Zahl:= StrToInt(Eingabe.Text);
if (Zahl mod 400 = 0) then

  PnlAusgabe.Caption:= 'True'

else

begin

  if (Zahl mod 100 <> 0) and (Zahl mod 4 = 0) then
  PnlAusgabe.Caption:= 'True'
  else
  PnlAusgabe.Caption:= 'False';

end;
end;

end.
