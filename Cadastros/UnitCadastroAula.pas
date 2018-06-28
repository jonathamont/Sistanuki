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
    EditHrFim: TDBEdit;
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

end.
