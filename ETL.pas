unit ETL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Generics.collections,
  //classes
  modelos, controladores;

type
  TFrmIndex = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLeitura: TEdit;
    edtEscrita: TEdit;
    btnInput: TButton;
    BtnOutput: TButton;
    btnProcessar: TButton;
    edtQtdLinhas: TEdit;
    Label3: TLabel;
    edtTabela: TEdit;
    Label4: TLabel;
    edtCaractereSeparador: TEdit;
    Label5: TLabel;

    procedure btnInputClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure BtnOutputClick(Sender: TObject);
    procedure edtQtdLinhasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    strArquivoEscrita, strArquivoLeitura: string;
  public
    Controlador : TControlador;
    { Public declarations }
  end;

var
  FrmIndex: TFrmIndex;

implementation

{$R *.dfm}

procedure TFrmIndex.btnInputClick(Sender: TObject);
var
tmpSTR : string;

begin

    if(PromptForFileName(tmpSTR, '', '', 'Selecionar arquivo', 'C:\', false)) then
    begin
        edtLeitura.Text:= tmpStr;
        strArquivoEscrita := ExtractFilePath(tmpStr) + 'output\default.txt';
        edtEscrita.Text := strArquivoEscrita;
        self.strArquivoLeitura:= tmpStr;
        Self.Controlador := TControlador.Create(tmpStr, strArquivoEscrita ,  edtCaractereSeparador.text);
    end;


end;

procedure TFrmIndex.BtnOutputClick(Sender: TObject);
var
tmpSTR : string;
begin
tmpSTR:= '';
    if(PromptForFileName(tmpSTR, '', '', 'Selecionar arquivo', 'C:\', true)) then
    begin

        self.strArquivoEscrita:= tmpStr;
        if(Self.Controlador = nil) then
        begin
          Self.Controlador := TControlador.Create(tmpStr, ExtractFilePath(tmpStr) + 'output\default' , edtCaractereSeparador.text);
        end
        else
        begin
          Self.Controlador.setArqEscrita(tmpStr);
        end;

        edtEscrita.Text:= tmpStr;
    end;

end;

procedure TFrmIndex.btnProcessarClick(Sender: TObject);
var
tmpSTR: string;
Arquibo001, arqSaida: string;
quantidade : integer;
begin
  arqSaida := Self.edtEscrita.text;
  quantidade:=  strtoint(Self.edtQtdLinhas.text);
  Controlador.setSeparador (  edtCaractereSeparador.text);
  Controlador.setTabelaSaida(edtTabela.text)  ;
  Controlador.salvarArquivo(arqSaida , quantidade)  ;
end;
procedure TFrmIndex.edtQtdLinhasChange(Sender: TObject);
begin
///  codigo para dividor arquivos de saida
end;


procedure TFrmIndex.FormCreate(Sender: TObject);
begin
  edtCaractereSeparador.Text := #9;
end;

end.
