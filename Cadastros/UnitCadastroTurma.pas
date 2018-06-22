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
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    QueryItemCD_TURMA_ALUNO: TIntegerField;
    QueryItemCD_TURMA: TIntegerField;
    QueryItemCD_ALUNO: TIntegerField;
    QueryItemPC_FREQ: TIBBCDField;
    QueryItemNM_PESSOA: TIBStringField;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    SpeedButton2: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroTurma: TForm_CadastroTurma;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaTurma;

end.
