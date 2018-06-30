inherited Form_CadastroAulaExp: TForm_CadastroAulaExp
  Caption = 'Cadastro aulas experimentais'
  ClientHeight = 464
  OnCreate = FormCreate
  ExplicitTop = -49
  ExplicitWidth = 535
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 104
    Top = 90
    OnClick = But_PesquisaClick
    ExplicitLeft = 104
    ExplicitTop = 90
  end
  object Label1: TLabel [1]
    Left = 20
    Top = 12
    Width = 68
    Height = 13
    Caption = 'C'#243'd. Aula Exp'
    FocusControl = Edit_CodAulaExp
  end
  object Label2: TLabel [2]
    Left = 20
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Pessoa'
    FocusControl = Edit_CodPessoa
  end
  object Label3: TLabel [3]
    Left = 20
    Top = 192
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
    FocusControl = Edit_DataCadastro
  end
  object Label4: TLabel [4]
    Left = 212
    Top = 192
    Width = 47
    Height = 13
    Caption = 'Data Aula'
    FocusControl = Edit_DataAula
  end
  object Label5: TLabel [5]
    Left = 20
    Top = 136
    Width = 28
    Height = 13
    Caption = 'Curso'
    FocusControl = Edit_CodCurso
  end
  object Label6: TLabel [6]
    Left = 20
    Top = 256
    Width = 36
    Height = 13
    Caption = 'DS_INF'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [7]
    Left = 133
    Top = 71
    Width = 64
    Height = 13
    Caption = 'Nome Pessoa'
    FocusControl = Edit_NomePessoa
  end
  object Label8: TLabel [8]
    Left = 133
    Top = 133
    Width = 58
    Height = 13
    Caption = 'Nome Curso'
    FocusControl = Edit_NomeCurso
  end
  object Btn_PesquisaCurso: TSpeedButton [9]
    Left = 104
    Top = 149
    Width = 23
    Height = 22
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000555
      55555555008880055555555088CCC880555555508C888C8055555508CCCCCCC8
      05555508CECCCCC805555508CEECCCC8055555508C444C805555555088FFF880
      5555555508FFF80555555555508F805555555555508F805555555555508F8055
      55555555508F8055555555550888880555555555500000555555}
    OnClick = Btn_PesquisaCursoClick
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 400
    Width = 519
    Height = 64
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 400
    ExplicitWidth = 519
    ExplicitHeight = 64
    inherited But_Salvar: TBitBtn
      Left = 29
      ExplicitLeft = 29
    end
    inherited But_Sair: TBitBtn
      Left = 421
      Top = 24
      ExplicitLeft = 421
      ExplicitTop = 24
    end
  end
  object Edit_CodAulaExp: TDBEdit [11]
    Left = 20
    Top = 29
    Width = 60
    Height = 21
    DataField = 'CD_AULA_EXP'
    DataSource = DataSourceCadastro
    TabOrder = 1
  end
  object Edit_CodPessoa: TDBEdit [12]
    Left = 20
    Top = 91
    Width = 60
    Height = 21
    DataField = 'CD_PESSOA'
    DataSource = DataSourceCadastro
    TabOrder = 2
    OnExit = Edit_CodPessoaExit
  end
  object Edit_DataCadastro: TDBEdit [13]
    Left = 20
    Top = 208
    Width = 134
    Height = 21
    DataField = 'DT_CADASTRO'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object Edit_DataAula: TDBEdit [14]
    Left = 212
    Top = 211
    Width = 134
    Height = 21
    DataField = 'DT_AULA'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object Edit_CodCurso: TDBEdit [15]
    Left = 20
    Top = 152
    Width = 60
    Height = 21
    DataField = 'CD_CURSO'
    DataSource = DataSourceCadastro
    TabOrder = 5
    OnExit = Edit_CodCursoExit
  end
  object DBEdit6: TDBEdit [16]
    Left = 20
    Top = 275
    Width = 350
    Height = 21
    DataField = 'DS_INF'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object Edit_NomePessoa: TDBEdit [17]
    Left = 133
    Top = 90
    Width = 250
    Height = 21
    DataField = 'NM_PESSOA'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object Edit_NomeCurso: TDBEdit [18]
    Left = 133
    Top = 152
    Width = 250
    Height = 21
    DataField = 'NM_CURSO'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  inherited DataSourceCadastro: TDataSource
    AutoEdit = True
    DataSet = Form_PesquisaAulaExp.QueryPesquisa
    Left = 448
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = Form_PesquisaAulaExp.QueryPesquisa
    Left = 456
    Top = 80
  end
end
