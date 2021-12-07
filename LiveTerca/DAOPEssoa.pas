unit DAOPEssoa;

interface

uses
  Connection, Pessoa;

type
  TDAOPessoa = class
  private
    FConexao : TConexao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreatePessao(aValue : TPEssoa);
  end;

implementation

{ TDAOPessoa }

constructor TDAOPessoa.Create;
begin
  FConexao := TConexao.Create(nil);
end;

procedure TDAOPessoa.CreatePessao(aValue: TPessoa);
var
  lSQL : String;
  I, lId : Integer;
begin
  FConexao.StartTransation;
  try
    lSQL := 'insert into pessoa values (?, ?) returning id';
    FConexao.PrepareStatement(lSQL);
    FConexao.SetValue(0,aValue.Nome);
    FConexao.SetValue(1,aValue.SobreNome);
    FConexao.ExecSQL;

    lId := FConexao.FDQuery1.Fields[0].Value;

    lSQL :='';
    for I := 0 to Pred(aValue.Telefone.Count) do
    begin
      lSQL := 'insert into endereco values (?, ?, ?, ?)';
      FConexao.PrepareStatement(lSQL);
      FConexao.SetValue(0, lId);
      FConexao.SetValue(1, aValue.Telefone[I].DDD);
      FConexao.SetValue(2, aValue.Telefone[I].Numero);
      FConexao.SetValue(3, aValue.Telefone[I].Tipo);
      FConexao.ExecSQL;
    end;

    FConexao.Commit;
  except
    FConexao.Rollback;
  end;
end;

destructor TDAOPessoa.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

end.
