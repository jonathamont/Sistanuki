object Form_PesquisaBase: TForm_PesquisaBase
  Left = 0
  Top = 0
  Caption = 'Pesquisa Base'
  ClientHeight = 611
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Pesquisa: TLabel
    Left = 378
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Pesquisa'
  end
  object GridPesquisa: TDBGrid
    Left = 0
    Top = 75
    Width = 803
    Height = 495
    Align = alClient
    DataSource = DataSourcePesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridPesquisaDblClick
  end
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 803
    Height = 75
    Align = alTop
    TabOrder = 1
    object RadioFiltro: TRadioGroup
      Left = 16
      Top = 16
      Width = 345
      Height = 49
      Caption = 'Op'#231#245'es de Filtro'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Codigo'
        'Nome')
      TabOrder = 0
      OnClick = RadioFiltroClick
    end
    object MaskEditPesquisa: TMaskEdit
      Left = 378
      Top = 27
      Width = 231
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = ''
    end
    object ButPesquisa: TBitBtn
      Left = 634
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
    end
    object But_Imprimir: TBitBtn
      Left = 715
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 570
    Width = 803
    Height = 41
    Align = alBottom
    TabOrder = 2
    object But_Alterar: TBitBtn
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 0
    end
    object ButSair: TBitBtn
      Left = 710
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sair'
      ModalResult = 8
      TabOrder = 1
      OnClick = ButSairClick
    end
    object But_Excluir: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
  end
  object But_Novo: TBitBtn
    Left = 16
    Top = 578
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
  end
  object QueryPesquisa: TIBQuery
    Database = CONEXAO.DB
    Transaction = CONEXAO.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UpdateObject = UpdateCadastro
    Left = 664
    Top = 128
  end
  object DataSourcePesquisa: TDataSource
    DataSet = QueryPesquisa
    Left = 592
    Top = 128
  end
  object UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_AULA,'
      '  CD_TURMA,'
      '  CD_PROF,'
      '  DT_AULA,'
      '  HR_INICIO,'
      '  HR_FIM,'
      '  FG_ENCERRADA,'
      '  FG_PROF_PRESENT'
      'from TB_AULA '
      'where'
      '  CD_AULA = :CD_AULA')
    ModifySQL.Strings = (
      'update TB_AULA'
      'set'
      '  CD_AULA = :CD_AULA,'
      '  CD_TURMA = :CD_TURMA,'
      '  CD_PROF = :CD_PROF,'
      '  DT_AULA = :DT_AULA,'
      '  HR_INICIO = :HR_INICIO,'
      '  HR_FIM = :HR_FIM,'
      '  FG_ENCERRADA = :FG_ENCERRADA,'
      '  FG_PROF_PRESENT = :FG_PROF_PRESENT'
      'where'
      '  CD_AULA = :OLD_CD_AULA')
    InsertSQL.Strings = (
      'insert into TB_AULA'
      
        '  (CD_AULA, CD_TURMA, CD_PROF, DT_AULA, HR_INICIO, HR_FIM, FG_EN' +
        'CERRADA, '
      '   FG_PROF_PRESENT)'
      'values'
      
        '  (:CD_AULA, :CD_TURMA, :CD_PROF, :DT_AULA, :HR_INICIO, :HR_FIM,' +
        ' :FG_ENCERRADA, '
      '   :FG_PROF_PRESENT)')
    DeleteSQL.Strings = (
      'delete from TB_AULA'
      'where'
      '  CD_AULA = :OLD_CD_AULA')
    Left = 456
    Top = 352
  end
end
