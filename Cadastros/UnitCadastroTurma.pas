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
    QueryItemNM_PESSOA: TIBStringField;
    Label8: TLabel;
    Edit_CodAluno: TDBEdit;
    Label9: TLabel;
    Edit_NMPessoa: TDBEdit;
    But_PesquisaAluno: TSpeedButton;
    Combo_Dia: TDBComboBox;
    Combo_Periodo: TDBComboBox;
    QueryItemPC_FREQ: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure But_Item_ExcluirClick(Sender: TObject);
    procedure But_Item_NovoClick(Sender: TObject);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Edit_CodProfExit(Sender: TObject);
    procedure But_PesquisaCursoClick(Sender: TObject);
    procedure But_PesquisaAlunoClick(Sender: TObject);
    procedure But_SalvarClick(Sender: TObject);
    procedure Edit_CodAlunoExit(Sender: TObject);
    procedure But_ValidaClick(Sender: TObject);
    procedure But_Item_EditClick(Sender: TObject);
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

procedure TForm_CadastroTurma.But_Item_EditClick(Sender: TObject);
begin
  inherited;
  But_PesquisaAluno.Enabled:=True;
  Edit_CodAluno.Enabled:=true;
  
end;

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
  But_PesquisaAluno.Enabled:=True;
  DataSourceItem.DataSet.Open;
  inherited;
  QueryItemCD_TURMA_ALUNO.Value:=CONEXAO.RetornaPK('CD_TURMA_ALUNO','TB_TURMA_ALUNO');
  QueryItemCD_TURMA.Value:=StrToInt(DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value);


end;

procedure TForm_CadastroTurma.But_Item_SaveClick(Sender: TObject);
var
  Chave,chaveitem,Aluno:Integer;
  Nome:String;
begin
  if Trim(Edit_CodProf.Text) = '' then
  begin
    Application.MessageBox('Professor é obrigatorio!','Aviso!');
    Edit_CodProf.SetFocus;
    exit;
  end;
  if Trim(Edit_CodCurso.Text) = '' then
  begin
    Application.MessageBox('Curso é obrigatorio!','Aviso!');
    Edit_CodCurso.SetFocus;
    exit;
  end;
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
         QueryItemPC_FREQ.Value:=StrToFloat('100,00');

  end;

  inherited;
  DataSourceCadastro.DataSet.Locate('CD_TURMA',Chave,[]);
  QueryItem.Open;
  Edit_CodAluno.Enabled:=false;

end;

procedure TForm_CadastroTurma.But_PesquisaAlunoClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaPessoa:=TForm_PesquisaPessoa.Create(self);
    Form_PesquisaPessoa.ShowModal
  finally
    if (Form_PesquisaPessoa.ModalResult = mrok) then
      begin
           QueryItemCD_ALUNO.Value:=Form_PesquisaPessoa.QueryPesquisa.FieldByName('CD_PESSOA').AsInteger;
           QueryItemNM_PESSOA.Value:=Form_PesquisaPessoa.QueryPesquisa.FieldByName('NM_PESSOA').Value;
      end;
    Form_PesquisaPessoa.QueryPesquisa.Close;
    Form_PesquisaPessoa.Free;
  end;
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
           DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').Value:=Form_PesquisaPessoa.QueryPesquisa.FieldByName('NM_PESSOA').Value;
      end;
    Form_PesquisaPessoa.QueryPesquisa.Close;
    Form_PesquisaPessoa.Free;
  end;
end;

procedure TForm_CadastroTurma.But_PesquisaCursoClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaCurso:=TForm_PesquisaCurso.Create(self);
    Form_PesquisaCurso.ShowModal
  finally
    if (Form_PesquisaCurso.ModalResult = mrok) then
      begin
           DataSourceCadastro.DataSet.FieldByName('CD_CURSO').Value:=Form_PesquisaCurso.QueryPesquisa.FieldByName('CD_CURSO').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('NM_CURSO').Value:=Form_PesquisaCurso.QueryPesquisa.FieldByName('NM_CURSO').Value;
      end;
    Form_PesquisaCurso.QueryPesquisa.Close;
    Form_PesquisaCurso.Free;
  end;
end;

procedure TForm_CadastroTurma.But_SalvarClick(Sender: TObject);
begin
  if Trim(Edit_CodProf.Text) = '' then
  begin
    Application.MessageBox('Professor é obrigatorio!','Aviso!');
    Edit_CodProf.SetFocus;
    exit;
  end;
  if Trim(Edit_CodCurso.Text) = '' then
  begin
    Application.MessageBox('Curso é obrigatorio!','Aviso!');
    Edit_CodCurso.SetFocus;
    exit;
  end;
  if Form_PesquisaTurma.QueryPesquisa.State <> dsInsert then
  begin
    Form_PesquisaTurma.QueryPesquisa.Edit;
  end;
  inherited;

end;


procedure TForm_CadastroTurma.But_ValidaClick(Sender: TObject);
begin
  if Trim(Edit_CodProf.Text) = '' then
  begin
    Application.MessageBox('Professor é obrigatorio!','Aviso!');
    Edit_CodProf.SetFocus;
    exit;
  end;
  if Trim(Edit_CodCurso.Text) = '' then
  begin
    Application.MessageBox('Curso é obrigatorio!','Aviso!');
    Edit_CodCurso.SetFocus;
    exit;
  end;
  inherited;

end;

procedure TForm_CadastroTurma.Edit_CodAlunoExit(Sender: TObject);
var
  sql:String;
begin
  inherited;
   if Edit_CodAluno.Text='' then
  begin
    EXIT;
  end;
  SQL:=('SELECT NM_PESSOA FROM TB_PESSOA P WHERE CD_PESSOA='+Edit_CodAluno.Text);
  CONEXAO.TrocaSQL(CONEXAO.Query,SQL);
  if CONEXAO.Query.IsEmpty then
    begin
         Application.MessageBox('Codigo PESSOA não localizado','Aviso',MB_ICONWARNING+MB_OK);
         Edit_CodProf.SetFocus;
         exit;
    end;
  QueryItemNM_PESSOA.Value:=CONEXAO.Query.FieldByName('NM_PESSOA').AsString;
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
  if (DataSourceCadastro.State = dsInsert) then
  begin
       DataSourceCadastro.DataSet.FieldByName('DS_DIA').Value:='SEGUNDA';
       DataSourceCadastro.DataSet.FieldByName('DS_PERIODO').Value:='TARDE';
  end;
  QueryItem.close;
  QueryItem.ParamByName('TURMA').AsInteger:=DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value;
  QueryItem.Open;
  Edit_CodAluno.Enabled:=False;
  But_PesquisaAluno.Enabled:=False;
end;

end.
