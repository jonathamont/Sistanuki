inherited Form_CadastroMatricula: TForm_CadastroMatricula
  Caption = 'Cadastro de Matr'#237'culas'
  ClientHeight = 263
  ClientWidth = 487
  ExplicitWidth = 503
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 94
    Top = 84
    ExplicitLeft = 94
    ExplicitTop = 84
  end
  object Label1: TLabel [1]
    Left = 23
    Top = 24
    Width = 43
    Height = 13
    Caption = 'Matr'#237'cula'
    FocusControl = EditMatricula
  end
  object Label2: TLabel [2]
    Left = 23
    Top = 69
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
    FocusControl = EditCodNome
  end
  object Label3: TLabel [3]
    Left = 123
    Top = 70
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = EditNomePessoa
  end
  object Label4: TLabel [4]
    Left = 23
    Top = 116
    Width = 56
    Height = 13
    Caption = 'C'#243'd. Turma'
    FocusControl = EditCodTurma
  end
  object Label5: TLabel [5]
    Left = 23
    Top = 162
    Width = 69
    Height = 13
    Caption = 'Data Matricula'
    FocusControl = EditDataMatricula
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 212
    Width = 487
    Height = 51
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 256
    ExplicitWidth = 487
    ExplicitHeight = 51
    inherited But_Salvar: TBitBtn
      Left = 44
      Top = 13
      ExplicitLeft = 44
      ExplicitTop = 13
    end
    inherited But_Sair: TBitBtn
      Left = 369
      Top = 13
      ExplicitLeft = 369
      ExplicitTop = 13
    end
  end
  object EditMatricula: TDBEdit [7]
    Left = 23
    Top = 40
    Width = 60
    Height = 21
    DataField = 'CD_MATRICULA'
    DataSource = Form_PesquisaMatricula.DataSourcePesquisa
    TabOrder = 1
  end
  object EditCodNome: TDBEdit [8]
    Left = 23
    Top = 85
    Width = 65
    Height = 21
    DataField = 'CD_PESSOA'
    DataSource = Form_PesquisaMatricula.DataSourcePesquisa
    TabOrder = 2
  end
  object EditNomePessoa: TDBEdit [9]
    Left = 123
    Top = 85
    Width = 300
    Height = 21
    DataField = 'P'
    DataSource = Form_PesquisaMatricula.DataSourcePesquisa
    TabOrder = 3
  end
  object EditCodTurma: TDBEdit [10]
    Left = 23
    Top = 132
    Width = 60
    Height = 21
    DataField = 'CD_TURMA'
    DataSource = Form_PesquisaMatricula.DataSourcePesquisa
    TabOrder = 4
  end
  object EditDataMatricula: TDBEdit [11]
    Left = 23
    Top = 178
    Width = 134
    Height = 21
    DataField = 'DT_MATRICULA'
    DataSource = Form_PesquisaMatricula.DataSourcePesquisa
    TabOrder = 5
  end
  inherited DataSourceCadastro: TDataSource
    Left = 344
    Top = 32
  end
end
