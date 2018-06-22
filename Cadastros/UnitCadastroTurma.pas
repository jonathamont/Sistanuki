unit UnitCadastroTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TForm_CadastroTurma = class(TForm_CadastroBaseMestreDetalhe)
    Label1: TLabel;
    Edit_CodTurma: TDBEdit;
    Label2: TLabel;
    Edit_CodProf: TDBEdit;
    Label3: TLabel;
    Edit_NMProf: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit_CodCurso: TDBEdit;
    Label7: TLabel;
    Edit_NMCurso: TDBEdit;
    But_PesquisaCurso: TSpeedButton;
    GroupBox2: TGroupBox;
    QueryItemCD_TURMA_ALUNO: TIntegerField;
    QueryItemCD_TURMA: TIntegerField;
    QueryItemCD_ALUNO: TIntegerField;
    QueryItemPC_FREQ: TIBBCDField;
    QueryItemNM_PESSOA: TIBStringField;
    Label8: TLabel;
    Edit_CodAluno: TDBEdit;
    Label9: TLabel;
    Edit_NMPessoa: TDBEdit;
    But_PesquisaAluno: TSpeedButton;
    Combo_Dia: TDBComboBox;
    Combo_Periodo: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure But_Item_ExcluirClick(Sender: TObject);
    procedure But_Item_NovoClick(Sender: TObject);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Edit_CodProfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroTurma: TForm_CadastroTurma;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaTurma, UnitPesquisaCurso, UnitPesquisaPessoa;

procedure TForm_CadastroTurma.But_Item_ExcluirClick(Sender: TObject);
VAR
 Chave:integer;
begin
  Chave:=StrToInt(DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value);
  inherited;
  DataSourceCadastro.DataSet.Locate('CD_TURMA',Chave,[]);
  QueryItem.Open;
end;

procedure TForm_CadastroTurma.But_Item_NovoClick(Sender: TObject);
begin
  Edit_CodAluno.Enabled:=true;
  DataSourceItem.DataSet.Open;
  inherited;
  QueryItemCD_TURMA_ALUNO.Value:=CONEXAO.RetornaPK('CD_TURMA_ALUNO','TB_TURMA_ALUNO');
  QueryItemCD_TURMA.Value:=StrToInt(DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value);
  QueryItemPC_FREQ.Value:=StrToFloat('100.00');

end;

procedure TForm_CadastroTurma.But_Item_SaveClick(Sender: TObject);
var
  Chave,chaveitem,Aluno:Integer;
  Nome:String;
begin
  Chave:=StrToInt(Edit_CodTurma.Text);
  Chaveitem:=QueryItemCD_TURMA_ALUNO.Value;
  Aluno:=QueryItemCD_ALUNO.value;
  Nome:=QueryItemNM_PESSOA.value;
  if DataSourceCadastro.DataSet.State = dsInsert then
  begin
        if not(CONEXAO.Transaction.InTransaction) then
        Begin
          CONEXAO.Transaction.StartTransaction;
        End;

         Try
            DataSourceCadastro.DataSet.Post;
            CONEXAO.Transaction.Commit;
         Except
            ShowMessage('Erro ao gravar!');
            CONEXAO.Transaction.Rollback;
         End;

         DataSourceCadastro.DataSet.Open;
         QueryItem.Open;
         QueryItem.Append;
         QueryItemCD_TURMA_ALUNO.Value:= chaveitem;
         QueryItemCD_TURMA.Value:=chave;
         QueryItemCD_ALUNO.Value:=Aluno;
         QueryItemNM_PESSOA.Value:=nome;

  end;

  inherited;
  DataSourceCadastro.DataSet.Locate('CD_TURMA',Chave,[]);
  QueryItem.Open;
  Edit_CodAluno.Enabled:=false;

end;

procedure TForm_CadastroTurma.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaPessoa:=TForm_PesquisaPessoa.Create(self);
    Form_PesquisaPessoa.ShowModal
  finally
    if (Form_PesquisaPessoa.ModalResult = mrok) then
      begin
           DataSourceCadastro.DataSet.FieldByName('CD_PROFESSOR').Value:=Form_PesquisaPessoa.QueryPesquisa.FieldByName('CD_PESSOA').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').Value:=Form_PesquisaPessoa.QueryPesquisa.FieldByName('NM_PESSOA').AsInteger;
      end;
    Form_PesquisaPessoa.QueryPesquisa.Close;
    Form_PesquisaPessoa.Free;


  end;
end;

procedure TForm_CadastroTurma.Edit_CodProfExit(Sender: TObject);
var
  sql:String;
begin
  inherited;
   if Edit_CodProf.Text='' then
  begin
    EXIT;
  end;
  SQL:=('SELECT NM_PESSOA FROM TB_PESSOA P WHERE CD_PESSOA='+Edit_CodProf.Text);
  CONEXAO.TrocaSQL(CONEXAO.Query,SQL);
  if CONEXAO.Query.IsEmpty then
    begin
         Application.MessageBox('Codigo PESSOA não localizado','Aviso',MB_ICONWARNING+MB_OK);
         Edit_CodProf.SetFocus;
         exit;
    end;
  DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').Value:=CONEXAO.Query.FieldByName('NM_PESSOA').AsString;
end;

procedure TForm_CadastroTurma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QueryItem.Close;
end;

procedure TForm_CadastroTurma.FormCreate(Sender: TObject);
begin
  inherited;
  QueryItem.close;
  //CONTINUAR AQUI QUE TEM ERRO QueryItem.ParamByName('TURMA').AsInteger:=DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value;
  QueryItem.Open;
end;

end.
