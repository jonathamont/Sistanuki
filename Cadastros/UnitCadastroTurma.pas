unit UnitCadastroTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TForm_CadastroTurma = class(TForm_CadastroBaseMestreDetalhe)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroTurma: TForm_CadastroTurma;

implementation

{$R *.dfm}

end.
