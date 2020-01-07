object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20420#32599#26031#26041#22359
  ClientHeight = 646
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 472
    Width = 873
    Height = 174
    Columns = <
      item
        AutoSize = True
      end>
    OwnerDraw = True
    ReadOnly = True
    ShowColumnHeaders = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Button1: TButton
    Left = 0
    Top = 441
    Width = 75
    Height = 25
    Caption = #26085#24535#27979#35797
    TabOrder = 1
    OnClick = Button1Click
  end
end
