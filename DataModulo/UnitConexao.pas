unit UnitConexao;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TCONEXAO = class(TDataModule)
    DB: TIBDatabase;
    Transaction: TIBTransaction;
    Query: TIBQuery;
  private
    { Private declarations }
  public
  Function RetornaPK(PK, TABELA:STRING):INTEGER;
    { Public declarations }

    Procedure TrocaSQL(Qry:TIBQuery; SQL: String);
  end;

var
  CONEXAO: TCONEXAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TCONEXAO.TrocaSQL(Qry:TIBQuery; SQL: String);
Begin
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.ADD(SQL);
  QRY.Open;
End;

 Function Tconexao.RetornaPK(PK, TABELA:STRING):INTEGER;
    BEGIN
        TrocaSQL(Query,'SELECT MAX('+PK+') AS MAIOR FROM '+ TABELA);
        RetornaPK:= Query.FieldByName('MAIOR').AsInteger + 1;
    END;

end.
