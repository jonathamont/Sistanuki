inherited Form_CadastroCurso: TForm_CadastroCurso
  Caption = 'Cadastro Curso'
  ClientHeight = 564
  ClientWidth = 537
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 553
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited But_Pesquisa: TSpeedButton
    Left = 163
    Top = 186
    OnClick = But_PesquisaClick
    ExplicitLeft = 163
    ExplicitTop = 186
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 13
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = Edit_CodCurso
    OnClick = Label1Click
  end
  object Label2: TLabel [2]
    Left = 168
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Curso'
    FocusControl = Edit_NMCurso
  end
  object Label4: TLabel [3]
    Left = 16
    Top = 171
    Width = 72
    Height = 13
    Caption = 'Codigo Materia'
    FocusControl = Edit_CodMateria
  end
  object Label5: TLabel [4]
    Left = 192
    Top = 167
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit_NmMateria
  end
  object Label3: TLabel [5]
    Left = 16
    Top = 64
    Width = 83
    Height = 13
    Caption = 'Numero de Horas'
    FocusControl = Edit_Horas
  end
  inherited GroupBox1: TGroupBox
    Left = 0
    Top = 522
    Width = 537
    Height = 42
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 522
    ExplicitWidth = 537
    ExplicitHeight = 42
    inherited But_Salvar: TBitBtn
      Top = 11
      ExplicitTop = 11
    end
    inherited But_Sair: TBitBtn
      Left = 448
      Top = 11
      ExplicitLeft = 448
      ExplicitTop = 11
    end
  end
  inherited GroupSeparacao: TGroupBox
    Top = 247
    Width = 537
    Height = 275
    ExplicitTop = 247
    ExplicitWidth = 537
    ExplicitHeight = 275
    inherited GridItem: TDBGrid
      Width = 505
    end
  end
  object Edit_CodCurso: TDBEdit [8]
    Left = 16
    Top = 32
    Width = 134
    Height = 21
    DataField = 'CD_CURSO'
    DataSource = Form_PesquisaCurso.DataSourcePesquisa
    TabOrder = 2
  end
  object Edit_NMCurso: TDBEdit [9]
    Left = 168
    Top = 32
    Width = 302
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NM_CURSO'
    DataSource = Form_PesquisaCurso.DataSourcePesquisa
    TabOrder = 3
  end
  object Edit_CodMateria: TDBEdit [10]
    Left = 16
    Top = 187
    Width = 134
    Height = 21
    DataField = 'CD_MATERIA'
    DataSource = DataSourceItem
    Enabled = False
    TabOrder = 4
    OnExit = Edit_CodMateriaExit
  end
  object Edit_NmMateria: TDBEdit [11]
    Left = 192
    Top = 187
    Width = 250
    Height = 21
    DataField = 'NM_MATERIA'
    DataSource = DataSourceItem
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object Panel1: TPanel [12]
    Left = 0
    Top = 124
    Width = 537
    Height = 13
    TabOrder = 6
  end
  object Panel2: TPanel [13]
    Left = 0
    Top = 228
    Width = 537
    Height = 13
    TabOrder = 7
  end
  object Edit_Horas: TDBEdit [14]
    Left = 16
    Top = 80
    Width = 134
    Height = 21
    DataField = 'NR_HORAS'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  inherited DataSourceCadastro: TDataSource
    DataSet = Form_PesquisaCurso.QueryPesquisa
    Left = 184
    Top = 72
  end
  inherited QueryItem: TIBQuery
    SQL.Strings = (
      'select CM.*, M.NM_MATERIA  from TB_CURSO_MATERIA CM'
      'INNER JOIN TB_CURSO C ON (C.CD_CURSO = CM.CD_CURSO)'
      'INNER JOIN TB_MATERIA M ON (M.CD_MATERIA = CM.CD_MATERIA)'
      'WHERE CM.CD_CURSO = :CURSO'
      'ORDER BY C.CD_CURSO')
    Left = 296
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    object QueryItemCD_CURSO_MATERIA: TIntegerField
      FieldName = 'CD_CURSO_MATERIA'
      Origin = '"TB_CURSO_MATERIA"."CD_CURSO_MATERIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object QueryItemCD_CURSO: TIntegerField
      FieldName = 'CD_CURSO'
      Origin = '"TB_CURSO_MATERIA"."CD_CURSO"'
      Required = True
      Visible = False
    end
    object QueryItemCD_MATERIA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_MATERIA'
      Origin = '"TB_CURSO_MATERIA"."CD_MATERIA"'
      Required = True
    end
    object QueryItemNM_MATERIA: TIBStringField
      DisplayLabel = 'Materia'
      FieldName = 'NM_MATERIA'
      Origin = '"TB_MATERIA"."NM_MATERIA"'
      Required = True
      Size = 50
    end
  end
  inherited UpdateItem: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_CURSO_MATERIA,'
      '  CD_CURSO,'
      '  CD_MATERIA'
      'from TB_CURSO_MATERIA '
      'where'
      '  CD_CURSO_MATERIA = :CD_CURSO_MATERIA')
    ModifySQL.Strings = (
      'update TB_CURSO_MATERIA'
      'set'
      '  CD_CURSO_MATERIA = :CD_CURSO_MATERIA,'
      '  CD_CURSO = :CD_CURSO,'
      '  CD_MATERIA = :CD_MATERIA'
      'where'
      '  CD_CURSO_MATERIA = :OLD_CD_CURSO_MATERIA')
    InsertSQL.Strings = (
      'insert into TB_CURSO_MATERIA'
      '  (CD_CURSO_MATERIA, CD_CURSO, CD_MATERIA)'
      'values'
      '  (:CD_CURSO_MATERIA, :CD_CURSO, :CD_MATERIA)')
    DeleteSQL.Strings = (
      'delete from TB_CURSO_MATERIA'
      'where'
      '  CD_CURSO_MATERIA = :OLD_CD_CURSO_MATERIA')
    Left = 288
  end
  inherited DataSourceItem: TDataSource
    Left = 296
    Top = 384
  end
end
