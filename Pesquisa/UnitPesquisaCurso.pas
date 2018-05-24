unit UnitPesquisaCurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaCurso = class(TForm_PesquisaBase)
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaNM_CURSO: TIBStringField;
    QueryPesquisaNR_HORAS: TTimeField;
    procedure But_NovoClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaCurso: TForm_PesquisaCurso;

implementation

{$R *.dfm}

uses UnitCadastroCurso, UnitConexao;

procedure TForm_PesquisaCurso.ButPesquisaClick(Sender: TObject);
begin
  inherited;
   //
end;

procedure TForm_PesquisaCurso.But_NovoClick(Sender: TObject);
begin
  inherited;
   try

        QueryPesquisa.Append;
        QueryPesquisaCD_CURSO.Value:=(CONEXAO.RetornaPK('CD_CURSO','TB_CURSO'));
        Form_CadastroCurso:=TForm_CadastroCurso.Create(self);
        Form_CadastroCurso.ShowModal;

     finally
        Form_CadastroCurso.Free;
        QueryPesquisa.Close;
        ButPesquisaClick(ButPesquisa);

     end;
end;

end.
