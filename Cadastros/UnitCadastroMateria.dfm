inherited Form_CadastroMaterias: TForm_CadastroMaterias
  Caption = 'Cadastro Materias'
  ClientHeight = 323
  ClientWidth = 430
  OnCreate = FormCreate
  ExplicitWidth = 446
  ExplicitHeight = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 0
    Top = 233
    Enabled = False
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 233
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 12
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CodigoMateria
  end
  object Label2: TLabel [2]
    Left = 79
    Top = 9
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit_Nome
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 60
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  inherited GroupBox1: TGroupBox
    Left = 345
    Width = 85
    Height = 323
    ExplicitLeft = 345
    ExplicitWidth = 85
    ExplicitHeight = 323
    inherited But_Salvar: TBitBtn
      Left = 9
      ExplicitLeft = 9
    end
    inherited But_Sair: TBitBtn
      Left = 9
      ExplicitLeft = 9
    end
  end
  object Edit_CodigoMateria: TDBEdit [5]
    Left = 8
    Top = 28
    Width = 65
    Height = 21
    DataField = 'CD_MATERIA'
    DataSource = Form_PesquisaMateria.DataSourcePesquisa
    Enabled = False
    TabOrder = 1
  end
  object Edit_Nome: TDBEdit [6]
    Left = 79
    Top = 28
    Width = 260
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NM_MATERIA'
    DataSource = Form_PesquisaMateria.DataSourcePesquisa
    TabOrder = 2
  end
  object Memo_Desc: TDBMemo [7]
    Left = 8
    Top = 79
    Width = 331
    Height = 244
    DataField = 'DS_MATERIA'
    DataSource = Form_PesquisaMateria.DataSourcePesquisa
    ScrollBars = ssBoth
    TabOrder = 3
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = Form_PesquisaMateria.QueryPesquisa
    Left = 312
    Top = 176
  end
end
