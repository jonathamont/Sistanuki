inherited Form_CadastroTurma: TForm_CadastroTurma
  Caption = 'Cadastro Turmas'
  ClientHeight = 567
  ClientWidth = 833
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 849
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 308
    Top = 32
    OnClick = But_PesquisaClick
    ExplicitLeft = 308
    ExplicitTop = 32
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CodTurma
  end
  object Label2: TLabel [2]
    Left = 184
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Codigo Professor'
    FocusControl = Edit_CodProf
  end
  object Label3: TLabel [3]
    Left = 366
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit_NMProf
  end
  object Label4: TLabel [4]
    Left = 24
    Top = 64
    Width = 15
    Height = 13
    Caption = 'Dia'
  end
  object Label5: TLabel [5]
    Left = 160
    Top = 64
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object Label6: TLabel [6]
    Left = 256
    Top = 64
    Width = 64
    Height = 13
    Caption = 'Codigo Curso'
    FocusControl = Edit_CodCurso
  end
  object Label7: TLabel [7]
    Left = 440
    Top = 64
    Width = 28
    Height = 13
    Caption = 'Curso'
    FocusControl = Edit_NMCurso
  end
  object But_PesquisaCurso: TSpeedButton [8]
    Left = 411
    Top = 80
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
  object Label8: TLabel [9]
    Left = 24
    Top = 168
    Width = 54
    Height = 13
    Caption = 'CD_ALUNO'
    FocusControl = Edit_CodAluno
  end
  object Label9: TLabel [10]
    Left = 204
    Top = 168
    Width = 60
    Height = 13
    Caption = 'NM_PESSOA'
    FocusControl = Edit_NMPessoa
  end
  object But_PesquisaAluno: TSpeedButton [11]
    Left = 169
    Top = 183
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
    Top = 529
    Width = 833
    Height = 38
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 529
    ExplicitWidth = 833
    ExplicitHeight = 38
    inherited But_Salvar: TBitBtn
      Left = 16
      Top = 6
      ExplicitLeft = 16
      ExplicitTop = 6
    end
    inherited But_Sair: TBitBtn
      Left = 736
      Top = 6
      ExplicitLeft = 736
      ExplicitTop = 6
    end
  end
  inherited GroupSeparacao: TGroupBox
    Top = 248
    Width = 833
    ExplicitTop = 248
    ExplicitWidth = 833
    inherited GridItem: TDBGrid
      Width = 793
    end
  end
  object Edit_CodTurma: TDBEdit [14]
    Left = 24
    Top = 32
    Width = 134
    Height = 21
    DataField = 'CD_TURMA'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    TabOrder = 2
  end
  object Edit_CodProf: TDBEdit [15]
    Left = 184
    Top = 32
    Width = 97
    Height = 21
    DataField = 'CD_PROFESSOR'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    TabOrder = 3
    OnExit = Edit_CodProfExit
  end
  object Edit_NMProf: TDBEdit [16]
    Left = 366
    Top = 32
    Width = 353
    Height = 21
    DataField = 'NM_PESSOA'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    TabOrder = 4
  end
  object Edit_CodCurso: TDBEdit [17]
    Left = 256
    Top = 80
    Width = 134
    Height = 21
    DataField = 'CD_CURSO'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    TabOrder = 5
  end
  object Edit_NMCurso: TDBEdit [18]
    Left = 440
    Top = 80
    Width = 279
    Height = 21
    DataField = 'NM_CURSO'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    TabOrder = 6
  end
  object GroupBox2: TGroupBox [19]
    Left = 0
    Top = 128
    Width = 825
    Height = 25
    TabOrder = 7
  end
  object Edit_CodAluno: TDBEdit [20]
    Left = 24
    Top = 184
    Width = 134
    Height = 21
    DataField = 'CD_ALUNO'
    DataSource = DataSourceItem
    TabOrder = 8
  end
  object Edit_NMPessoa: TDBEdit [21]
    Left = 204
    Top = 184
    Width = 437
    Height = 21
    DataField = 'NM_PESSOA'
    DataSource = DataSourceItem
    TabOrder = 9
  end
  object Combo_Dia: TDBComboBox [22]
    Left = 22
    Top = 80
    Width = 105
    Height = 21
    DataField = 'DS_DIA'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    Items.Strings = (
      'SEGUNDA'
      'TER'#199'A'
      'QUARTA'
      'QUINTA'
      'SEXTA'
      'SABADO'
      'DOMINGO')
    TabOrder = 10
  end
  object Combo_Periodo: TDBComboBox [23]
    Left = 160
    Top = 80
    Width = 73
    Height = 21
    DataField = 'DS_PERIODO'
    DataSource = Form_PesquisaTurma.DataSourcePesquisa
    Items.Strings = (
      'MANH'#195
      'TARDE'
      'NOITE')
    TabOrder = 11
  end
  inherited DataSourceCadastro: TDataSource
    Left = 592
    Top = 0
  end
  inherited QueryItem: TIBQuery
    SQL.Strings = (
      'SELECT T.*,P.NM_PESSOA  FROM  TB_TURMA_ALUNO T'
      'INNER JOIN TB_PESSOA P ON(P.CD_PESSOA = T.CD_ALUNO)'
      'WHERE CD_TURMA = :TURMA'
      'ORDER BY T.CD_ALUNO ')
    Left = 520
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end>
    object QueryItemCD_TURMA_ALUNO: TIntegerField
      FieldName = 'CD_TURMA_ALUNO'
      Origin = '"TB_TURMA_ALUNO"."CD_TURMA_ALUNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryItemCD_TURMA: TIntegerField
      DisplayLabel = 'Codigo Turma'
      FieldName = 'CD_TURMA'
      Origin = '"TB_TURMA_ALUNO"."CD_TURMA"'
      Required = True
    end
    object QueryItemCD_ALUNO: TIntegerField
      DisplayLabel = 'Codigo Aluno'
      FieldName = 'CD_ALUNO'
      Origin = '"TB_TURMA_ALUNO"."CD_ALUNO"'
      Required = True
    end
    object QueryItemNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryItemPC_FREQ: TIBBCDField
      DisplayLabel = 'Frquencia'
      FieldName = 'PC_FREQ'
      Origin = '"TB_TURMA_ALUNO"."PC_FREQ"'
      Precision = 9
      Size = 2
    end
  end
  inherited UpdateItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_TURMA_ALUNO,'
      '  CD_TURMA,'
      '  CD_ALUNO,'
      '  PC_FREQ'
      'from TB_TURMA_ALUNO '
      'where'
      '  CD_TURMA_ALUNO = :CD_TURMA_ALUNO')
    ModifySQL.Strings = (
      'update TB_TURMA_ALUNO'
      'set'
      '  CD_TURMA_ALUNO = :CD_TURMA_ALUNO,'
      '  CD_TURMA = :CD_TURMA,'
      '  CD_ALUNO = :CD_ALUNO'
      'where'
      '  CD_TURMA_ALUNO = :OLD_CD_TURMA_ALUNO')
    InsertSQL.Strings = (
      'insert into TB_TURMA_ALUNO'
      '  (CD_TURMA_ALUNO, CD_TURMA, CD_ALUNO)'
      'values'
      '  (:CD_TURMA_ALUNO, :CD_TURMA, :CD_ALUNO)')
    DeleteSQL.Strings = (
      'delete from TB_TURMA_ALUNO'
      'where'
      '  CD_TURMA_ALUNO = :OLD_CD_TURMA_ALUNO')
    Left = 576
    Top = 424
  end
  inherited DataSourceItem: TDataSource
    Left = 632
    Top = 416
  end
end
