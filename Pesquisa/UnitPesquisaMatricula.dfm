inherited Form_PesquisaMatricula: TForm_PesquisaMatricula
  Caption = 'Pesquisa Matricula'
  ClientHeight = 568
  ClientWidth = 807
  ExplicitTop = -43
  ExplicitWidth = 823
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 280
    Top = 248
    Width = 43
    Height = 13
    Caption = 'Matr'#237'cula'
  end
  object Label2: TLabel [1]
    Left = 280
    Top = 440
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
  end
  object Label3: TLabel [2]
    Left = 280
    Top = 632
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label4: TLabel [3]
    Left = 280
    Top = 824
    Width = 56
    Height = 13
    Caption = 'C'#243'd. Turma'
  end
  object Label5: TLabel [4]
    Left = 280
    Top = 1016
    Width = 28
    Height = 13
    Caption = 'Curso'
  end
  object Label6: TLabel [5]
    Left = 280
    Top = 1208
    Width = 69
    Height = 13
    Caption = 'Data Matricula'
  end
  inherited GridPesquisa: TDBGrid
    Width = 807
    Height = 452
  end
  inherited GroupBox: TGroupBox
    Width = 807
    ExplicitTop = -6
    ExplicitWidth = 807
    inherited RadioFiltro: TRadioGroup
      ItemIndex = 0
    end
    inherited ButPesquisa: TBitBtn
      OnClick = ButPesquisaClick
    end
  end
  inherited Panel1: TPanel
    Top = 527
    Width = 807
    inherited But_Alterar: TBitBtn
      Top = 6
      OnClick = But_AlterarClick
      ExplicitTop = 6
    end
    object Btn_Novo: TBitBtn
      Left = 24
      Top = 8
      Width = 71
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
      OnClick = Btn_NovoClick
    end
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select m.*, p.nm_pessoa p, c.nm_curso from tb_matricula m'
      'inner join tb_pessoa p on (p.cd_pessoa = m.cd_pessoa)'
      'inner join tb_turma t on (t.cd_turma = m.cd_turma)'
      'inner join tb_curso c on (c.cd_curso = t.cd_curso)'
      'order by p.nm_pessoa')
    object QueryPesquisaCD_MATRICULA: TIntegerField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'CD_MATRICULA'
      Origin = '"TB_MATRICULA"."CD_MATRICULA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaCD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_PESSOA'
      Origin = '"TB_MATRICULA"."CD_PESSOA"'
      Required = True
    end
    object QueryPesquisaP: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'P'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaCD_TURMA: TIntegerField
      DisplayLabel = 'C'#243'd. Turma'
      FieldName = 'CD_TURMA'
      Origin = '"TB_MATRICULA"."CD_TURMA"'
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      DisplayLabel = 'Curso'
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
    object QueryPesquisaDT_MATRICULA: TDateField
      DisplayLabel = 'Data Matricula'
      FieldName = 'DT_MATRICULA'
      Origin = '"TB_MATRICULA"."DT_MATRICULA"'
      Required = True
      EditMask = '## /##/####;1;_'
    end
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_matricula '
      'where'
      '  CD_MATRICULA = :CD_MATRICULA')
    ModifySQL.Strings = (
      'update tb_matricula'
      'set'
      '  CD_MATRICULA = :CD_MATRICULA,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  CD_TURMA = :CD_TURMA,'
      '  DT_MATRICULA = :DT_MATRICULA'
      'where'
      '  CD_MATRICULA = :OLD_CD_MATRICULA')
    InsertSQL.Strings = (
      'insert into tb_matricula'
      '  (CD_MATRICULA, CD_PESSOA, CD_TURMA, DT_MATRICULA)'
      'values'
      '  (:CD_MATRICULA, :CD_PESSOA, :CD_TURMA, :DT_MATRICULA)')
    DeleteSQL.Strings = (
      'delete from tb_matricula'
      'where'
      '  CD_MATRICULA = :OLD_CD_MATRICULA')
  end
end
