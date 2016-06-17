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

    procedure btnInputClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
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
begin

    Self.Controlador := TControlador.Create(edtLeitura.Text, edtEscrita.Text, chr(9));
    tmpSTR := '';
end;

procedure TFrmIndex.btnProcessarClick(Sender: TObject);
var
tmpSTR: string;
begin

  LabelAccess.Caption := Self.Controlador.processar;
  tmpSTR := '';
end;

end.
