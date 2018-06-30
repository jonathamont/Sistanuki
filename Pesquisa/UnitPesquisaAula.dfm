inherited Form_PesquisaAula: TForm_PesquisaAula
  Caption = 'Pesquisa Aula'
  ExplicitWidth = 819
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited GridPesquisa: TDBGrid
    Top = 89
    Height = 481
  end
  inherited GroupBox: TGroupBox
    Height = 89
    ExplicitHeight = 89
    object Label1: TLabel [0]
      Left = 378
      Top = 49
      Width = 51
      Height = 13
      Caption = 'Data Inicio'
    end
    object Label2: TLabel [1]
      Left = 512
      Top = 49
      Width = 42
      Height = 13
      Caption = 'Data Fim'
    end
    inherited RadioFiltro: TRadioGroup
      Items.Strings = (
        'Codigo'
        'Professor'
        'Data'
        'Turma'
        'Encerradas')
    end
    inherited ButPesquisa: TBitBtn
      OnClick = ButPesquisaClick
    end
    object Edit_DtInicio: TMaskEdit
      Left = 378
      Top = 62
      Width = 94
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
    end
    object Edit_DtFim: TMaskEdit
      Left = 512
      Top = 62
      Width = 96
      Height = 21
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
    end
  end
  inherited Panel1: TPanel
    inherited But_Alterar: TBitBtn
      OnClick = But_AlterarClick
    end
  end
  inherited But_Novo: TBitBtn
    OnClick = But_NovoClick
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select a.*,p.nm_pessoa  from TB_AULA a'
      'inner join tb_pessoa p on(p.cd_pessoa = a.cd_prof)'
      'order by a.dt_aula')
    object QueryPesquisaFG_PROF_PRESENT: TIBStringField
      DisplayLabel = 'Prof Presente?'
      FieldName = 'FG_PROF_PRESENT'
      Origin = '"TB_AULA"."FG_PROF_PRESENT"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_ENCERRADA: TIBStringField
      DisplayLabel = 'Encerrada?'
      FieldName = 'FG_ENCERRADA'
      Origin = '"TB_AULA"."FG_ENCERRADA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaHR_FIM: TTimeField
      DisplayLabel = 'Horario fim'
      FieldName = 'HR_FIM'
      Origin = '"TB_AULA"."HR_FIM"'
      Required = True
    end
    object QueryPesquisaHR_INICIO: TTimeField
      DisplayLabel = 'Horario Inicio'
      FieldName = 'HR_INICIO'
      Origin = '"TB_AULA"."HR_INICIO"'
      Required = True
    end
    object QueryPesquisaDT_AULA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DT_AULA'
      Origin = '"TB_AULA"."DT_AULA"'
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaCD_PROF: TIntegerField
      DisplayLabel = 'Codigo Prof'
      FieldName = 'CD_PROF'
      Origin = '"TB_AULA"."CD_PROF"'
      Required = True
    end
    object QueryPesquisaCD_TURMA: TIntegerField
      DisplayLabel = 'Turma'
      FieldName = 'CD_TURMA'
      Origin = '"TB_AULA"."CD_TURMA"'
      Required = True
    end
    object QueryPesquisaCD_AULA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_AULA'
      Origin = '"TB_AULA"."CD_AULA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
