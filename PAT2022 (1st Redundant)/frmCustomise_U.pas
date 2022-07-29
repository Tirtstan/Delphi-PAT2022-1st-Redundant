unit frmCustomise_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Edge, clsFormatCalculations, Vcl.Buttons, VCLTee.TeCanvas;

type
  TfrmCustomise = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPrimaryColour: TButtonColor;
    btnBack: TButton;
    btnClose: TButton;
    Panel4: TPanel;
    btnSecondaryColour: TButtonColor;
    Panel5: TPanel;
    bitConfirm: TBitBtn;
    Panel6: TPanel;
    btnPrimaryColourBrighter: TButtonColor;
    bitReset: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    redExample: TRichEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    btnSecondaryBrighter: TButtonColor;
    Panel12: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    lstPresets: TListBox;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel13: TPanel;
    pnlPrimary: TPanel;
    pnlPrimaryBrighter: TPanel;
    pnlSecondary: TPanel;
    pnlSecondaryBrighter: TPanel;
    Panel14: TPanel;
    btnLoadPreset: TButton;
    btnSaveToPreset: TButton;
    tmrTooltip: TTimer;
    pnlTooltip: TPanel;
    lblTooltip: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    procedure btnBackClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitConfirmClick(Sender: TObject);
    procedure btnPrimaryColourClick(Sender: TObject);
    procedure btnPrimaryColourBrighterClick(Sender: TObject);
    procedure btnSecondaryColourClick(Sender: TObject);
    procedure btnSecondaryBrighterClick(Sender: TObject);
    procedure Panel9MouseEnter(Sender: TObject);
    procedure Panel9MouseLeave(Sender: TObject);
    procedure lstPresetsClick(Sender: TObject);
    procedure btnLoadPresetClick(Sender: TObject);
    procedure ReloadColours();
    procedure btnSaveToPresetClick(Sender: TObject);
    procedure bitResetMouseEnter(Sender: TObject);
    procedure bitResetMouseLeave(Sender: TObject);
    procedure bitResetMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tmrTooltipTimer(Sender: TObject);
  private
    { Private declarations }
    tColour, tPreset1, tPreset2, tPreset3, tPreset4: TextFile;
  public
    { Public declarations }
  end;

var
  Primary, PrimaryBrighter, Secondary, SecondaryBrighter: TColor;
  frmCustomise: TfrmCustomise;
  objFormatCalculation: TFormatCalculation;
  sText: string;

const
  DefaultPrimary = $008B4A5F;
  DefaultPrimaryBrighter = $00B36F85;
  DefaultSecondary = $004995FA;
  DefaultSecondaryBrighter = $0087B9FC;

implementation

uses
  frmWelcome_U;

{$R *.dfm}

procedure TfrmCustomise.bitConfirmClick(Sender: TObject);
var
  iYesOrNo: Integer;
  sColours: string;
  sPrimary: string;
  sPrimaryBrighter: string;
  sSecondary: string;
  sSecondaryBrighter: string;
