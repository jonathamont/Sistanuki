inherited Form_CadastroAula: TForm_CadastroAula
  Caption = 'Cadastro Aula'
  ClientHeight = 605
  ClientWidth = 816
  OnCreate = FormCreate
  ExplicitWidth = 832
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 125
    Top = 24
    OnClick = But_PesquisaClick
    ExplicitLeft = 125
    ExplicitTop = 24
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CdAula
  end
  object Label2: TLabel [2]
    Left = 159
    Top = 7
    Width = 30
    Height = 13
    Caption = 'Turma'
    FocusControl = Edit_CdTurma
  end
  object Label3: TLabel [3]
    Left = 24
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Codigo Prof'
    FocusControl = Edit_CdProf
  end
  object Label4: TLabel [4]
    Left = 160
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit_NmProf
  end
  object Label5: TLabel [5]
    Left = 304
    Top = 7
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = Edit_Data
  end
  object Label6: TLabel [6]
    Left = 464
    Top = 7
    Width = 63
    Height = 13
    Caption = 'Horario Inicio'
    FocusControl = Edit_HrInicio
  end
  object Label7: TLabel [7]
    Left = 640
    Top = 7
    Width = 52
    Height = 13
    Caption = 'Horario fim'
    FocusControl = EditHrFim
  end
  object Label8: TLabel [8]
    Left = 24
    Top = 176
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CdAluno
  end
  object Label9: TLabel [9]
    Left = 61
    Top = 176
    Width = 27
    Height = 13
    Caption = 'Aluno'
    FocusControl = Edit_NmPessoa
  end
  object Label10: TLabel [10]
    Left = 24
    Top = 224
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CdMateria
  end
  object Label11: TLabel [11]
    Left = 63
    Top = 224
    Width = 36
    Height = 13
    Caption = 'Materia'
    FocusControl = Edit_NmMateria
  end
  object But_PesquisaMat: TSpeedButton [12]
    Left = 170
    Top = 239
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
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 560
    Width = 816
    Height = 45
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 560
    ExplicitWidth = 816
    ExplicitHeight = 45
    inherited But_Salvar: TBitBtn
      Left = 16
      Top = 6
      ExplicitLeft = 16
      ExplicitTop = 6
    end
    inherited But_Sair: TBitBtn
      Left = 728
      Top = 6
      ExplicitLeft = 728
      ExplicitTop = 6
    end
  end
  inherited GroupSeparacao: TGroupBox
    Top = 279
    Width = 816
    ExplicitTop = 279
    ExplicitWidth = 816
    inherited But_Item_Novo: TSpeedButton
      Enabled = False
      Visible = False
    end
    inherited GridItem: TDBGrid
      Width = 785
    end
  end
  object Edit_CdAula: TDBEdit [15]
    Left = 24
    Top = 24
    Width = 92
    Height = 21
    DataField = 'CD_AULA'
    DataSource = DataSourceCadastro
    ReadOnly = True
    TabOrder = 2
  end
  object Edit_CdTurma: TDBEdit [16]
    Left = 159
    Top = 23
    Width = 134
    Height = 21
    DataField = 'CD_TURMA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object Edit_CdProf: TDBEdit [17]
    Left = 24
    Top = 64
    Width = 92
    Height = 21
    DataField = 'CD_PROF'
    DataSource = DataSourceCadastro
    Enabled = False
    TabOrder = 4
  end
  object Edit_NmProf: TDBEdit [18]
    Left = 160
    Top = 64
    Width = 329
    Height = 21
    DataField = 'NM_PESSOA'
    DataSource = DataSourceCadastro
    ReadOnly = True
    TabOrder = 5
  end
  object Edit_Data: TDBEdit [19]
    Left = 304
    Top = 23
    Width = 134
    Height = 21
    DataField = 'DT_AULA'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object Edit_HrInicio: TDBEdit [20]
    Left = 464
    Top = 23
    Width = 134
    Height = 21
    DataField = 'HR_INICIO'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object EditHrFim: TDBEdit [21]
    Left = 640
    Top = 23
    Width = 134
    Height = 21
    DataField = 'HR_FIM'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  object But_AdiconaAlunos: TBitBtn [22]
    Left = 24
    Top = 101
    Width = 134
    Height = 38
    Caption = 'Adiconar Alunos'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    TabOrder = 9
    OnClick = But_AdiconaAlunosClick
  end
  object RadioEncerrado: TDBRadioGroup [23]
    Left = 511
    Top = 50
    Width = 104
    Height = 57
    Caption = 'Encerrada?'
    Columns = 2
    DataField = 'FG_ENCERRADA'
    DataSource = Form_PesquisaAula.DataSourcePesquisa
    Items.Strings = (
      'Sim'
      'N'#227'o')
    ReadOnly = True
    TabOrder = 10
    Values.Strings = (
      'S'
      'N')
  end
  object RadioProfPres: TDBRadioGroup [24]
    Left = 640
    Top = 58
    Width = 113
    Height = 49
    Caption = 'Professor Presente?'
    Columns = 2
    DataField = 'FG_PROF_PRESENT'
    DataSource = Form_PesquisaAula.DataSourcePesquisa
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 11
    Values.Strings = (
      'S'
      'N')
  end
  object Panel1: TPanel [25]
    Left = 0
    Top = 145
    Width = 816
    Height = 25
    BorderStyle = bsSingle
    TabOrder = 12
  end
  object Edit_CdAluno: TDBEdit [26]
    Left = 24
    Top = 192
    Width = 81
    Height = 21
    DataField = 'CD_ALUNO'
    DataSource = DataSourceItem
    TabOrder = 13
  end
  object Edit_NmPessoa: TDBEdit [27]
    Left = 125
    Top = 192
    Width = 292
    Height = 21
    DataField = 'NM_PESSOA'
    DataSource = DataSourceItem
    ReadOnly = True
    TabOrder = 14
  end
  object Edit_CdMateria: TDBEdit [28]
    Left = 24
    Top = 240
    Width = 134
    Height = 21
    DataField = 'CD_MATERIA'
    DataSource = DataSourceItem
    TabOrder = 15
  end
  object Edit_NmMateria: TDBEdit [29]
    Left = 208
    Top = 240
    Width = 209
    Height = 21
    DataField = 'NM_MATERIA'
    DataSource = DataSourceItem
    ReadOnly = True
    TabOrder = 16
  end
  object RadioPresenca: TDBRadioGroup [30]
    Left = 464
    Top = 192
    Width = 63
    Height = 69
    Caption = 'Presente'
    DataField = 'FG_PRESENCA'
    DataSource = DataSourceItem
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 17
    Values.Strings = (
      'S'
      'N')
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = Form_PesquisaAula.QueryPesquisa
    Left = 760
    Top = 48
  end
  inherited QueryItem: TIBQuery
    SQL.Strings = (
      'select a.*,p.nm_pessoa, m.nm_materia  from tb_aula_aluno a'
      'inner join tb_pessoa p on(p.cd_pessoa = a.cd_aluno)'
      'inner join tb_materia m on(m.cd_materia = a.cd_materia)'
      'where a.cd_aula = :aula'
      'order by p.nm_pessoa')
    Left = 688
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'aula'
        ParamType = ptUnknown
      end>
    object QueryItemCD_AULA_ALUNO: TIntegerField
      FieldName = 'CD_AULA_ALUNO'
      Origin = '"TB_AULA_ALUNO"."CD_AULA_ALUNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object QueryItemCD_AULA: TIntegerField
      DisplayLabel = 'Codigo_Aula'
      FieldName = 'CD_AULA'
      Origin = '"TB_AULA_ALUNO"."CD_AULA"'
      Required = True
      Visible = False
    end
    object QueryItemCD_ALUNO: TIntegerField
      DisplayLabel = 'Aluno'
      FieldName = 'CD_ALUNO'
      Origin = '"TB_AULA_ALUNO"."CD_ALUNO"'
      Required = True
    end
    object QueryItemNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryItemCD_MATERIA: TIntegerField
      DisplayLabel = 'Cod. Materia'
      FieldName = 'CD_MATERIA'
      Origin = '"TB_AULA_ALUNO"."CD_MATERIA"'
      Required = True
    end
    object QueryItemNM_MATERIA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_MATERIA'
      Origin = '"TB_MATERIA"."NM_MATERIA"'
      Required = True
      Size = 50
    end
    object QueryItemFG_PRESENCA: TIBStringField
      DisplayLabel = 'Presente'
      FieldName = 'FG_PRESENCA'
      Origin = '"TB_AULA_ALUNO"."FG_PRESENCA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryItemFG_EXP: TIBStringField
      DisplayLabel = 'Aula Exp'
      FieldName = 'FG_EXP'
      Origin = '"TB_AULA_ALUNO"."FG_EXP"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  inherited UpdateItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from tb_aula_aluno '
      'where'
      '  CD_AULA_ALUNO = :CD_AULA_ALUNO and'
      '  CD_ALUNO = :CD_ALUNO')
    ModifySQL.Strings = (
      'update tb_aula_aluno'
      'set'
      '  CD_AULA_ALUNO = :CD_AULA_ALUNO,'
      '  CD_AULA = :CD_AULA,'
      '  CD_ALUNO = :CD_ALUNO,'
      '  CD_MATERIA = :CD_MATERIA,'
      '  FG_PRESENCA = :FG_PRESENCA,'
      '  FG_EXP = :FG_EXP'
      'where'
      '  CD_AULA_ALUNO = :OLD_CD_AULA_ALUNO and'
      '  CD_ALUNO = :OLD_CD_ALUNO')
    InsertSQL.Strings = (
      'insert into tb_aula_aluno'
      
        '  (CD_AULA_ALUNO, CD_AULA, CD_ALUNO, CD_MATERIA, FG_PRESENCA, FG' +
        '_EXP)'
      'values'
      
        '  (:CD_AULA_ALUNO, :CD_AULA, :CD_ALUNO, :CD_MATERIA, :FG_PRESENC' +
        'A, :FG_EXP)')
    DeleteSQL.Strings = (
      'delete from tb_aula_aluno'
      'where'
      '  CD_AULA_ALUNO = :OLD_CD_AULA_ALUNO and'
      '  CD_ALUNO = :OLD_CD_ALUNO')
    Left = 688
    Top = 416
  end
  inherited DataSourceItem: TDataSource
    Left = 688
    Top = 472
  end
end
