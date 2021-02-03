object Form1: TForm1
  Left = 192
  Top = 107
  Width = 1020
  Height = 725
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 634
    Height = 413
    Align = alClient
    TabOrder = 0
    object SgMatr: TStringGrid
      Left = 1
      Top = 1
      Width = 632
      Height = 411
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 413
    Align = alLeft
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 116
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
    end
    object Label2: TLabel
      Left = 8
      Top = 176
      Width = 174
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1089#1090#1088#1072#1090#1077#1075#1080#1103' '#1087#1077#1088#1074' '#1080#1075#1088#1086#1082#1072
    end
    object BtGenerate: TButton
      Left = 8
      Top = 104
      Width = 169
      Height = 25
      Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1080' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 0
      OnClick = BtGenerateClick
    end
    object SeRazm: TSpinEdit
      Left = 8
      Top = 24
      Width = 169
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 4
      OnChange = SeRazmChange
    end
    object Rgsedlo: TRadioGroup
      Left = 8
      Top = 48
      Width = 169
      Height = 57
      Caption = #1058#1080#1087' '#1084#1072#1090#1088#1080#1094#1099
      ItemIndex = 1
      Items.Strings = (
        #1057' '#1089#1077#1076#1083#1086#1074#1086#1081' '#1090#1086#1095#1082#1086#1081
        #1041#1077#1079' '#1089#1077#1076#1083#1086#1074#1086#1081' '#1090#1086#1095#1082#1080)
      TabOrder = 2
    end
    object btIter: TButton
      Left = 8
      Top = 216
      Width = 169
      Height = 25
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1080#1090#1077#1088#1072#1094#1080#1080
      TabOrder = 3
      OnClick = btIterClick
    end
    object LeDk: TLabeledEdit
      Left = 8
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Delt '#1079#1072#1076#1072#1085#1085#1086#1077
      TabOrder = 4
      Text = '0,01'
    end
    object SeNati: TSpinEdit
      Left = 8
      Top = 192
      Width = 121
      Height = 22
      MaxValue = 4
      MinValue = 1
      TabOrder = 5
      Value = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 413
    Width = 1004
    Height = 274
    Align = alBottom
    TabOrder = 2
    object SgTras: TStringGrid
      Left = 1
      Top = 1
      Width = 1002
      Height = 272
      Align = alClient
      DefaultColWidth = 60
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 819
    Top = 0
    Width = 185
    Height = 413
    Align = alRight
    TabOrder = 3
    object SgStrat: TStringGrid
      Left = 1
      Top = 1
      Width = 183
      Height = 411
      Align = alClient
      ColCount = 3
      TabOrder = 0
    end
  end
end
