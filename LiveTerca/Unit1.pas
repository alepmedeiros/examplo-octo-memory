unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Pessoa,
  Telefone,
  TipoTelefone;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lPessoa: TPessoa;
  lTelefone: TTelefone;
begin
  // lPessoa := TPessoa.Create;
  lPessoa.Nome := 'Alessandro';
  lPessoa.SobreNome := 'Medeiros';
  lPessoa.DataNascimento := StrToDate('12/12/2005');

  lTelefone := TTelefone.Create(12, 23456789, COMERCIAL);
  lPessoa.Telefone.Add(lTelefone);

  lTelefone := TTelefone.Create(11, 33445566, RESIDENCIAL);
  lPessoa.Telefone.Add(lTelefone);

  lTelefone := TTelefone.Create(11, 995223366, CELULAR);
  lPessoa.Telefone.Add(lTelefone);

  Memo1.Lines.Add(lPessoa.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  Memo1.Lines.Add(TPessoa.Builder.Nome('Alessandro').SobreNome('Medeiros')
    .Nascimento('12/12/1985').Telefone(21, 22335566, 'COMERCIAL').Telefone(21,
    23232323, 'RESIDENCIAL').Telefone(21, 23232323, 'TESTE').Build.ToString);
end;

end.