begin
  iYesOrNo := MessageDlg
    ('Are you sure you want to confirm changes to the colour scheme?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrNO then
  begin
    exit;
  end
  else if iYesOrNo = mrYes then
  begin
    Primary := btnPrimaryColour.SymbolColor;
    PrimaryBrighter := btnPrimaryColourBrighter.SymbolColor;
    Secondary := btnSecondaryColour.SymbolColor;
    SecondaryBrighter := btnSecondaryBrighter.SymbolColor;

    // Writing to text file  (wtf is this solution I HAVE to do)
    rewrite(tColour);

    sPrimary := '1|' + ColorToString(Primary) + '/';
    sPrimaryBrighter := '2|' + ColorToString(PrimaryBrighter) + '/';
    sSecondary := '3|' + ColorToString(Secondary) + '/';
    sSecondaryBrighter := '4|' + ColorToString(SecondaryBrighter) + '/';

    writeln(tColour, sPrimary);
    writeln(tColour, sPrimaryBrighter);
    writeln(tColour, sSecondary);
    writeln(tColour, sSecondaryBrighter);

    closeFile(tColour);

    ReloadColours;

    ShowMessage('Colour scheme updated!');
  end;
end;

procedure TfrmCustomise.bitResetClick(Sender: TObject);
var
  iYesOrNo: Integer;
  sColours: string;
  I: Integer;
  sPrimary: string;
  sPrimaryBrighter: string;
  sSecondary: string;
  sSecondaryBrighter: string;
begin
  iYesOrNo := MessageDlg('Are you sure you want to reset colours to default?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrNO then
  begin
    exit;
  end
  else if iYesOrNo = mrYes then
  begin
    Primary := DefaultPrimary;
    Secondary := DefaultSecondary;
    PrimaryBrighter := DefaultPrimaryBrighter;
    SecondaryBrighter := DefaultSecondaryBrighter;

    // Writing to text file
    rewrite(tColour);

    sPrimary := '1|' + ColorToString(Primary) + '/';
    sPrimaryBrighter := '2|' + ColorToString(PrimaryBrighter) + '/';
    sSecondary := '3|' + ColorToString(Secondary) + '/';
    sSecondaryBrighter := '4|' + ColorToString(SecondaryBrighter) + '/';

    writeln(tColour, sPrimary);
    writeln(tColour, sPrimaryBrighter);
    writeln(tColour, sSecondary);
    writeln(tColour, sSecondaryBrighter);

    closeFile(tColour); // This apparently APPLIES the changes

    btnPrimaryColour.SymbolColor := DefaultPrimary;
    btnSecondaryColour.SymbolColor := DefaultSecondary;
    btnPrimaryColourBrighter.SymbolColor := DefaultPrimaryBrighter;
    btnSecondaryBrighter.SymbolColor := DefaultSecondaryBrighter;

    redExample.color := btnPrimaryColourBrighter.SymbolColor;
    Panel9.color := btnPrimaryColour.SymbolColor;
    redExample.Font.color := btnSecondaryColour.SymbolColor;
    Panel9.Font.color := btnSecondaryColour.SymbolColor;
    Panel12.color := btnPrimaryColour.SymbolColor;
    Panel12.Font.color := btnSecondaryBrighter.SymbolColor;
    Panel7.color := btnSecondaryColour.SymbolColor;

    Primary := btnPrimaryColour.SymbolColor;
    PrimaryBrighter := btnPrimaryColourBrighter.SymbolColor;
    Secondary := btnSecondaryColour.SymbolColor;
    SecondaryBrighter := btnSecondaryBrighter.SymbolColor;

    ReloadColours;

    ShowMessage('Resetted to default settings!');
  end;

end;

procedure TfrmCustomise.bitResetMouseEnter(Sender: TObject);
begin
  tmrTooltip.Enabled := true;
end;

procedure TfrmCustomise.bitResetMouseLeave(Sender: TObject);
begin
  pnlTooltip.Visible := false;
  tmrTooltip.Enabled := false;
end;

procedure TfrmCustomise.bitResetMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  CursorPos: tPoint;
begin
  CursorPos := Mouse.CursorPos;
  pnlTooltip.Top := (CursorPos.Y - 350);
  pnlTooltip.Left := (CursorPos.X - 470);

end;

procedure TfrmCustomise.btnBackClick(Sender: TObject);
begin
  frmCustomise.Close;
  frmWelcome.Show;
end;

procedure TfrmCustomise.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCustomise.btnLoadPresetClick(Sender: TObject);
begin
  // Copying text file contents from presets to colours
  if lstPresets.ItemIndex = 0 then
  begin

    reset(tPreset1);
    rewrite(tColour);
    while NOT(EOF(tPreset1)) do
    begin
      Readln(tPreset1, sText);
      writeln(tColour, sText);
    end;
    closeFile(tColour);

    with objFormatCalculation do
    begin
      FindPrimary(tColour);
      FindPrimaryBrighter(tColour);
      FindSecondary(tColour);
      FindSecondaryBrighter(tColour);
    end;
    ReloadColours;

    ShowMessage('Preset loaded. Restart application to see changes.');
  end
  else if lstPresets.ItemIndex = 1 then
  begin
    reset(tPreset2);
    rewrite(tColour);
    while NOT(EOF(tPreset2)) do
    begin
      Readln(tPreset2, sText);
      writeln(tColour, sText);
    end;
    closeFile(tColour);
    ReloadColours;

    ShowMessage('Preset loaded. Restart application to see changes.');
  end
  else if lstPresets.ItemIndex = 2 then
  begin
    reset(tPreset3);
    rewrite(tColour);
    while NOT(EOF(tPreset3)) do
    begin
      Readln(tPreset3, sText);
      writeln(tColour, sText);
    end;
    closeFile(tColour);
    ReloadColours;

    ShowMessage('Preset loaded. Restart application to see changes.');
  end
  else if lstPresets.ItemIndex = 3 then
  begin
    reset(tPreset4);
    rewrite(tColour);
    while NOT(EOF(tPreset4)) do
    begin
      Readln(tPreset4, sText);
      writeln(tColour, sText);
    end;
    closeFile(tColour);
    ReloadColours;

    ShowMessage('Preset loaded. Restart application to see changes.');
  end;

end;

procedure TfrmCustomise.btnPrimaryColourBrighterClick(Sender: TObject);
begin
  redExample.color := btnPrimaryColourBrighter.SymbolColor;
  pnlPrimaryBrighter.color := btnPrimaryColourBrighter.SymbolColor;
end;

procedure TfrmCustomise.btnPrimaryColourClick(Sender: TObject);
begin
  Panel9.color := btnPrimaryColour.SymbolColor;
  Panel12.color := btnPrimaryColour.SymbolColor;
  Panel19.color := btnPrimaryColour.SymbolColor;
  pnlPrimary.color := btnPrimaryColour.SymbolColor;
end;

procedure TfrmCustomise.btnSaveToPresetClick(Sender: TObject);
begin
  if lstPresets.ItemIndex = 0 then
  begin
    reset(tColour);
    rewrite(tPreset1);
    while NOT(EOF(tColour)) do
    begin
      Readln(tColour, sText);
      writeln(tPreset1, sText);
    end;
    closeFile(tPreset1);
    ShowMessage('Preset replaced and saved!');
  end
  else if lstPresets.ItemIndex = 1 then
  begin
    reset(tColour);
    rewrite(tPreset2);
    while NOT(EOF(tColour)) do
    begin
      Readln(tColour, sText);
      writeln(tPreset2, sText);
    end;
    closeFile(tPreset2);
    ShowMessage('Preset replaced and saved!');
  end
  else if lstPresets.ItemIndex = 2 then
  begin
    reset(tColour);
    rewrite(tPreset3);
    while NOT(EOF(tColour)) do
    begin
      Readln(tColour, sText);
      writeln(tPreset3, sText);
    end;
    closeFile(tPreset3);
    ShowMessage('Preset replaced and saved!');
  end
  else if lstPresets.ItemIndex = 3 then
  begin
    reset(tColour);
    rewrite(tPreset4);
    while NOT(EOF(tColour)) do
    begin
      Readln(tColour, sText);
      writeln(tPreset4, sText);
    end;
    closeFile(tPreset4);
    ShowMessage('Preset replaced and saved!');
  end;

end;

procedure TfrmCustomise.btnSecondaryBrighterClick(Sender: TObject);
begin
  Panel12.Font.color := btnSecondaryBrighter.SymbolColor;
  pnlSecondaryBrighter.color := btnSecondaryBrighter.SymbolColor;
end;

procedure TfrmCustomise.btnSecondaryColourClick(Sender: TObject);
begin
  redExample.Font.color := btnSecondaryColour.SymbolColor;
  Panel9.Font.color := btnSecondaryColour.SymbolColor;
  Panel7.color := btnSecondaryColour.SymbolColor;
  pnlSecondary.color := btnSecondaryColour.SymbolColor;
end;

procedure TfrmCustomise.FormCreate(Sender: TObject);
var
  sLine, sPrimary, sPrimaryBrighter, sSecondary, sSecondaryBrighter: string;
  iPos: Integer;
  sP, sPB, sS, sSB: string;
begin
  frmCustomise.Position := poScreenCenter;

  // Fail safing
  if FileExists('Colour.txt') = false then
  begin
    ShowMessage('Colour file is missing.');
    exit;
  end;

  // Loading colours from text file

  assignFile(tColour, 'Colour.txt');
  with objFormatCalculation do
  begin
    Primary := FindPrimary(tColour);
    PrimaryBrighter := FindPrimaryBrighter(tColour);
    Secondary := FindSecondary(tColour);
    SecondaryBrighter := FindSecondaryBrighter(tColour);
  end;

  closeFile(tColour);
end;

procedure TfrmCustomise.FormShow(Sender: TObject);
begin
  // Correct colour scheme displayed

  ReloadColours;

  pnlPrimary.color := Primary;
  pnlPrimaryBrighter.color := PrimaryBrighter;
  pnlSecondary.color := Secondary;
  pnlSecondaryBrighter.color := SecondaryBrighter;

  // Other
  lstPresets.ItemIndex := -1;

  if lstPresets.ItemIndex = -1 then
  begin
    btnLoadPreset.Enabled := false;
    btnSaveToPreset.Enabled := false;
  end
  else
  begin
    btnLoadPreset.Enabled := true;
    btnSaveToPreset.Enabled := true;
  end;

  pnlTooltip.Visible := false;
  tmrTooltip.Enabled := false;
  tmrTooltip.Interval := 1500;
end;

procedure TfrmCustomise.lstPresetsClick(Sender: TObject);
var
  tpPrimary, tpPrimaryBrighter, tpSecondary, tpSecondaryBrighter: TColor;
begin
  if lstPresets.ItemIndex = -1 then
  begin
    btnLoadPreset.Enabled := false;
    btnSaveToPreset.Enabled := false;
  end
  else
  begin
    btnLoadPreset.Enabled := true;
    btnSaveToPreset.Enabled := true;
  end;

  // Finding the colours through the text files to showcase
  with objFormatCalculation do
  begin
    if lstPresets.ItemIndex = 0 then
    begin
      assignFile(tPreset1, 'Preset1.txt');

      tpPrimary := FindPrimary(tPreset1);
      tpPrimaryBrighter := FindPrimaryBrighter(tPreset1);
      tpSecondary := FindSecondary(tPreset1);
      tpSecondaryBrighter := FindSecondaryBrighter(tPreset1);

      pnlPrimary.color := tpPrimary;
      pnlPrimaryBrighter.color := tpPrimaryBrighter;
      pnlSecondary.color := tpSecondary;
      pnlSecondaryBrighter.color := tpSecondaryBrighter;

      closeFile(tPreset1);
    end
    else if lstPresets.ItemIndex = 1 then
    begin
      assignFile(tPreset2, 'Preset2.txt');

      tpPrimary := FindPrimary(tPreset2);
      tpPrimaryBrighter := FindPrimaryBrighter(tPreset2);
      tpSecondary := FindSecondary(tPreset2);
      tpSecondaryBrighter := FindSecondaryBrighter(tPreset2);

      pnlPrimary.color := tpPrimary;
      pnlPrimaryBrighter.color := tpPrimaryBrighter;
      pnlSecondary.color := tpSecondary;
      pnlSecondaryBrighter.color := tpSecondaryBrighter;

      closeFile(tPreset2);
    end
    else if lstPresets.ItemIndex = 2 then
    begin
      assignFile(tPreset3, 'Preset3.txt');

      tpPrimary := FindPrimary(tPreset3);
      tpPrimaryBrighter := FindPrimaryBrighter(tPreset3);
      tpSecondary := FindSecondary(tPreset3);
      tpSecondaryBrighter := FindSecondaryBrighter(tPreset3);

      pnlPrimary.color := tpPrimary;
      pnlPrimaryBrighter.color := tpPrimaryBrighter;
      pnlSecondary.color := tpSecondary;
      pnlSecondaryBrighter.color := tpSecondaryBrighter;

      closeFile(tPreset3);
    end
    else if lstPresets.ItemIndex = 3 then
    begin
      assignFile(tPreset4, 'Preset4.txt');

      tpPrimary := FindPrimary(tPreset4);
      tpPrimaryBrighter := FindPrimaryBrighter(tPreset4);
      tpSecondary := FindSecondary(tPreset4);
      tpSecondaryBrighter := FindSecondaryBrighter(tPreset4);

      pnlPrimary.color := tpPrimary;
      pnlPrimaryBrighter.color := tpPrimaryBrighter;
      pnlSecondary.color := tpSecondary;
      pnlSecondaryBrighter.color := tpSecondaryBrighter;

      closeFile(tPreset4);
    end;
  end;
end;

procedure TfrmCustomise.Panel9MouseEnter(Sender: TObject);
begin
  Panel9.Font.color := btnSecondaryBrighter.SymbolColor;
end;

procedure TfrmCustomise.Panel9MouseLeave(Sender: TObject);
begin
  Panel9.Font.color := btnSecondaryColour.SymbolColor;
end;

procedure TfrmCustomise.ReloadColours;
begin
  Panel1.color := Primary;
  Panel2.color := Secondary;
  Panel3.color := Primary;
  Panel3.Font.color := Secondary;
  Panel4.color := Primary;
  Panel4.Font.color := Secondary;
  Panel6.color := Primary;
  Panel6.Font.color := Secondary;
  Panel5.color := Secondary;
  Panel10.color := Secondary;
  Panel8.color := Primary;
  Panel8.Font.color := Secondary;
  Panel11.color := Primary;
  Panel11.Font.color := Secondary;
  Panel19.color := Primary;
  Panel9.color := Primary;
  Panel9.Font.color := Secondary;
  Panel7.color := Secondary;
  Panel12.color := Primary;
  Panel12.Font.color := SecondaryBrighter;
  Panel17.color := Secondary;
  Panel18.color := Primary;
  Panel18.Font.color := Secondary;
  Panel20.color := Primary;
  Panel14.color := Secondary;
  Panel13.color := Primary;
  pnlTooltip.color := Primary;

  btnPrimaryColour.SymbolColor := Primary;
  btnSecondaryColour.SymbolColor := Secondary;
  btnPrimaryColourBrighter.SymbolColor := PrimaryBrighter;
  btnSecondaryBrighter.SymbolColor := SecondaryBrighter;

  redExample.color := PrimaryBrighter;
  redExample.Font.color := Secondary;

  lstPresets.color := PrimaryBrighter;
  lstPresets.Font.color := Secondary;

  lblTooltip.Font.color := Secondary;
end;

procedure TfrmCustomise.tmrTooltipTimer(Sender: TObject);
begin
  pnlTooltip.Visible := true;
end;

end.
