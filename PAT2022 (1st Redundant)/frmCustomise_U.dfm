object frmCustomise: TfrmCustomise
  Left = 0
  Top = 0
  Caption = 'Customise'
  ClientHeight = 576
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 4822522
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 693
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
    object Panel2: TPanel
      Left = 16
      Top = 64
      Width = 289
      Height = 393
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Primary Colour:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object btnPrimaryColour: TButtonColor
        Left = 8
        Top = 55
        Width = 273
        Height = 42
        Caption = 'Primary Colour'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnPrimaryColourClick
        SymbolWidth = 28
      end
      object Panel4: TPanel
        Left = 8
        Top = 199
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Secondary Colour:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object btnSecondaryColour: TButtonColor
        Left = 8
        Top = 246
        Width = 273
        Height = 43
        Caption = 'Secondary Colour'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnSecondaryColourClick
        SymbolWidth = 28
      end
      object Panel6: TPanel
        Left = 8
        Top = 103
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Brighter Primary Colour:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object btnPrimaryColourBrighter: TButtonColor
        Left = 8
        Top = 150
        Width = 273
        Height = 43
        Caption = 'Brighter Primary Colour'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnPrimaryColourBrighterClick
        SymbolWidth = 28
      end
      object Panel11: TPanel
        Left = 8
        Top = 295
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Brighter Secondary Colour:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object btnSecondaryBrighter: TButtonColor
        Left = 8
        Top = 342
        Width = 273
        Height = 43
        Caption = 'Brighter Secondary Colour'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btnSecondaryBrighterClick
        SymbolWidth = 28
      end
    end
    object btnBack: TButton
      Left = 16
      Top = 8
      Width = 105
      Height = 50
      Caption = 'Back'
      TabOrder = 1
      OnClick = btnBackClick
    end
    object btnClose: TButton
      Left = 848
      Top = 8
      Width = 105
      Height = 50
      Caption = 'Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object Panel5: TPanel
      Left = 320
      Top = 484
      Width = 321
      Height = 65
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 3
      object bitConfirm: TBitBtn
        Left = 8
        Top = 8
        Width = 145
        Height = 49
        Caption = 'Confirm Changes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkYes
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = bitConfirmClick
      end
      object bitReset: TBitBtn
        Left = 168
        Top = 8
        Width = 145
        Height = 49
        Hint = 
          'Resets the colour scheme to a factory default version (Not inclu' +
          'ded in presets)'
        Caption = 'Reset To Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkRetry
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bitResetClick
        OnMouseEnter = bitResetMouseEnter
        OnMouseLeave = bitResetMouseLeave
        OnMouseMove = bitResetMouseMove
      end
    end
    object Panel7: TPanel
      Left = 335
      Top = 128
      Width = 290
      Height = 329
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 4
      object Panel9: TPanel
        Left = 8
        Top = 231
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Headings + Background Colour'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnMouseEnter = Panel9MouseEnter
        OnMouseLeave = Panel9MouseLeave
      end
      object Panel12: TPanel
        Left = 8
        Top = 278
        Width = 273
        Height = 41
        BevelOuter = bvNone
        Caption = 'Secondary hover-over colour'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8894972
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object Panel19: TPanel
        Left = 8
        Top = 9
        Width = 273
        Height = 216
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object redExample: TRichEdit
          Left = 8
          Top = 7
          Width = 257
          Height = 202
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Font colour would look like '
            'this. (Secondary Colour)'
            ''
            'Places where there are lots of '
            'text are placed on this '
            'colour. (Brighter Primary '
            'Colour)'
            ''
            'All this is just recommendations. '
            'Go crazy!')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object Panel10: TPanel
      Left = 335
      Top = 64
      Width = 290
      Height = 58
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 5
      object Panel8: TPanel
        Left = 9
        Top = 8
        Width = 272
        Height = 41
        BevelOuter = bvNone
        Caption = 'Example:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel17: TPanel
      Left = 657
      Top = 64
      Width = 296
      Height = 393
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 6
      object Panel18: TPanel
        Left = 8
        Top = 8
        Width = 281
        Height = 41
        BevelOuter = bvNone
        Caption = 'Preset Configure/Load:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel20: TPanel
        Left = 8
        Top = 55
        Width = 281
        Height = 251
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object lstPresets: TListBox
          Left = 8
          Top = 9
          Width = 265
          Height = 160
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
            'Preset 1'
            'Preset 2'
            'Preset 3'
            'Preset 4')
          ParentFont = False
          TabOrder = 0
          OnClick = lstPresetsClick
        end
        object Panel14: TPanel
          Left = 8
          Top = 175
          Width = 265
          Height = 66
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object btnLoadPreset: TButton
            Left = 8
            Top = 8
            Width = 122
            Height = 49
            Caption = 'Load Preset'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnLoadPresetClick
          end
          object btnSaveToPreset: TButton
            Left = 136
            Top = 8
            Width = 121
            Height = 49
            Hint = 
              'Saves the current colour scheme into the above preset, replacing' +
              ' it'
            Caption = 'Save To Preset'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnSaveToPresetClick
          end
        end
      end
      object Panel13: TPanel
        Left = 8
        Top = 312
        Width = 281
        Height = 73
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object pnlPrimary: TPanel
          Left = 8
          Top = 8
          Width = 57
          Height = 57
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = 9128543
          ParentBackground = False
          TabOrder = 0
        end
        object pnlPrimaryBrighter: TPanel
          Left = 71
          Top = 8
          Width = 57
          Height = 57
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = 11759493
          ParentBackground = False
          TabOrder = 1
        end
        object pnlSecondary: TPanel
          Left = 151
          Top = 8
          Width = 57
          Height = 57
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = 4822522
          ParentBackground = False
          TabOrder = 2
        end
        object pnlSecondaryBrighter: TPanel
          Left = 214
          Top = 8
          Width = 57
          Height = 57
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = 8894972
          ParentBackground = False
          TabOrder = 3
        end
      end
    end
  end
  object pnlTooltip: TPanel
    Left = 759
    Top = 466
    Width = 200
    Height = 102
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 9128543
    ParentBackground = False
    TabOrder = 1
    object lblTooltip: TLabel
      Left = 8
      Top = 2
      Width = 153
      Height = 17
      Caption = 'Resets colour scheme to:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Panel15: TPanel
      Left = 8
      Top = 40
      Width = 41
      Height = 41
      BorderStyle = bsSingle
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
    end
    object Panel16: TPanel
      Left = 55
      Top = 40
      Width = 41
      Height = 41
      BorderStyle = bsSingle
      Color = 11759493
      ParentBackground = False
      TabOrder = 1
    end
    object Panel21: TPanel
      Left = 102
      Top = 40
      Width = 41
      Height = 41
      BorderStyle = bsSingle
      Color = 4822522
      ParentBackground = False
      TabOrder = 2
    end
    object Panel22: TPanel
      Left = 149
      Top = 40
      Width = 41
      Height = 41
      BorderStyle = bsSingle
      Color = 8894972
      ParentBackground = False
      TabOrder = 3
    end
  end
  object tmrTooltip: TTimer
    Enabled = False
    OnTimer = tmrTooltipTimer
    Left = 704
    Top = 504
  end
end
