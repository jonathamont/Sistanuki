unit UnitCadastroAula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TForm_CadastroAula = class(TForm_CadastroBaseMestreDetalhe)
    Label1: TLabel;
    Edit_CdAula: TDBEdit;
    Label2: TLabel;
    Edit_CdTurma: TDBEdit;
    Label3: TLabel;
    Edit_CdProf: TDBEdit;
    Label4: TLabel;
    Edit_NmProf: TDBEdit;
    Label5: TLabel;
    Edit_Data: TDBEdit;
    Label6: TLabel;
    Edit_HrInicio: TDBEdit;
    Label7: TLabel;
    Edit_HrFim: TDBEdit;
    But_AdiconaAlunos: TBitBtn;
    RadioEncerrado: TDBRadioGroup;
    RadioProfPres: TDBRadioGroup;
    Panel1: TPanel;
    QueryItemCD_AULA_ALUNO: TIntegerField;
    QueryItemCD_AULA: TIntegerField;
    QueryItemCD_ALUNO: TIntegerField;
    QueryItemCD_MATERIA: TIntegerField;
    QueryItemFG_PRESENCA: TIBStringField;
    QueryItemFG_EXP: TIBStringField;
    QueryItemNM_PESSOA: TIBStringField;
    QueryItemNM_MATERIA: TIBStringField;
    Label8: TLabel;
    Edit_CdAluno: TDBEdit;
    Label9: TLabel;
    Edit_NmPessoa: TDBEdit;
    Label10: TLabel;
    Edit_CdMateria: TDBEdit;
    Label11: TLabel;
    Edit_NmMateria: TDBEdit;
    RadioPresenca: TDBRadioGroup;
    But_PesquisaMat: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure But_Item_EditClick(Sender: TObject);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_AdiconaAlunosClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure But_Item_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroAula: TForm_CadastroAula;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaAula, UnitPesquisaTurma;

procedure TForm_CadastroAula.But_AdiconaAlunosClick(Sender: TObject);
VAR
  chave,turma,aluno:Integer;
  SQL:String;
begin
  inherited;
  if (CONEXAO.Query2.IsEmpty) then
   BEGIN
      ShowMessage('Nenhum aluno encontrado:');
      exit;
   END;
   if Trim(Edit_CdTurma.Text) = '' then
    begin
      Application.MessageBox('Turma é obrigatorio!','Aviso!');
      Edit_CdTurma.SetFocus;
      exit;
    end;
    if Trim(Edit_Data.Text) = '  /  /    ' then
    begin
      Application.MessageBox('Data é obrigatorio!','Aviso!');
      Edit_Data.SetFocus;
      exit;
    end;
    if Trim(Edit_HrInicio.Text) = '  :  :  ' then
    begin
      Application.MessageBox('Data inicio é obrigatorio!','Aviso!');
      Edit_HrInicio.SetFocus;
      exit;
    end;
    if Trim(Edit_HrFim.Text) = '::' then
    begin
      Application.MessageBox('Data Fim é obrigatorio!','Aviso!');
      Edit_HrFim.SetFocus;
      exit;
    end;
  turma:=DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value;
  sql:='select cd_aluno, p.nm_pessoa from tb_turma_aluno t inner join tb_pessoa p on(p.cd_pessoa = t.cd_aluno) where t.cd_turma = ' + IntToStr(turma);
  CONEXAO.TrocaSQL(CONEXAO.Query2,SQL);

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
         DataSourceCadastro.DataSet.Locate('CD_AULA',Chave,[]);
    end;

   chave:=DataSourceCadastro.DataSet.FieldByName('CD_AULA').Value;
   aluno:=0;
   while (aluno <> CONEXAO.Query2.FieldByName('cd_aluno').Value) do
    begin
        aluno:=CONEXAO.Query2.FieldByName('cd_aluno').Value;
            QueryItem.Open;
            QueryItem.Append;
            QueryItemCD_ALUNO.Value:=CONEXAO.Query2.FieldByName('cd_aluno').Value;
            QueryItemNM_PESSOA.Value:=CONEXAO.Query2.FieldByName('nm_pessoa').AsString;
            QueryItemCD_AULA.Value:=chave;
            QueryItemCD_MATERIA.Value:=1;
            QueryItemNM_MATERIA.Value:='PADRÃO';
            QueryItemFG_PRESENCA.Value:='S';
            QueryItemFG_EXP.Value:='N';
            QueryItemCD_AULA_ALUNO.Value:=CONEXAO.RetornaPK('CD_AULA_ALUNO','TB_AULA_ALUNO');

            CONEXAO.Query2.Next;




    end;
      QueryItem.open;
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
      QueryItem.Open;
      DataSourceCadastro.DataSet.Locate('CD_AULA',Chave,[]);


   ///CONEXAO.Query.FieldByName('cd_aluno').Value
end;

procedure TForm_CadastroAula.But_Item_EditClick(Sender: TObject);
begin
  Edit_CdAluno.Enabled:=True;
  Edit_CdMateria.Enabled:=True;
  RadioPresenca.Enabled:=True;
  But_PesquisaMat.Enabled:=True;
  inherited;

end;

procedure TForm_CadastroAula.But_Item_ExcluirClick(Sender: TObject);
begin
  inherited;
  QueryItem.Open;
end;

procedure TForm_CadastroAula.But_Item_SaveClick(Sender: TObject);
var
  chave:integer;
begin
  chave:=DataSourceCadastro.DataSet.FieldByName('CD_AULA').Value;
  inherited;
  DataSourceCadastro.DataSet.Locate('CD_AULA',Chave,[]);
  QueryItem.Open;
  Edit_CdAluno.Enabled:=False;
  Edit_CdMateria.Enabled:=False;
  RadioPresenca.Enabled:=False;
  But_PesquisaMat.Enabled:=False;

end;

procedure TForm_CadastroAula.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaTurma:=TForm_PesquisaTurma.Create(self);
    Form_PesquisaTurma.ShowModal
  finally
    if (Form_PesquisaTurma.ModalResult = mrok) then
      begin
           DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('CD_TURMA').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('CD_PROF').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('CD_PROFESSOR').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('NM_PESSOA').Value;
      end;
    Form_PesquisaTurma.QueryPesquisa.Close;
    Form_PesquisaTurma.Free;
  end;
end;

procedure TForm_CadastroAula.FormCreate(Sender: TObject);
begin
  inherited;
  QueryItem.close;
  QueryItem.ParamByName('AULA').AsInteger:=DataSourceCadastro.DataSet.FieldByName('CD_AULA').Value;
  QueryItem.Open;
  Edit_CdAluno.Enabled:=False;
  Edit_CdMateria.Enabled:=False;
  RadioPresenca.Enabled:=False;
  But_PesquisaMat.Enabled:=False;
end;

end.
