unit modelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs,
  Generics.collections, System.Generics.Defaults;

type
  Metadado = Class
  private
    dataValores, headerValores: TArray<String>;
    data: TDictionary<String, String>;
    header: TDictionary<String, String>;
    // banco: String;
    /// banco que será utilizado

  public

    // function configure(inputTitulo, inputDados: TArray<string>)  : TDictionary<string, string>;
    function getDados: TDictionary<String, String>;
    function configure(headerValores, dataValores: TArray<String>)
      : TDictionary<string, string>;

    constructor Create; Overload;
    constructor Create(inputHeader: TArray<string>); Overload;
    constructor Create(inputTitulo, inputDados: TArray<string>); Overload;

  End;

implementation

{ Metadado }

// procedure Metadado.configure();
function Metadado.configure(headerValores, dataValores: TArray<String>)
  : TDictionary<string, string>;
var
  retorno: TDictionary<String, String>;
  i: integer;
  E: Exception;
begin
  // etorno := TDictionary<String, String>.Create();
  try
    begin
      retorno := TDictionary<String, String>.Create();
      for i := 0 to High(dataValores) do
      begin
        retorno.Add(headerValores[i], dataValores[i]);
      end;
    end;

  except
    on E: Exception do
      i := 0;

  end;
  Result := retorno;
end;

constructor Metadado.Create();

begin

end;

constructor Metadado.Create(inputTitulo, inputDados: TArray<string>);
var
  i: integer;
  E: Exception;
begin

  try
    Self.data := TDictionary<String,String>.create;

    dataValores := TArray<String>.create();
    headerValores := TArray<String>.Create();

    dataValores := inputDados;
    headerValores := inputTitulo;

  finally

  end;

end;

constructor Metadado.Create(inputHeader: TArray<string>);

begin

  // headerValores := TDictionary<String,String>.create;
  // dataValores := TArray<String>.create();
  // headerValores:= TArray<String>.create;
  headerValores := inputHeader;
  // dataValores  := TArray<String>.create();
  data := TDictionary<String, String>.Create;
  header := TDictionary<String, String>.Create;
end;

function Metadado.getDados: TDictionary<String, String>;
begin
  if data.Count > 0 then
  begin
    Result := data;
  end
  else
  begin
    Result := nil;
  end;

end;

end.
