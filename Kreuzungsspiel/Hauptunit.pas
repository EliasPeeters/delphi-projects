unit Hauptunit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TKreuzung = Record
    Position: Integer;
    Strasse: Integer;
    Wahrscheinlichkeit: Integer;
  End;

  TStrasse = Record
    Waagerecht: Boolean;
    Ende: Integer;
    Richtung: Integer;
    Kreuzungen: Array of TKreuzung;
    Hautpstrasse: Boolean;
    Ampelhaltpositionen: Array of Integer;
    End;

  TStart = Record
    NeueStrasse: Integer;
    PositionX: Integer;
    PositionY: Integer;
  End;

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Kreuzung1NS1: TImage;
    Kreuzung1HS1: TImage;
    Kreuzung1HS2: TImage;
    Schiffe: TTimer;
    Kreuzung2HS1: TImage;
    Kreuzung2HS2: TImage;
    Kreuzung2NS1: TImage;
    AmeplSchaltung: TTimer;
    Kreuzung4NS1: TImage;
    Kreuzung4HS2: TImage;
    Kreuzung4HS1: TImage;
    Kreuzung3NS1: TImage;
    Kreuzung3HS2: TImage;
    Kreuzung3HS1: TImage;
    procedure KreuzungenTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SchiffeTimer(Sender: TObject);
    procedure AmpelSchaltung(var KreuzungsTick: Integer);
    procedure HSAmpelLaden(image: String);
    procedure NSAmpelLaden(image: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AmpelRotHS, AmpelRotNS: Boolean;
  Kreuzungstick1: Integer;
  Strassen: Array[0..15] of TStrasse;
  Autos: Array[0..30] of TImage;
  Startpositionen: Array[0..6] of TStart;

const
  KeinEnde: Integer = -100000;
  Gelb: String = 'AmpelGelb';
  Gruen: String = 'AmpelGruen';
  Rot: String = 'AmpelRot';
  RotGelb: String = 'AmpelRotGelb';

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
end;    {

procedure GelbeAmpelLaden (image: TImage);
begin
  LoadImage('AmpelGelb', image);
end;

procedure GrueneAmpelLaden (image: TImage);
begin
  LoadImage('AmpelGruen', image);
end;

procedure RoteAmpelLaden (image: TImage);
begin
  LoadImage('AmpelRot', image);
end;

procedure RotGelbeAmpelLaden (image: TImage);
begin
  LoadImage('AmpelRotGelb', image);
end;

procedure YachtLaden (image: TImage);
begin
  LoadImage('Yacht', image);
end;  }

procedure TForm1.HSAmpelLaden(image: String);
begin
  LoadImage(image, Kreuzung1HS1);
  LoadImage(image, Kreuzung1HS2);
  LoadImage(image, Kreuzung2HS1);
  LoadImage(image, Kreuzung2HS2);
  LoadImage(image, Kreuzung3HS1);
  LoadImage(image, Kreuzung3HS2);
  LoadImage(image, Kreuzung4HS1);
  LoadImage(image, Kreuzung4HS2);
end;

procedure TForm1.NSAmpelLaden(image: String);
begin
  LoadImage(image, Kreuzung1NS1);
  LoadImage(image, Kreuzung2NS1);
  LoadImage(image, Kreuzung3NS1);
  LoadImage(image, Kreuzung4NS1);
end;

procedure AutoBildUpdate(Auto: TImage);
var
AktuelleStrasse: TStrasse;
begin
  AktuelleStrasse:= Strassen[Auto.Tag];
  if (AktuelleStrasse.Waagerecht) then
  begin
    if AktuelleStrasse.Richtung>0 then
      LoadImage('AutoRechts', Auto)
    else
      LoadImage('AutoLinks', Auto);
  end
  else
  begin
    if AktuelleStrasse.Richtung>0 then
      LoadImage('AutoRunter', Auto)
    else
      LoadImage('AutoHoch', Auto);
  end;
end;

procedure TForm1.AmpelSchaltung(var KreuzungsTick: Integer);
begin
  KreuzungsTick:= KreuzungsTick+1;
  if KreuzungsTick = 1 then
  begin
    HSAmpelLaden(Gruen);
    NSAmpelLaden(Rot);
    AmpelRotNS:= true;
    AmpelRotHS:= false;
  end

  else if KreuzungsTick = 15 then
  begin
    HSAmpelLaden(Gelb);
  end

  else if KreuzungsTick = 17 then
  begin
    HSAmpelLaden(Rot);
    NSAmpelLaden(Gelb);
    AmpelRotHS:= true;
    AmpelRotNS:= false;
  end

  else if KreuzungsTick = 18 then
  begin
    NSAmpelLaden(Gruen);
  end

  else if KreuzungsTick = 23 then
  begin
    NSAmpelLaden(Gelb);
  end

  else if KreuzungsTick = 25 then
  begin
    HSAmpelLaden(RotGelb);
    NSAmpelLaden(Rot);
    AmpelRotNS:= false;
    AmpelRotHS:= true;
    KreuzungsTick:= 0;
  end;
end;

procedure Schiffvonlinks(Schiff: TImage);
begin
  if Schiff.Tag = 11 then
    begin
      Schiff.Left:= Schiff.Left+1;
      if (Schiff.Left = 600) then
      begin
        Schiff.Tag:= 12;
      end;
    end

  else if Schiff.Tag = 12 then
    begin
      Schiff.Top:=Schiff.Top+1;
      if (Schiff.Top = 600) then
      begin
        Schiff.Tag:= 0;
      end;
    end;
end;



procedure Schifffaehrt(Schiff: TImage);
begin
if (Schiff.Tag=11) or (Schiff.Tag=12) then Schiffvonlinks(Schiff);              //Tag = 11 bedeutet er kommt von links befindet sich momentan auf der Wasserstraﬂe 1
if (Schiff.Tag=21) or (Schiff.Tag=22) then SchiffvonLinks(Schiff);              //Tag = 12 kommt von links; ist auf Wasser2
if Schiff.Tag=0 then                                                            //Tag = 21 kommt von unten; ist auf Wasser1
begin                                                                           //Tag = 22 kommt von unten; ist auf Wasser2
  if Random(10)=0 then Schiff.Tag:=11                                           //Tag = 0 das Schiff f‰hrt gerade nicht
                                                                                // Dann wird mit einer Wahrscheinlichkeit bestimmt, ob er losfahren darf

end;
end;

function Kolidierung(Auto: TImage): boolean;
var
I:  Integer;
begin
  Result:=False;
  for i := 0 to High(Autos) do
  begin
    if Autos[i]<>Auto then
    begin
      if Auto.BoundsRect.IntersectsWith(Autos[i].BoundsRect) then
      begin
        Result:=True;
        break
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
I: Integer;
tmpAuto: TImage;
begin
Randomize;
for I := 0 to High(Autos) do
begin
  tmpAuto:=TImage.Create(Self);
  tmpAuto.Parent:=Form1;
  tmpAuto.Stretch:= true;
  tmpAuto.SetBounds(-100, -100, 20, 20);
  tmpAuto.Tag:=-1;
  Autos[I] := tmpAuto;
end;

Strassen[0].Waagerecht := True;
Strassen[0].Ende := -50;
Strassen[0].Richtung := -2;
Strassen[0].Hautpstrasse:= true;
SetLength(Strassen[0].Kreuzungen, 4);
Strassen[0].Kreuzungen[0].Position:= 350;
Strassen[0].Kreuzungen[0].Strasse:= 8;
Strassen[0].Kreuzungen[0].Wahrscheinlichkeit:= 3;
Strassen[0].Kreuzungen[1].Position:= 760;
Strassen[0].Kreuzungen[1].Strasse:= 14;
Strassen[0].Kreuzungen[1].Wahrscheinlichkeit:= 3;
Strassen[0].Kreuzungen[2].Position:= 535;
Strassen[0].Kreuzungen[2].Strasse:= 7;
Strassen[0].Kreuzungen[2].Wahrscheinlichkeit:= 3;
Strassen[0].Kreuzungen[3].Position:= 208;
Strassen[0].Kreuzungen[3].Strasse:= 5;
Strassen[0].Kreuzungen[3].Wahrscheinlichkeit:= 3;
SetLength(Strassen[0].Ampelhaltpositionen, 2);
Strassen[0].Ampelhaltpositionen[0]:= 300;
Strassen[0].Ampelhaltpositionen[1]:= 440;


Strassen[1].Waagerecht := True;
Strassen[1].Ende:= 1000;
Strassen[1].Richtung:= 2;
Strassen[1].Hautpstrasse:= true;
SetLength(Strassen[1].Kreuzungen, 4);
Strassen[1].Kreuzungen[0].Position:= 208;
Strassen[1].Kreuzungen[0].Strasse:= 5;
Strassen[1].Kreuzungen[0].Wahrscheinlichkeit:= 3;
Strassen[1].Kreuzungen[1].Position:= 350;
Strassen[1].Kreuzungen[1].Strasse:= 8;
Strassen[1].Kreuzungen[1].Wahrscheinlichkeit:= 3;
Strassen[1].Kreuzungen[2].Position:= 535;
Strassen[1].Kreuzungen[2].Strasse:= 7;
Strassen[1].Kreuzungen[2].Wahrscheinlichkeit:= 3;
Strassen[1].Kreuzungen[3].Position:= 760;
Strassen[1].Kreuzungen[3].Strasse:= 14;
Strassen[1].Kreuzungen[3].Wahrscheinlichkeit:= 8;
SetLength(Strassen[1].Ampelhaltpositionen, 2);
Strassen[1].Ampelhaltpositionen[0]:= 112;
Strassen[1].Ampelhaltpositionen[1]:= 300;



Strassen[2].Waagerecht := True;
Strassen[2].Ende:= -50;
Strassen[2].Richtung:= -2;
Strassen[2].Hautpstrasse:= true;
SetLength(Strassen[2].Kreuzungen, 3);
Strassen[2].Kreuzungen[0].Position:= 188;
Strassen[2].Kreuzungen[0].Strasse:= 10;
Strassen[2].Kreuzungen[0].Wahrscheinlichkeit:= 3;
Strassen[2].Kreuzungen[1].Position:= 373;
Strassen[2].Kreuzungen[1].Strasse:= 9;
Strassen[2].Kreuzungen[1].Wahrscheinlichkeit:= 3;
Strassen[2].Kreuzungen[2].Position:= 515;
Strassen[2].Kreuzungen[2].Strasse:= 12;
Strassen[2].Kreuzungen[2].Wahrscheinlichkeit:= 3;
SetLength(Strassen[2].Ampelhaltpositionen, 2);
Strassen[2].Ampelhaltpositionen[0]:= 608;
Strassen[2].Ampelhaltpositionen[1]:= 240;


Strassen[3].Waagerecht := True;
Strassen[3].Ende:= KeinEnde;
Strassen[3].Richtung:= 2;
Strassen[3].Hautpstrasse:= true;
SetLength(Strassen[3].Kreuzungen, 4);
Strassen[3].Kreuzungen[0].Position:= 188;
Strassen[3].Kreuzungen[0].Strasse:= 10;
Strassen[3].Kreuzungen[0].Wahrscheinlichkeit:= 3;
Strassen[3].Kreuzungen[1].Position:= 373;
Strassen[3].Kreuzungen[1].Strasse:= 9;
Strassen[3].Kreuzungen[1].Wahrscheinlichkeit:= 3;
Strassen[3].Kreuzungen[2].Position:= 515;
Strassen[3].Kreuzungen[2].Strasse:= 12;
Strassen[3].Kreuzungen[2].Wahrscheinlichkeit:= 3;
Strassen[3].Kreuzungen[3].Position:= 780;
Strassen[3].Kreuzungen[3].Strasse:= 15;
Strassen[3].Kreuzungen[3].Wahrscheinlichkeit:= 10;
SetLength(Strassen[3].Ampelhaltpositionen, 2);
Strassen[3].Ampelhaltpositionen[0]:= 440;
Strassen[3].Ampelhaltpositionen[1]:= 130;


Strassen[4].Waagerecht := False;
Strassen[4].Ende:= KeinEnde;
Strassen[4].Richtung:= 1;
Strassen[4].Hautpstrasse:= true;
SetLength(Strassen[4].Kreuzungen, 2);
Strassen[4].Kreuzungen[0].Position:= 100;
Strassen[4].Kreuzungen[0].Strasse:= 0;
Strassen[4].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[4].Kreuzungen[1].Position:= 125;
Strassen[4].Kreuzungen[1].Strasse:= 1;
Strassen[4].Kreuzungen[1].Wahrscheinlichkeit:= 10;
SetLength(Strassen[4].Ampelhaltpositionen, 1);
Strassen[4].Ampelhaltpositionen[0]:= 16;

Strassen[5].Waagerecht := False;
Strassen[5].Ende:= -100;
Strassen[5].Richtung:= -1;

Strassen[6].Waagerecht := False;
Strassen[6].Ende:= KeinEnde;
Strassen[6].Richtung:= 1;
SetLength(Strassen[6].Kreuzungen, 2);
Strassen[6].Kreuzungen[0].Position:= 100;
Strassen[6].Kreuzungen[0].Strasse:= 0;
Strassen[6].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[6].Kreuzungen[1].Position:= 125;
Strassen[6].Kreuzungen[1].Strasse:= 1;
Strassen[6].Kreuzungen[1].Wahrscheinlichkeit:= 10;

Strassen[7].Waagerecht := False;
Strassen[7].Ende:= -100;
Strassen[7].Richtung:= -1;

Strassen[8].Waagerecht := False;
Strassen[8].Ende:= KeinEnde;
Strassen[8].Richtung:= 1;
SetLength(Strassen[8].Kreuzungen, 2);
Strassen[8].Kreuzungen[0].Position:= 295;
Strassen[8].Kreuzungen[0].Strasse:= 2;
Strassen[8].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[8].Kreuzungen[1].Position:= 315;
Strassen[8].Kreuzungen[1].Strasse:= 3;
Strassen[8].Kreuzungen[1].Wahrscheinlichkeit:= 10;

Strassen[9].Waagerecht := False;
Strassen[9].Ende:= KeinEnde;
Strassen[9].Richtung:= -1;
SetLength(Strassen[9].Kreuzungen, 2);
Strassen[9].Kreuzungen[0].Position:= 128;
Strassen[9].Kreuzungen[0].Strasse:= 1;
Strassen[9].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[9].Kreuzungen[1].Position:= 104;
Strassen[9].Kreuzungen[1].Strasse:= 0;
Strassen[9].Kreuzungen[1].Wahrscheinlichkeit:= 10;
SetLength(Strassen[9].Ampelhaltpositionen, 1);
Strassen[9].Ampelhaltpositionen[0]:= 160;

Strassen[10].Waagerecht := False;
Strassen[10].Ende:= -450;
Strassen[10].Richtung:= 1;

Strassen[11].Waagerecht := False;
Strassen[11].Ende:= KeinEnde;
Strassen[11].Richtung:= -1;
SetLength(Strassen[11].Kreuzungen, 2);
Strassen[11].Kreuzungen[0].Position:= 320;
Strassen[11].Kreuzungen[0].Strasse:= 3;
Strassen[11].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[11].Kreuzungen[1].Position:= 295;
Strassen[11].Kreuzungen[1].Strasse:= 2;
Strassen[11].Kreuzungen[1].Wahrscheinlichkeit:= 10;
SetLength(Strassen[11].Ampelhaltpositionen, 1);
Strassen[11].Ampelhaltpositionen[0]:= 360;

Strassen[12].Waagerecht := False;
Strassen[12].Ende:= -450;
Strassen[12].Richtung:= 1;

Strassen[13].Waagerecht := False;
Strassen[13].Ende:= KeinEnde;
Strassen[13].Richtung:= -1;
SetLength(Strassen[13].Kreuzungen, 2);
Strassen[13].Kreuzungen[0].Position:= 320;
Strassen[13].Kreuzungen[0].Strasse:= 3;
Strassen[13].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[13].Kreuzungen[1].Position:= 295;
Strassen[13].Kreuzungen[1].Strasse:= 2;
Strassen[13].Kreuzungen[1].Wahrscheinlichkeit:= 10;
SetLength(Strassen[13].Ampelhaltpositionen, 1);
Strassen[13].Ampelhaltpositionen[0]:= 400;

Strassen[14].Waagerecht := False;
Strassen[14].Ende:= KeinEnde;
Strassen[14].Richtung:= 1;
SetLength(Strassen[14].Kreuzungen, 1);
Strassen[14].Kreuzungen[0].Position:= 295;
Strassen[14].Kreuzungen[0].Strasse:= 2;
Strassen[14].Kreuzungen[0].Wahrscheinlichkeit:= 10;

Strassen[15].Waagerecht := False;
Strassen[15].Ende:= KeinEnde;
Strassen[15].Richtung:= -1;
SetLength(Strassen[15].Kreuzungen, 2);
Strassen[15].Kreuzungen[0].Position:= 128;
Strassen[15].Kreuzungen[0].Strasse:= 1;
Strassen[15].Kreuzungen[0].Wahrscheinlichkeit:= 5;
Strassen[15].Kreuzungen[1].Position:= 104;
Strassen[15].Kreuzungen[1].Strasse:= 0;
Strassen[15].Kreuzungen[1].Wahrscheinlichkeit:= 10;

Startpositionen[0].NeueStrasse:= 1;
Startpositionen[0].PositionX:= -50;
Startpositionen[0].PositionY:= 128;

Startpositionen[1].NeueStrasse:= 13;
Startpositionen[1].PositionX:= 540;
Startpositionen[1].PositionY:= 450;

Startpositionen[2].NeueStrasse:= 0;
Startpositionen[2].PositionX:= 1000;
Startpositionen[2].PositionY:= 103;

Startpositionen[3].NeueStrasse:= 3;
Startpositionen[3].PositionX:= -50;
Startpositionen[3].PositionY:= 320;

Startpositionen[4].NeueStrasse:= 4;
Startpositionen[4].PositionX:= 183;
Startpositionen[4].PositionY:= -50;

Startpositionen[5].NeueStrasse:= 6;
Startpositionen[5].PositionX:= 513;
Startpositionen[5].PositionY:= -50;

Startpositionen[6].NeueStrasse:= 11;
Startpositionen[6].PositionX:= 210;
Startpositionen[6].PositionY:= 450;
end;

procedure Fahren(Auto: TImage);
var
  i, Position: Integer;
  strasse: TStrasse;
  Startposition: TStart;
  StehtanAmpel: Boolean;
begin
   if Auto.Tag >= 0 then
   begin
      strasse:= Strassen[Auto.Tag];

      if strasse.Waagerecht then
         Position:=Auto.Left
      else
         Position:=Auto.Top;

      StehtanAmpel:= false;
      for I := 0 to High(Strasse.Ampelhaltpositionen) do
      begin
        if Strasse.Ampelhaltpositionen[I]=Position then
        begin
          StehtanAmpel:= true;
          break;
        end;
      end;



      if (AmpelRotHS xor Strasse.Hautpstrasse) or not StehtanAmpel then
      begin
        if strasse.Waagerecht then
          Auto.Left:=Position + strasse.Richtung
        else
          Auto.Top:=Position + strasse.Richtung;

        if Kolidierung(Auto) then
        begin
          if strasse.Waagerecht then
            Auto.Left:=Position
          else
            Auto.Top:=Position;
        end;

      end;





      if strasse.Ende = Position then
      begin
        Auto.Tag:=-1;
        Auto.Left:= -100;
        Auto.Top:= 600;
      end
      else
      begin
        for i := 0 to High(strasse.Kreuzungen) do
        begin
          if (strasse.Kreuzungen[i].Position = Position) and (Random(10)<Strasse.Kreuzungen[i].Wahrscheinlichkeit) then
          begin
            Auto.Tag:= strasse.Kreuzungen[i].Strasse;
            AutoBildUpdate(Auto);
          end;
        end;
      end;
   end
   else
   begin
      if Random(100)=42 then
      begin
        Startposition:= Startpositionen[Random(Length(Startpositionen))];
        Auto.Left:= Startposition.PositionX;
        Auto.Top:= Startposition.PositionY;
        if Kolidierung(Auto) then
        begin
          Auto.Top:=-100;
          Auto.Left:=-100;
        end
        else
        begin
          Auto.Tag:= Startposition.NeueStrasse;
          AutoBildUpdate(Auto);
        end;
      end;
   end;
end;

procedure TForm1.KreuzungenTimerTimer(Sender: TObject);
begin
AmpelSchaltung(Kreuzungstick1 );
end;

procedure TForm1.SchiffeTimer(Sender: TObject);
var
I: Integer;
begin
for I := 0 to High(Autos) do
begin
  Fahren(Autos[I]);
end;


end;

end.
