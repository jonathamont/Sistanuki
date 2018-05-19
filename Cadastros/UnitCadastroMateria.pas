unit UnitCadastroMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrão, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBQuery, Vcl.Buttons;

type
  TForm_CadastroMaterias = class(TForm_CadastroPadrao)
    Label1: TLabel;
    Edit_CodigoMateria: TDBEdit;
    Label2: TLabel;
    Edit_Nome: TDBEdit;
    Label3: TLabel;
    Memo_Desc: TDBMemo;
    procedure But_SalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroMaterias: TForm_CadastroMaterias;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaMateria;

procedure TForm_CadastroMaterias.But_SalvarClick(Sender: TObject);
begin
  if trim(Edit_Nome.Text) = '' then
    begin
        Application.MessageBox('Aviso','Prencha o nome da material');
        exit;
    end;
  if trim(Memo_Desc.Text) = '' then
    begin
        Application.MessageBox('Aviso','Prencha a descrição da material');
        exit;
    end;

  inherited;

end;

procedure TForm_CadastroMaterias.FormCreate(Sender: TObject);
begin
  inherited;
  if (DataSourceCadastro.State = dsInsert) then
  begin
        DataSourceCadastro.DataSet.FieldByName('CD_MATERIA').TEXT:=IntToStr(CONEXAO.RetornaPK('CD_MATERIA','TB_MATERIA'));
  end;
end;

end.
