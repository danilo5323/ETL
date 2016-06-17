unit modelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Generics.collections;

type
  Metadado = Class
    private
    titulo : TArray<string>;
    data : TDictionary <String, String>;
    banco : String; /// banco que ser� utilizado

    public
    constructor Create; Overload;
    constructor Create(inputTitulo, inputDados : TArray<string>); Overload;
    function getDados : TDictionary<String,String>;
  End;
implementation

{ Metadado }

constructor Metadado.Create;
begin

end;


constructor Metadado.Create(inputTitulo, inputDados: TArray<string>);
var
  I : integer;

begin
   try
     //Self.data.Create(High(inputTitulo));
     Self.data := TDictionary<String, String>.Create();

     for I := 0 to High(inputTitulo) do
     begin
       //Self.data.add(inputTitulo[I], inputDados[i]);
       Self.data.add(inputTitulo[I], inputDados[I]);
     end;
       {
     Self.data.add(inputTitulo[0], inputDados[0]);
     Self.data.add(inputTitulo[1], inputDados[1]);
     Self.data.add(inputTitulo[2], inputDados[2]);
     Self.data.add(inputTitulo[3], inputDados[3]);
     Self.data.add(inputTitulo[4], inputDados[4]);
     Self.data.add(inputTitulo[5], inputDados[5]);
     Self.data.add(inputTitulo[6], inputDados[6]);
     Self.data.add(inputTitulo[7], inputDados[7]);
     Self.data.add(inputTitulo[8], inputDados[8]);
     Self.data.add(inputTitulo[9], inputDados[9]);
     Self.data.add(inputTitulo[10], inputDados[10]);
     Self.data.add(inputTitulo[11], inputDados[11]);
     Self.data.add(inputTitulo[12], inputDados[12]);

     }
   finally

   end;

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
