inherited Form_CadastroPessoa: TForm_CadastroPessoa
  Caption = 'Cadastro Pessoa'
  ClientHeight = 465
  ClientWidth = 617
  OnCreate = FormCreate
  ExplicitWidth = 633
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 162
    Top = 238
    OnClick = But_PesquisaClick
    ExplicitLeft = 162
    ExplicitTop = 238
  end
  object Label1: TLabel [1]
    Left = 22
    Top = 0
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CodigoPessoa
  end
  object Label2: TLabel [2]
    Left = 22
    Top = 43
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit_Nome
  end
  object Label3: TLabel [3]
    Left = 368
    Top = 43
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
    FocusControl = Edit_CPF_CNPJ
  end
  object Label7: TLabel [4]
    Left = 368
    Top = 0
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
    FocusControl = Edit_Dt_Nasci
  end
  object Label8: TLabel [5]
    Left = 20
    Top = 91
    Width = 66
    Height = 13
    Caption = 'T. Residencial'
    FocusControl = Edit_Telefone
  end
  object Label9: TLabel [6]
    Left = 190
    Top = 91
    Width = 33
    Height = 13
    Caption = 'Celular'
    FocusControl = Edit_Celulat
  end
  object Label10: TLabel [7]
    Left = 22
    Top = 139
    Width = 24
    Height = 13
    Caption = 'Email'
    FocusControl = Edit_Email
  end
  object Label11: TLabel [8]
    Left = 22
    Top = 222
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = Edit_CodCidade
  end
  object Label13: TLabel [9]
    Left = 191
    Top = 222
    Width = 63
    Height = 13
    Caption = 'Nome Cidade'
    FocusControl = Edit_NmCidade
  end
  object Label14: TLabel [10]
    Left = 24
    Top = 270
    Width = 28
    Height = 13
    Caption = 'Bairro'
    FocusControl = Edit_Bairro
  end
  object Label15: TLabel [11]
    Left = 24
    Top = 318
    Width = 19
    Height = 13
    Caption = 'Rua'
    FocusControl = Edit_Rua
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 421
    Width = 617
    Height = 44
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 421
    ExplicitWidth = 617
    ExplicitHeight = 44
    inherited But_Salvar: TBitBtn
      Top = 11
      ExplicitTop = 11
    end
    inherited But_Sair: TBitBtn
      Left = 532
      Top = 11
      ExplicitLeft = 532
      ExplicitTop = 11
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 2
    end
  end
  object Edit_CodigoPessoa: TDBEdit [13]
    Left = 22
    Top = 16
    Width = 64
    Height = 21
    DataField = 'CD_PESSOA'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object Edit_Nome: TDBEdit [14]
    Left = 22
    Top = 59
    Width = 315
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NM_PESSOA'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 2
  end
  object Edit_CPF_CNPJ: TDBEdit [15]
    Left = 368
    Top = 59
    Width = 177
    Height = 21
    DataField = 'NR_CPF_CNPJ'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 3
  end
  object Edit_Dt_Nasci: TDBEdit [16]
    Left = 368
    Top = 16
    Width = 134
    Height = 21
    DataField = 'DT_NASCIMENTO'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 4
  end
  object Edit_Telefone: TDBEdit [17]
    Left = 22
    Top = 110
    Width = 108
    Height = 21
    DataField = 'NR_TELEFONE'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 5
  end
  object Edit_Celulat: TDBEdit [18]
    Left = 190
    Top = 110
    Width = 147
    Height = 21
    DataField = 'NR_CELULAR'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 6
  end
  object Edit_Email: TDBEdit [19]
    Left = 22
    Top = 155
    Width = 209
    Height = 21
    DataField = 'DS_EMAIL'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 7
  end
  object Edit_CodCidade: TDBEdit [20]
    Left = 22
    Top = 238
    Width = 134
    Height = 21
    DataField = 'CD_CIDADE'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 8
    OnExit = Edit_CodCidadeExit
  end
  object Edit_NmCidade: TDBEdit [21]
    Left = 191
    Top = 238
    Width = 299
    Height = 21
    DataField = 'NM_CIDADE'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    ReadOnly = True
    TabOrder = 9
  end
  object Edit_Bairro: TDBEdit [22]
    Left = 24
    Top = 286
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DS_BAIRRO'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 10
  end
  object Edit_Rua: TDBEdit [23]
    Left = 24
    Top = 337
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DS_RUA'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    TabOrder = 11
  end
  object RadioSexo: TDBRadioGroup [24]
    Left = 368
    Top = 131
    Width = 246
    Height = 35
    Caption = 'Sexo'
    Columns = 3
    DataField = 'FG_SEXO'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    Items.Strings = (
      'Masculino'
      'Feminino'
      'N'#227'o Informar')
    TabOrder = 12
    Values.Strings = (
      'M'
      'F'
      'N')
  end
  object RadioFunc: TDBRadioGroup [25]
    Left = 368
    Top = 172
    Width = 110
    Height = 42
    Caption = 'Funcionario'
    Columns = 2
    DataField = 'FG_FUNC'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 13
    Values.Strings = (
      'S'
      'N')
  end
  object Radio_Fis_Juri: TDBRadioGroup [26]
    Left = 368
    Top = 93
    Width = 185
    Height = 32
    Caption = 'Tipo'
    Columns = 2
    DataField = 'FG_FISC_JURID'
    DataSource = Form_PesquisaPessoa.DataSourcePesquisa
    Items.Strings = (
      'Fisica'
      'Juridica')
    TabOrder = 14
    Values.Strings = (
      'F'
      'J')
    OnExit = Radio_Fis_JuriExit
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = Form_PesquisaPessoa.QueryPesquisa
    Left = 440
    Top = 320
  end
end
