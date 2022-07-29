object frmUniversityInfo: TfrmUniversityInfo
  Left = 0
  Top = 0
  Caption = 'University Info'
  ClientHeight = 718
  ClientWidth = 1109
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1113
    Height = 721
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 24
      Top = 64
      Width = 361
      Height = 585
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object imgUni: TImage
        Left = 8
        Top = 80
        Width = 345
        Height = 201
        Center = True
        Proportional = True
      end
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 345
        Height = 57
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object lblUniTitle: TLabel
          Left = 8
          Top = 13
          Width = 329
          Height = 30
          Alignment = taCenter
          AutoSize = False
          Caption = 'lblUniTitle'
          Color = 4822522
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnMouseEnter = lblUniTitleMouseEnter
          OnMouseLeave = lblUniTitleMouseLeave
        end
      end
      object Panel4: TPanel
        Left = 8
        Top = 296
        Width = 345
        Height = 193
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 92
          Height = 21
          Caption = 'Description:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redDescription: TRichEdit
          Left = 8
          Top = 35
          Width = 329
          Height = 142
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Description Here')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel11: TPanel
        Left = 8
        Top = 495
        Width = 345
        Height = 82
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object lblProvince: TLabel
          Left = 8
          Top = 8
          Width = 87
          Height = 21
          Caption = 'lblProvince'
        end
        object lblPublic: TLabel
          Left = 8
          Top = 43
          Width = 68
          Height = 21
          Caption = 'lblPublic'
        end
        object lblRatingVisual: TLabel
          Left = 222
          Top = 8
          Width = 117
          Height = 21
          Alignment = taRightJustify
          Caption = 'lblRatingVisual'
        end
        object lblRating: TLabel
          Left = 270
          Top = 43
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Caption = 'lblRating'
        end
      end
    end
    object btnBack: TButton
      Left = 11
      Top = 9
      Width = 105
      Height = 49
      Caption = 'Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnBackClick
    end
    object Panel5: TPanel
      Left = 424
      Top = 64
      Width = 625
      Height = 585
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 2
      object Panel6: TPanel
        Left = 8
        Top = 8
        Width = 609
        Height = 57
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 13
          Width = 593
          Height = 28
          Alignment = taCenter
          AutoSize = False
          Caption = 'University Reviews'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlButtons1: TPanel
        Left = 8
        Top = 384
        Width = 178
        Height = 193
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object Panel10: TPanel
          Left = 8
          Top = 112
          Width = 161
          Height = 73
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object bitDeleteReview: TBitBtn
            Left = 8
            Top = 8
            Width = 145
            Height = 57
            Caption = 'Delete Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkCancel
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitDeleteReviewClick
          end
        end
        object Panel9: TPanel
          Left = 8
          Top = 17
          Width = 161
          Height = 73
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object bitWriteReview: TBitBtn
            Left = 8
            Top = 8
            Width = 145
            Height = 57
            Caption = 'Write a Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkAll
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitWriteReviewClick
          end
        end
      end
      object pnlWriteReview: TPanel
        Left = 360
        Top = 384
        Width = 257
        Height = 193
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 118
          Height = 21
          Caption = 'Write a Review:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblMaxCharacters: TLabel
          Left = 8
          Top = 167
          Width = 123
          Height = 17
          Caption = 'Max Characters: 255'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object redReview: TRichEdit
          Left = 8
          Top = 35
          Width = 241
          Height = 126
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Your review here')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = redReviewChange
        end
      end
      object Panel8: TPanel
        Left = 192
        Top = 80
        Width = 425
        Height = 289
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 4
        object Label4: TLabel
          Left = 8
          Top = 7
          Width = 159
          Height = 21
          Caption = 'University'#39's Reviews:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redReviews: TRichEdit
          Left = 8
          Top = 34
          Width = 409
          Height = 241
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Reviews Here')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object cmbStudents: TComboBox
          Left = 272
          Top = 5
          Width = 145
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = 'Select Student...'
          OnChange = cmbStudentsChange
        end
      end
      object pnlLst: TPanel
        Left = 9
        Top = 79
        Width = 177
        Height = 290
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 5
        object lblUniverCourses: TLabel
          Left = 8
          Top = 8
          Width = 156
          Height = 21
          Caption = 'University'#39's Courses:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = lblUniverCoursesClick
          OnMouseEnter = lblUniverCoursesMouseEnter
          OnMouseLeave = lblUniverCoursesMouseLeave
        end
        object lstUniCourses: TListBox
          Left = 8
          Top = 35
          Width = 161
          Height = 182
          Style = lbOwnerDrawFixed
          AutoComplete = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ItemHeight = 50
          Items.Strings = (
            'Course 1'
            'Course 2'
            'Course 3')
          ParentFont = False
          TabOrder = 0
          OnClick = lstUniCoursesClick
        end
        object Panel7: TPanel
          Left = 8
          Top = 223
          Width = 161
          Height = 58
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object btnMoreInfo: TButton
            Left = 8
            Top = 8
            Width = 145
            Height = 41
            Caption = 'More Info'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnMoreInfoClick
          end
        end
      end
      object pnlButtons3: TPanel
        Left = 192
        Top = 385
        Width = 162
        Height = 105
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 6
        object Panel13: TPanel
          Left = 8
          Top = 16
          Width = 145
          Height = 75
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object btnShowProfile: TButton
            Left = 8
            Top = 8
            Width = 129
            Height = 58
            Caption = 'Show Profile'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnShowProfileClick
          end
        end
      end
      object pnlButtons2: TPanel
        Left = 192
        Top = 481
        Width = 162
        Height = 96
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 3
        object pnlConfirmReview: TPanel
          Left = 8
          Top = 15
          Width = 145
          Height = 72
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object bitConfirmReview: TBitBtn
            Left = 8
            Top = 8
            Width = 129
            Height = 57
            Caption = 'Confirm Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkOK
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitConfirmReviewClick
          end
        end
      end
    end
    object btnClose: TButton
      Left = 992
      Top = 9
      Width = 105
      Height = 49
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
end
