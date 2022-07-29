object frmRegister: TfrmRegister
  Left = 0
  Top = 0
  Caption = 'Register'
  ClientHeight = 735
  ClientWidth = 1123
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = -6
    Width = 1129
    Height = 741
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 464
      Top = 48
      Width = 205
      Height = 71
      Caption = 'Register'
      Color = 4822522
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -53
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Panel6: TPanel
      Left = 480
      Top = 584
      Width = 153
      Height = 57
      BevelOuter = bvNone
      Caption = 'Panel6'
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object btnRegisterR: TButton
        Left = 8
        Top = 8
        Width = 137
        Height = 41
        Caption = 'Register'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnRegisterRClick
      end
    end
  end
  object Panel3: TPanel
    Left = 136
    Top = 136
    Width = 385
    Height = 417
    BevelOuter = bvNone
    Color = 4822522
    ParentBackground = False
    TabOrder = 3
    object Panel7: TPanel
      Left = 8
      Top = 8
      Width = 369
      Height = 402
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object lblEmailError: TLabel
        Left = 8
        Top = 163
        Width = 80
        Height = 17
        Caption = 'lblEmailError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblIDError: TLabel
        Left = 8
        Top = 327
        Width = 60
        Height = 17
        Caption = 'lblIDError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblNameError: TLabel
        Left = 8
        Top = 8
        Width = 82
        Height = 17
        Caption = 'lblNameError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8454143
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblPasswordError: TLabel
        Left = 8
        Top = 241
        Width = 104
        Height = 17
        Caption = 'lblPasswordError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblSurnameError: TLabel
        Left = 8
        Top = 82
        Width = 100
        Height = 17
        Caption = 'lblSurnameError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object Label3: TLabel
        Left = 22
        Top = 306
        Width = 95
        Height = 17
        Caption = 'Show Password'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkShowPassword: TCheckBox
        Left = 8
        Top = 306
        Width = 17
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9128543
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = chkShowPasswordClick
      end
      object edtEmailR: TEdit
        Left = 8
        Top = 180
        Width = 353
        Height = 49
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TextHint = 'Enter an email...'
      end
      object edtIDR: TEdit
        Left = 8
        Top = 344
        Width = 353
        Height = 48
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        TextHint = 'Enter an ID number...'
      end
      object edtNameR: TEdit
        Left = 8
        Top = 25
        Width = 353
        Height = 49
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        TextHint = 'Enter a name...'
      end
      object edtPasswordR: TEdit
        Left = 8
        Top = 258
        Width = 353
        Height = 49
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        TextHint = 'Enter a password...'
      end
      object edtSurnameR: TEdit
        Left = 8
        Top = 99
        Width = 353
        Height = 49
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        TextHint = 'Enter a surname...'
      end
    end
  end
  object Panel2: TPanel
    Left = 608
    Top = 136
    Width = 385
    Height = 417
    BevelOuter = bvNone
    Color = 4822522
    ParentBackground = False
    TabOrder = 4
    object lblPfpError: TLabel
      Left = 8
      Top = 295
      Width = 67
      Height = 17
      Caption = 'lblPfpError'
      Color = 9128543
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object Panel4: TPanel
      Left = 8
      Top = 91
      Width = 369
      Height = 204
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object lblMaxCharacters: TLabel
        Left = 8
        Top = 176
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
      object lblBio: TLabel
        Left = 8
        Top = 6
        Width = 24
        Height = 17
        Caption = 'Bio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 8
      Top = 312
      Width = 369
      Height = 89
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 1
      object pfp2: TImage
        Left = 80
        Top = 31
        Width = 49
        Height = 49
        Cursor = crHandPoint
        OnClick = pfp2Click
      end
      object pfp3: TImage
        Left = 159
        Top = 31
        Width = 49
        Height = 49
        Cursor = crHandPoint
        OnClick = pfp3Click
      end
      object pfp4: TImage
        Left = 239
        Top = 31
        Width = 49
        Height = 49
        OnClick = pfp4Click
      end
      object pfp5: TImage
        Left = 311
        Top = 31
        Width = 49
        Height = 49
        OnClick = pfp5Click
      end
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 92
        Height = 17
        Caption = 'Profile Picture:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPfp: TLabel
        Left = 106
        Top = 8
        Width = 98
        Height = 17
        Caption = '(None Selected)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object pfp1: TImage
        Left = 8
        Top = 31
        Width = 49
        Height = 49
        Cursor = crHandPoint
        OnClick = pfp1Click
      end
    end
    object Panel8: TPanel
      Left = 8
      Top = 7
      Width = 369
      Height = 81
      BevelOuter = bvNone
      Caption = 'Panel8'
      Color = 9128543
      ParentBackground = False
      TabOrder = 2
      object lblPhoneNumberError: TLabel
        Left = 8
        Top = 7
        Width = 135
        Height = 17
        Caption = 'lblPhoneNumberError'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object edtPhoneNumberR: TEdit
        Left = 8
        Top = 24
        Width = 353
        Height = 49
        AutoSize = False
        BorderStyle = bsNone
        Color = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TextHint = 'Enter a phone number...'
      end
    end
  end
  object Button1: TButton
    Left = 1016
    Top = 8
    Width = 99
    Height = 49
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 49
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object redBioR: TRichEdit
    Left = 624
    Top = 256
    Width = 353
    Height = 141
    Hint = 'Enter a bio... (255 Max Characters)'
    BorderStyle = bsNone
    Color = 11759493
    EditMargins.Left = 3
    EditMargins.Right = 3
    Font.Charset = ANSI_CHARSET
    Font.Color = 4822522
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    MaxLength = 255
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = redBioRChange
  end
end
