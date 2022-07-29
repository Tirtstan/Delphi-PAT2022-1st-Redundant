object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 736
  ClientWidth = 1121
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
    Left = 0
    Top = 0
    Width = 1121
    Height = 737
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
    object Label1: TLabel
      Left = 494
      Top = 120
      Width = 139
      Height = 71
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -53
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 936
      Top = 616
      Width = 177
      Height = 21
      Alignment = taCenter
      Caption = 'Don'#39't have an account?'
      Color = 4822522
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 1008
      Top = 643
      Width = 105
      Height = 21
      Caption = 'Register here!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 376
      Top = 232
      Width = 393
      Height = 185
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object Panel4: TPanel
        Left = 8
        Top = 8
        Width = 377
        Height = 169
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblForgotPassword: TLabel
          Left = 260
          Top = 139
          Width = 109
          Height = 17
          Alignment = taRightJustify
          Caption = 'Forgot Password?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblForgotPasswordClick
          OnMouseEnter = lblForgotPasswordMouseEnter
          OnMouseLeave = lblForgotPasswordMouseLeave
        end
        object Label4: TLabel
          Left = 23
          Top = 139
          Width = 95
          Height = 17
          Caption = 'Show Password'
          Color = 9128543
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edtPasswordL: TEdit
          Left = 8
          Top = 88
          Width = 361
          Height = 49
          AutoSize = False
          BevelInner = bvNone
          BorderStyle = bsNone
          Color = 11759493
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TextHint = 'Enter your password...'
        end
        object edtEmailL: TEdit
          Left = 8
          Top = 16
          Width = 361
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
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          TextHint = 'Enter your email...'
        end
        object chkShowPassword: TCheckBox
          Left = 8
          Top = 139
          Width = 17
          Height = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = chkShowPasswordClick
        end
      end
    end
    object btnClose: TButton
      Left = 1016
      Top = 8
      Width = 97
      Height = 49
      Caption = 'Close'
      TabOrder = 3
      OnClick = btnCloseClick
    end
    object btnBack: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 49
      Caption = 'Back'
      TabOrder = 4
      OnClick = btnBackClick
    end
    object Panel3: TPanel
      Left = 488
      Top = 440
      Width = 153
      Height = 57
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 1
    end
    object btnLogin: TButton
      Left = 496
      Top = 448
      Width = 137
      Height = 41
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnLoginClick
    end
    object btnRegister: TButton
      Left = 1006
      Top = 670
      Width = 107
      Height = 51
      Caption = 'Register'
      TabOrder = 5
      OnClick = btnRegisterClick
    end
  end
end
