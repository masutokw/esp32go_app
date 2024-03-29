program Esp32Go;

uses
  System.StartUpCopy,
  FMX.Forms,
  Esp32gounit in 'Esp32gounit.pas' {Esp32GoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TEsp32GoForm, Esp32GoForm);
  Application.Run;
end.

