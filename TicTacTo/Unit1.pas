unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Feld1: TPanel;
    Feld2: TPanel;
    Feld6: TPanel;
    Feld7: TPanel;
    Feld9: TPanel;
    Feld4: TPanel;
    Feld8: TPanel;
    Feld5: TPanel;
    Feld3: TPanel;
    Button1: TButton;
    procedure Feld1Click(Sender: TObject);
    procedure Zugsetzer(Feld: TPanel);
    procedure Feld2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Zug: Boolean;

implementation

procedure TForm1.Zugsetzer(Feld: TPanel);
begin
  if Zug then
  begin
    Feld.Caption:= 'X';
    Zug:= false;
  end

  else
  begin
    Feld.Caption:= 'O';
    Zug:= true;
  end;
end;

procedure TForm1.Feld2Click(Sender: TObject);
begin
  if not((Feld2.Caption = 'X') or (Feld1.Caption = 'O')) then Zugsetzer(Feld2);
end;



procedure TForm1.Feld1Click(Sender: TObject);
begin
  if not((Feld1.Caption = 'X') or (Feld1.Caption = 'O')) then Zugsetzer(Feld1);
end;

end.
