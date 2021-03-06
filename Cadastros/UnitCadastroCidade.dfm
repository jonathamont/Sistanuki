inherited Form_CadastroCidades: TForm_CadastroCidades
  Caption = 'Cadastro Cidades'
  ClientHeight = 165
  ClientWidth = 451
  OnCreate = FormCreate
  ExplicitWidth = 467
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 232
    Top = 169
    Visible = False
    ExplicitLeft = 232
    ExplicitTop = 169
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CodCidade
  end
  object Label2: TLabel [2]
    Left = 95
    Top = 11
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = Edit_Nm_Cidade
  end
  object Label3: TLabel [3]
    Left = 16
    Top = 54
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label4: TLabel [4]
    Left = 97
    Top = 54
    Width = 19
    Height = 13
    Caption = 'Pais'
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 126
    Width = 451
    Height = 39
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 126
    ExplicitWidth = 451
    ExplicitHeight = 39
    inherited But_Salvar: TBitBtn
      Left = 3
      Top = 11
      ExplicitLeft = 3
      ExplicitTop = 11
    end
    inherited But_Sair: TBitBtn
      Left = 375
      Top = 11
      ExplicitLeft = 375
      ExplicitTop = 11
    end
  end
  object Edit_CodCidade: TDBEdit [6]
    Left = 16
    Top = 27
    Width = 58
    Height = 21
    DataField = 'CD_CIDADE'
    DataSource = Form_PesquisaCidade.DataSourcePesquisa
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object Edit_Nm_Cidade: TDBEdit [7]
    Left = 95
    Top = 27
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NM_CIDADE'
    DataSource = Form_PesquisaCidade.DataSourcePesquisa
    TabOrder = 2
  end
  object Combo_Pais: TDBComboBox [8]
    Left = 95
    Top = 73
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DS_PAIS'
    DataSource = Form_PesquisaCidade.DataSourcePesquisa
    Items.Strings = (
      'BRASIL'
      'PORTUGAL'
      'JAP'#195'O'
      'ARGENTINA')
    ReadOnly = True
    TabOrder = 3
  end
  object Combo_Estado: TDBComboBox [9]
    Left = 16
    Top = 73
    Width = 59
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DS_ESTADO'
    DataSource = Form_PesquisaCidade.DataSourcePesquisa
    Items.Strings = (
      '**'
      'AC'#9' '
      'AL'#9' '
      'AP'#9' '
      'AM'#9' '
      'BA'#9' '
      'CE'#9' '
      'DF'#9' '
      'ES'#9' '
      'GO'#9' '
      'MA'#9' '
      'MT'#9' '
      'MS'#9' '
      'MG'#9' '
      'PA'#9' '
      'PB'#9' '
      'PR'#9' '
      'PE'#9' '
      'PI'#9' '
      'RJ'#9' '
      'RN'#9' '
      'RS'#9' '
      'RO'#9' '
      'RR'#9' '
      'SC'#9' '
      'SP'#9' '
      'SE'#9' '
      'TO')
    ReadOnly = True
    TabOrder = 4
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = Form_PesquisaCidade.QueryPesquisa
    Left = 272
    Top = 64
  end
end
