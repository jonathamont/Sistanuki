unit UnitPesquisaTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaTurma = class(TForm_PesquisaBase)
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaCD_PROFESSOR: TIntegerField;
    QueryPesquisaDS_DIA: TIBStringField;
    QueryPesquisaDS_PERIODO: TIBStringField;
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    QueryPesquisaNM_CURSO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaTurma: TForm_PesquisaTurma;

implementation

{$R *.dfm}

uses UnitCadastroTurma, UnitConexao;



end.
