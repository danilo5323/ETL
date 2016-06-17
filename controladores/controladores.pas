unit controladores;

interface

uses modelos, Generics.collections, SysUtils, Classes;

type
  TManipuladorArquivo = class
    /// variavel para refenciar arquivo;
    ///
  private
    linhaEntrada: string;
    linhaSaida: string;
    arquivo: TextFile;
  protected

  public

    function proximo: string;
    function header: string;
    function salvar: boolean;
    constructor create; overload;
    constructor create(arquivoEntrada: string); overload;
    procedure fecharArquivo;

  end;

type
  TControlador = class
  const

    insertSQL: string = ' insert into '; // insert
    valuesSQL: string = ' values '; // valores

  private
    separador: string;
    header: TArray<string>;
    arquivoEntrada: TManipuladorArquivo;
    arquivoSaida: TManipuladorArquivo;

    campos: TArray<string>;
    function setCamposInsert(valores: TArray<string>): boolean;
    // configura os headers
    function camposValues(valores: TArray<string>): string;
    // formata os campos a sere inserido
  protected

  public
    function getCampos: string;
    function getDados: string;
    function processar: string;
    constructor create; overload;
    constructor create(strarquivoEntrada, strarquivoSaida,
      strseparador: string); overload;

  end;

implementation

{ Controller }

constructor TControlador.create;
begin

end;

function TControlador.processar: string;

var
  modelo: Metadado;
  Campo: TArray<string>;
  Valor: TArray<string>;
  resultado: String;
  dados: TDictionary<string, string>;
  retorno: string;
  i: integer;
  Key: string;
  tmpString: string;
  list: TstringList;
  chrArray : Array[0..3] of String;
begin

  tmpString := arquivoEntrada.proximo;
  if tmpString <> '' then

  begin
    try
      tmpString := arquivoEntrada.proximo;
      chrArray[0] := chr(9);

      Valor  := tmpString.Split(chrArray);
    finally

    end;
  end;

  modelo.create(campos, Valor);

  dados := modelo.getDados;
  i := 0;

  for Key in dados.Keys do
  begin
    // for I := 0 to High(dados.Count) do begin
    if (dados.TryGetValue(campos[i], resultado)) then
    begin

      retorno := retorno + Key + ' | ' + resultado +

        AnsiString(#13#10);
    end;
    i := i + 1;
  end;
//  modelo.Free;
  modelo:= nil;
  result := retorno;
end;

function TControlador.camposValues(valores: TArray<string>): string;
begin

end;

function TControlador.setCamposInsert(valores: TArray<string>): boolean;
begin

end;

constructor TControlador.create(strarquivoEntrada, strarquivoSaida,
  strseparador: string);
var
  i: integer;
  Key: string;
  tmpString: string;
chrArray : Array [0..0] of char;
  list: TstringList;
begin
  try
    Self.arquivoEntrada := TManipuladorArquivo.create(strarquivoEntrada);
    Self.arquivoSaida := TManipuladorArquivo.create(strarquivoSaida);
    Self.separador := separador;
    // Self.campos := Self.arquivoEntrada.header;

    tmpString := Self.arquivoEntrada.header;
    chrArray[0] := chr(9);
//    list := TstringList.create;
//    list.QuoteChar := chr(9);
 //   list.Delimiter := chr(9);
  //  list.StrictDelimiter := false;
   // list.DelimitedText := tmpString;

    //SetLength(Self.campos, list.Count);

    //chrArray[0] :=                   chr(9);
      //Self.campos  := tmpString.Split(chrArray);
    Self.campos  := tmpString.Split(chrArray);
    // configura a array para o tamanho da ista
//    for i := 0 to list.Count - 1 do
 //   begin
  //    Self.campos[i] := list[i];
   // end;

    // Self.insertSQL := ' insert into '; // insert
    // Self.valuesSQL := ' values ';
  finally

  end;
end;

function TControlador.getCampos: string;
begin
  /// return ( campo1, campo2, campo3 )
end;

function TControlador.getDados: string;
begin
  /// return (variavel1, variavel2, variavel3)
end;

{ TManipuladorArquivo }

constructor TManipuladorArquivo.create;
begin

end;

procedure TManipuladorArquivo.fecharArquivo;
begin
  CloseFile(Self.arquivo);
end;

constructor TManipuladorArquivo.create(arquivoEntrada: string);
begin
  try
    // AssignFile(Self.arquivo, linhaEntrada);
    AssignFile(Self.arquivo, arquivoEntrada);
{$I-}
    //reset(Self.arquivo);
{$I+}
  finally

  end;
end;

function TManipuladorArquivo.header: string; // deve ser utilizado primeiro

begin
  result := proximo();
end;

function TManipuladorArquivo.proximo: string;
var
  linha: string;
begin
  try
    result := '';
    if (not eof(Self.arquivo)) then
    begin
      readln(Self.arquivo, linha);
      result := linha;
    end;
  finally

  end;
end;

function TManipuladorArquivo.salvar: boolean;
begin

end;

end.
