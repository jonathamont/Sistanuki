unit UnitCadastroPadrão;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery;

type
  TForm_CadastroPadrao = class(TForm)
    DataSourceCadastro: TDataSource;
    GroupBox1: TGroupBox;
    But_Salvar: TBitBtn;
    But_Sair: TBitBtn;
    But_Pesquisa: TSpeedButton;
    procedure But_SalvarClick(Sender: TObject);
    procedure But_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroPadrao: TForm_CadastroPadrao;

implementation

{$R *.dfm}

uses UnitConexao;



procedure TForm_CadastroPadrao.But_SairClick(Sender: TObject);
begin
     Close;
end;

procedure TForm_CadastroPadrao.But_SalvarClick(Sender: TObject);
begin
     if not(CONEXAO.Transaction.InTransaction) then
        Begin
          CONEXAO.Transaction.StartTransaction;
        End;

     Try
        DataSourceCadastro.DataSet.Post;
        CONEXAO.Transaction.Commit;
        close;
     Except
        ShowMessage('Erro ao gravar!');
        CONEXAO.Transaction.Rollback;
     End;

     DataSourceCadastro.DataSet.Open;
     Close;
end;



end.
