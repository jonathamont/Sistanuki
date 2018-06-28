unit UnitPesquisaAula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaAula = class(TForm_PesquisaBase)
    QueryPesquisaCD_AULA: TIntegerField;
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaCD_PROF: TIntegerField;
    QueryPesquisaDT_AULA: TDateField;
    QueryPesquisaHR_INICIO: TTimeField;
    QueryPesquisaHR_FIM: TTimeField;
    QueryPesquisaFG_ENCERRADA: TIBStringField;
    QueryPesquisaFG_PROF_PRESENT: TIBStringField;
    QueryPesquisaNM_PESSOA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaAula: TForm_PesquisaAula;

implementation

{$R *.dfm}

end.
