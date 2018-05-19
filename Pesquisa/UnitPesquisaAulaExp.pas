unit UnitPesquisaAulaExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaAulaExp = class(TForm_PesquisaBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaAulaExp: TForm_PesquisaAulaExp;

implementation

{$R *.dfm}

end.
