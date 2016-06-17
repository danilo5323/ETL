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
    LabelAccess: TLabel;
    OTFD_Input: TOpenTextFileDialog;
    STFD_Output: TSaveTextFileDialog;

    procedure btnInputClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
Arquibo001: string;
begin
    //metodo para coletar o arquivo
    //Arquibo001:=edtLeitura.Text;
    Arquibo001:='E:\compartilhada\201411_BolsaFamiliaFolhaPagamento.csv';
    Self.Controlador := TControlador.Create(Arquibo001, ExtractFilePath(Arquibo001) + 'output\default' , chr(9));

end;

procedure TFrmIndex.btnProcessarClick(Sender: TObject);
var
tmpSTR: string;
Arquibo001, arqSaida: string;
begin
    //metodo para coletar o arquivo
    //Arquibo001:=edtLeitura.Text;
   // Arquibo001:='E:\compartilhada\201411_BolsaFamiliaFolhaPagamento.csv';
 //    arqSaida:= ExtractFilePath(Arquibo001) + 'default.txt';
   // Self.Controlador := TControlador.Create(Arquibo001, arqSaida , chr(9));

//   Self.Controlador := TControlador.Create(edtLeitura.Text, edtEscrita.Text, chr(9));
 // LabelAccess.Caption := Self.Controlador.processar;
  Controlador.salvarArquivo(arqSaida , 50)  ;
 // tmpSTR := '';
end;
procedure TFrmIndex.FormCreate(Sender: TObject);
var
Arquibo001, arqSaida: string;
begin
    //metodo para coletar o arquivo
    //Arquibo001:=edtLeitura.Text;
    Arquibo001:='E:\compartilhada\201411_BolsaFamiliaFolhaPagamento.csv';
     arqSaida:= ExtractFilePath(Arquibo001) + 'default.txt';
    Self.Controlador := TControlador.Create(Arquibo001, arqSaida , chr(9));

end;

end.
