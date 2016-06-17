program etlMain;

uses
  Vcl.Forms,
  ETL in 'ETL.pas' {FrmIndex},
  modelos in 'models\modelos.pas',
  controladores in 'controladores\controladores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmIndex, FrmIndex);
  Application.Run;
end.
