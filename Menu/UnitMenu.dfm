object Form_Menu: TForm_Menu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 567
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 104
    Top = 8
    object Pessoas: TMenuItem
      Caption = 'Pessoas'
      object Menu_Pessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = Menu_PessoaClick
      end
      object Menu_Cidade: TMenuItem
        Caption = 'Cidade'
        OnClick = Menu_CidadeClick
      end
      object Menu_Matricula: TMenuItem
        Caption = 'Matr'#237'cula'
        OnClick = Menu_MatriculaClick
      end
    end
    object Aulas: TMenuItem
      Caption = 'Aulas'
      object Menu_AulaExperimental: TMenuItem
        Caption = 'Aula Experimental'
        OnClick = Menu_AulaExperimentalClick
      end
      object Aula1: TMenuItem
        Caption = 'Aula'
        OnClick = Aula1Click
      end
    end
    object Cursos: TMenuItem
      Caption = 'Cursos'
      object Menu_Materia: TMenuItem
        Caption = 'Mat'#233'ria'
        OnClick = Menu_MateriaClick
      end
      object Menu_Curso: TMenuItem
        Caption = 'Curso'
        OnClick = Menu_CursoClick
      end
    end
    object Turmas: TMenuItem
      Caption = 'Turmas'
      object Menu_turma: TMenuItem
        Caption = 'Turma'
        OnClick = Menu_turmaClick
      end
    end
  end
end
