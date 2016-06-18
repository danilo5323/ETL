unit controladores;

interface

uses  Generics.collections, SysUtils, Classes;

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
    function ultimo: boolean;
    function proximo: string;
    function header: string;
    function salvar(inputDados: TArray<String>; arquivoSaida: string): boolean;
    constructor create; overload;
    constructor create(arquivoEntrada: string); overload;
    procedure fecharArquivo;
  end;

type
  TControlador = class
  const

  private
    insertSQL: string;// = ' insert into '; // insert
    separador: char;
    header: TArray<string>;
    campos: TArray<string>;

    arquivoEntrada: TManipuladorArquivo;
    arquivoSaida: TManipuladorArquivo;
    function setCamposInsert(valores: TArray<string>): boolean;
    // configura os headers
    function camposValues(valores: TArray<string>): string;
    // formata os campos a sere inserido

    function configSQL(header, valor: TArray<String>): String;
  protected

  public
    function getCampos: string;
    function getDados: string;
    function processar: string;
    constructor create; overload;
    constructor create(strarquivoEntrada, strarquivoSaida,
      strseparador: string); overload;
    function salvarArquivo(inputArquivo: string;
      inputQuantidade: integer): boolean;
    procedure setArqEscrita(tmpStr: string);

    procedure setSeparador(input : string);

    procedure setTabelaSaida(input : string);
   end;

implementation

{ Controller }

constructor TControlador.create;
begin

end;


 procedure TControlador.setTabelaSaida(input : string);
  begin
     insertSQL:= 'insert into ' + input;
  end;

  procedure TControlador.setSeparador(input : string);
  begin
    Self.separador:= input.Chars[0];
  end;



function TControlador.processar: string;

var
  valor: TArray<string>;
  resultado: String;
  dados: TDictionary<string, string>;
  retorno: string;
  i: integer;
  Key: string;
  tmpString: string;
  list: TstringList;
  chrArray: Array [0 .. 3] of String;
begin

  tmpString := arquivoEntrada.proximo;
  if tmpString <> '' then

  begin
    try
      chrArray[0] := self.separador;
      valor := tmpString.Split(chrArray);
    finally

    end;
  end;

  i := 0;

  resultado := configSQL(self.header, valor);
  retorno := resultado + AnsiString(#13#10);

  Result := retorno;

end;

function TControlador.configSQL(header, valor: TArray<String>): String;
var
  i: integer;
  tmpInsert, tmpValores: String;
begin
  tmpInsert := insertSQL + ' ( ';
  tmpValores := ' values ( ';

  for i := 0 to High(header) do
  begin

    tmpInsert := tmpInsert + StringReplace(header[i], ' ', '_',
      [rfReplaceAll, rfIgnoreCase]);

    tmpValores := tmpValores + #39 + valor[i] + #39;

    if i < high(header) then
    begin
      tmpInsert := tmpInsert + ', ';
      tmpValores := tmpValores + ', ';
    end;
  end;

  Result := tmpInsert + ')' + tmpValores + ');';

end;

function TControlador.camposValues(valores: TArray<string>): string;
begin

end;

procedure TControlador.setArqEscrita(tmpStr: string);
begin
  self.arquivoSaida.Free;
  self.arquivoSaida.create(tmpStr);
end;

function TControlador.setCamposInsert(valores: TArray<string>): boolean;
begin

end;

constructor TControlador.create(strarquivoEntrada, strarquivoSaida,
  strseparador: string);
var
  tmpString: string;
  chrArray: Array [0 .. 0] of string;
begin
  try
    self.arquivoEntrada := TManipuladorArquivo.create(strarquivoEntrada);

    self.arquivoSaida := TManipuladorArquivo.create(strarquivoSaida);
    self.separador :=  strseparador.Chars[0];

    tmpString := self.arquivoEntrada.header;

    chrArray[0] := strseparador.Chars[0];

    self.header := tmpString.Split(chrArray);

  finally
  end;
end;

function TControlador.getCampos: string;
begin
  /// return ( campo1, campo2, campo3, [...] )
end;

function TControlador.getDados: string;
begin
  /// return (variavel1, variavel2, variavel3, [...])
end;

function TControlador.salvarArquivo(inputArquivo: string;
  inputQuantidade: integer): boolean;
var
  dadosarquivosaida: TArray<String>;
  i: integer;
  versaoArquivo: integer;
  arquivosSaida: string;
begin

  SetLength(dadosarquivosaida, inputQuantidade);
  versaoArquivo := 0;
  // verificar se o arquivo terminou e realizar looping até o fim

  while not arquivoEntrada.ultimo do
  begin
    for i := 0 to (inputQuantidade - 1) do
      if (not arquivoEntrada.ultimo) then
      begin
        dadosarquivosaida[i] := processar;
      end
      else
      begin
        break
      end;

    arquivosSaida := inputArquivo + inttostr(versaoArquivo) + '.sql';

    /// fluxo para salvar o novo arquivo;
    self.arquivoSaida := TManipuladorArquivo.create(arquivosSaida);
    self.arquivoSaida.salvar(dadosarquivosaida, arquivosSaida);

    // apenas se o arquivo existir!
    versaoArquivo := versaoArquivo + 1;
  end;

end;

{ TManipuladorArquivo }

constructor TManipuladorArquivo.create;
begin

end;

procedure TManipuladorArquivo.fecharArquivo;
var
  e: exception;
begin
  try
    CloseFile(self.arquivo);

  finally

  end;

end;

constructor TManipuladorArquivo.create(arquivoEntrada: string);
begin
  try

    AssignFile(self.arquivo, arquivoEntrada);
    if not FileExists(arquivoEntrada) then
    begin
      CreateDir(ExtractFilePath(arquivoEntrada));
      Rewrite(self.arquivo);
    end;

{$I-}
    reset(self.arquivo);
{$I+}
  finally

  end;
end;

function TManipuladorArquivo.header: string; // deve ser utilizado primeiro

begin
  Result := proximo();
end;

function TManipuladorArquivo.proximo: string;
var
  linha: string;
begin
  try
    Result := '';
    if (not eof(self.arquivo)) then
    begin
      readln(self.arquivo, linha);
      Result := linha;
    end;
  finally

  end;
end;

function TManipuladorArquivo.salvar(inputDados: TArray<String>;
  arquivoSaida: string): boolean;
var
  i: integer;
  outputArquivo: TextFile;
begin
  // validar o nome do arquivo se realmente é o arquivo de saida
  Rewrite(self.arquivo);

  for i := 0 to high(inputDados) do
  begin
    write(self.arquivo, inputDados[i]);
  end;

  CloseFile(self.arquivo);
end;

function TManipuladorArquivo.ultimo: boolean;
begin
  Result := eof(self.arquivo);
end;

end.
