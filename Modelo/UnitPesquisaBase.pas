unit UnitPesquisaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL;

type
  TForm_PesquisaBase = class(TForm)
    QueryPesquisa: TIBQuery;
    DataSourcePesquisa: TDataSource;
    GridPesquisa: TDBGrid;
    GroupBox: TGroupBox;
    RadioFiltro: TRadioGroup;
    MaskEditPesquisa: TMaskEdit;
    Pesquisa: TLabel;
    ButPesquisa: TBitBtn;
    But_Imprimir: TBitBtn;
    Panel1: TPanel;
    But_Novo: TBitBtn;
    But_Alterar: TBitBtn;
    ButSair: TBitBtn;
    UpdateCadastro: TIBUpdateSQL;
    But_Excluir: TBitBtn;
    procedure GridPesquisaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    procedure But_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaBase: TForm_PesquisaBase;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TForm_PesquisaBase.ButSairClick(Sender: TObject);
begin
    Close;
end;

procedure TForm_PesquisaBase.But_ExcluirClick(Sender: TObject);
begin
     if Application.MessageBox('Deseja realmente excluir?','Aviso', MB_OK + MB_YESNO) = IDNO then
        Begin
          Exit;
        End;
     if not(CONEXAO.Transaction.InTransaction) then
        Begin
          CONEXAO.Transaction.StartTransaction;
        End;

      Begin
        Try
          QueryPesquisa.Delete;
          CONEXAO.Transaction.Commit;
        Except
          CONEXAO.Transaction.Rollback;
          ShowMessage('Erro ao Remover!');
        End;
      End;

      QueryPesquisa.Open
end;

procedure TForm_PesquisaBase.FormCreate(Sender: TObject);
begin
     QueryPesquisa.Open;
end;

procedure TForm_PesquisaBase.GridPesquisaDblClick(Sender: TObject);
begin
     ModalResult:= mrOK;
end;

procedure TForm_PesquisaBase.RadioFiltroClick(Sender: TObject);
begin
     MaskEditPesquisa.Clear;
     MaskEditPesquisa.SetFocus;
end;

end.
