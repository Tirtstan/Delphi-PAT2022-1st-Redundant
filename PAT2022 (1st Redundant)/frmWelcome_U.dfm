object frmWelcome: TfrmWelcome
  Left = 0
  Top = 0
  Caption = 'Welcome'
  ClientHeight = 745
  ClientWidth = 1100
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
  object Label4: TLabel
    Left = 1111
    Top = 304
    Width = 103
    Height = 17
    Caption = 'Ooooooh Secret!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlWelcome: TPanel
    Left = -5
    Top = 0
    Width = 1110
    Height = 745
    BevelOuter = bvNone
    Color = 9128543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMoneyGreen
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 416
      Top = 170
      Width = 279
      Height = 86
      Alignment = taCenter
      Caption = 'Welcome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -64
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 392
      Top = 317
      Width = 343
      Height = 65
      Alignment = taCenter
      Caption = 'Student Helper'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 528
      Top = 254
      Width = 53
      Height = 65
      Alignment = taCenter
      Caption = 'To'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnHelp: TButton
      Left = 16
      Top = 14
      Width = 105
      Height = 49
      Caption = 'Help'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMoneyGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnHelpClick
    end
    object Panel1: TPanel
      Left = 432
      Top = 396
      Width = 249
      Height = 189
      BevelOuter = bvNone
      BorderWidth = 1
      Color = 4822522
      ParentBackground = False
      TabOrder = 1
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 233
        Height = 169
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object btnLogin1: TButton
          Left = 14
          Top = 13
          Width = 203
          Height = 65
          Cancel = True
          Caption = 'Login'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9128543
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnLogin1Click
        end
        object btnRegister1: TButton
          Left = 14
          Top = 92
          Width = 203
          Height = 61
          Cancel = True
          Caption = 'Register'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9128543
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnRegister1Click
        end
      end
    end
    object btnClose: TButton
      Left = 994
      Top = 14
      Width = 105
      Height = 49
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMoneyGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object Panel2: TPanel
      Left = 17
      Top = 62
      Width = 265
      Height = 147
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 3
      object redHelp: TRichEdit
        Left = 6
        Top = 8
        Width = 251
        Height = 129
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
        ParentFont = False
        TabOrder = 0
      end
    end
    object Button1: TButton
      Left = 994
      Top = 675
      Width = 105
      Height = 49
      Caption = 'Customise'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object btnAdmin: TButton
    Left = 1111
    Top = 369
    Width = 106
    Height = 40
    Caption = 'btnAdminPage'
    TabOrder = 1
    OnClick = btnAdminPageClick
  end
end
