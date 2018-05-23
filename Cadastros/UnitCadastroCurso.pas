unit UnitCadastroCurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  Vcl.ExtCtrls, IBX.IBCustomDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TForm_CadastroCurso = class(TForm_CadastroBaseMestreDetalhe)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    QueryItemCD_CURSO_MATERIA: TIntegerField;
    QueryItemCD_CURSO: TIntegerField;
    QueryItemCD_MATERIA: TIntegerField;
    QueryItemNM_MATERIA: TIBStringField;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroCurso: TForm_CadastroCurso;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaCurso;

end.
