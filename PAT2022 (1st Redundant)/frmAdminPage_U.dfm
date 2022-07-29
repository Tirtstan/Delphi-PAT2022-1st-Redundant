object frmAdminPage: TfrmAdminPage
  Left = 0
  Top = 0
  Caption = 'Admin Page'
  ClientHeight = 734
  ClientWidth = 1120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = -9
    Top = 0
    Width = 1130
    Height = 737
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 111
    Top = 15
    Width = 899
    Height = 57
    BevelOuter = bvNone
    Color = 4822522
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object btnStudents: TButton
      Left = 8
      Top = 7
      Width = 153
      Height = 42
      Caption = 'tblStudents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnStudentsClick
    end
    object btnUniversities: TButton
      Left = 175
      Top = 7
      Width = 153
      Height = 42
      Caption = 'tblUniveristies'
      TabOrder = 1
      OnClick = btnUniversitiesClick
    end
    object btnUniversityReviews: TButton
      Left = 350
      Top = 7
      Width = 195
      Height = 42
      Caption = 'tblUniversityReviews'
      TabOrder = 2
      OnClick = btnUniversityReviewsClick
    end
    object btnCourses: TButton
      Left = 568
      Top = 7
      Width = 153
      Height = 42
      Caption = 'tblCourses'
      TabOrder = 3
      OnClick = btnCoursesClick
    end
    object btnCourseReviews: TButton
      Left = 740
      Top = 7
      Width = 153
      Height = 42
      Caption = 'tblCourseReviews'
      TabOrder = 4
      OnClick = btnCourseReviewsClick
    end
  end
  object btnBack: TButton
    Left = 8
    Top = 24
    Width = 97
    Height = 41
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnBackClick
  end
  object Button1: TButton
    Left = 1015
    Top = 22
    Width = 97
    Height = 41
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Panel3: TPanel
    Left = 111
    Top = 104
    Width = 899
    Height = 441
    BevelOuter = bvNone
    Color = 4822522
    ParentBackground = False
    TabOrder = 4
    object Panel9: TPanel
      Left = 8
      Top = 8
      Width = 881
      Height = 425
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object lblTitle: TLabel
        Left = 8
        Top = 8
        Width = 247
        Height = 21
        Caption = 'Select a database to view above:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object cmbSearch: TComboBox
        Left = 480
        Top = 10
        Width = 146
        Height = 23
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TextHint = 'Choose a column...'
        OnChange = cmbSearchChange
        OnClick = cmbSearchClick
      end
      object srchDatabase: TSearchBox
        Left = 632
        Top = 10
        Width = 241
        Height = 23
        TabOrder = 1
        TextHint = 'Search...'
        OnChange = srchDatabaseChange
        OnClick = srchDatabaseClick
      end
      object dbgDatabase: TDBGrid
        Left = 8
        Top = 39
        Width = 865
        Height = 378
        Color = 11759493
        FixedColor = 11759493
        GradientEndColor = 11759493
        GradientStartColor = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
      end
    end
  end
  object Panel4: TPanel
    Left = 111
    Top = 560
    Width = 899
    Height = 153
    BevelOuter = bvNone
    Color = 4822522
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    object Panel5: TPanel
      Left = 8
      Top = 8
      Width = 153
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object btnFirst: TButton
        Left = 8
        Top = 8
        Width = 137
        Height = 58
        Caption = 'First'
        TabOrder = 0
        OnClick = btnFirstClick
      end
      object btnLast: TButton
        Left = 8
        Top = 72
        Width = 137
        Height = 57
        Caption = 'Last'
        TabOrder = 1
        OnClick = btnLastClick
      end
    end
    object Panel6: TPanel
      Left = 167
      Top = 8
      Width = 153
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 1
      object btnPrior: TButton
        Left = 8
        Top = 8
        Width = 137
        Height = 57
        Caption = 'Prior'
        TabOrder = 0
        OnClick = btnPriorClick
      end
      object btnNext: TButton
        Left = 8
        Top = 71
        Width = 137
        Height = 57
        Caption = 'Next'
        TabOrder = 1
        OnClick = btnNextClick
      end
    end
    object Panel7: TPanel
      Left = 326
      Top = 8
      Width = 259
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 2
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 8
        Width = 245
        Height = 57
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
        TabOrder = 0
      end
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 71
        Width = 245
        Height = 57
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
    end
    object Panel8: TPanel
      Left = 591
      Top = 8
      Width = 298
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 216
        Height = 20
        Caption = 'Enter a custom SQL statement:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object redSQL: TRichEdit
        Left = 8
        Top = 28
        Width = 281
        Height = 102
        Hint = 'Enter a custom SQL statement here... (Enter key executes it)'
        BorderStyle = bsNone
        Color = 11759493
        EditMargins.Left = 3
        EditMargins.Right = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = True
        TabOrder = 0
        OnChange = redSQLChange
        OnKeyPress = redSQLKeyPress
      end
    end
  end
end
