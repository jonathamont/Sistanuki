unit UnitCadastroBaseMestreDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrão, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm_CadastroBaseMestreDetalhe = class(TForm_CadastroPadrao)
    QueryItem: TIBQuery;
    UpdateItem: TIBUpdateSQL;
    DataSourceItem: TDataSource;
    GroupSeparacao: TGroupBox;
    GridItem: TDBGrid;
    But_Item_Novo: TSpeedButton;
    But_Item_Edit: TSpeedButton;
    But_Item_Save: TSpeedButton;
    But_Item_Desfazer: TSpeedButton;
    But_Item_Excluir: TSpeedButton;
    procedure But_Item_NovoClick(Sender: TObject);
    procedure But_Item_EditClick(Sender: TObject);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_Item_DesfazerClick(Sender: TObject);
    procedure But_Item_ExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSourceItemStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroBaseMestreDetalhe: TForm_CadastroBaseMestreDetalhe;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TForm_CadastroBaseMestreDetalhe.But_Item_DesfazerClick(
  Sender: TObject);
begin
  inherited;
  QueryItem.CancelUpdates;
end;

procedure TForm_CadastroBaseMestreDetalhe.But_Item_EditClick(Sender: TObject);
begin
  inherited;
  QueryItem.Edit;
end;

procedure TForm_CadastroBaseMestreDetalhe.But_Item_ExcluirClick(
  Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Deseja mesmo exluir?','Alerta', MB_YESNO+MB_ICONWARNING) = idno) then
     begin
          exit;
     end;
  if  not(CONEXAO.Transaction.InTransaction) then
        begin
             CONEXAO.Transaction.StartTransaction;
        end;
        try
          QueryItem.Delete;
          CONEXAO.Transaction.Commit;
        except
          CONEXAO.Transaction.Rollback;
          Application.MessageBox('Erro ao excluir','Erro',MB_OK);
        end;

    DataSourceCadastro.DataSet.Open;
end;

procedure TForm_CadastroBaseMestreDetalhe.But_Item_NovoClick(Sender: TObject);
begin
  inherited;
  QueryItem.Append;
end;

procedure TForm_CadastroBaseMestreDetalhe.But_Item_SaveClick(Sender: TObject);
begin
  inherited;
  if  not(CONEXAO.Transaction.InTransaction) then
    begin
         CONEXAO.Transaction.StartTransaction;
    end;
    try
      QueryItem.Post;
      CONEXAO.Transaction.Commit;
    except
      CONEXAO.Transaction.Rollback;
      Application.MessageBox('Erro ao gravar','Erro',MB_OK);
    end;

    DataSourceCadastro.DataSet.Open;

end;

procedure TForm_CadastroBaseMestreDetalhe.DataSourceItemStateChange(
  Sender: TObject);
begin
  inherited;
      But_Item_Novo.Enabled         :=(DataSourceItem.State in [dsBrowse]);
      But_Item_Edit.Enabled         :=(DataSourceItem.State in [dsBrowse]);
      But_Item_Save.Enabled         :=(DataSourceItem.State in [dsInsert, dsEdit]);
      But_Item_Desfazer.Enabled     :=(DataSourceItem.State in [dsInsert, dsEdit]);
      But_Item_Excluir.Enabled      :=(DataSourceItem.State in [dsBrowse]);

end;

procedure TForm_CadastroBaseMestreDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QueryItem.Close;
end;

end.
