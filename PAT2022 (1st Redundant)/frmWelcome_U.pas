unit frmWelcome_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ControlList, Vcl.VirtualImage, Vcl.OleCtrls, SHDocVw,
  Vcl.ComCtrls, Vcl.Buttons, clsFormatCalculations, VCLTee.TeCanvas;

type
  TfrmWelcome = class(TForm)
    pnlWelcome: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnLogin1: TButton;
    btnRegister1: TButton;
    btnHelp: TButton;
    Panel1: TPanel;
    redHelp: TRichEdit;
    btnClose: TButton;
    btnAdmin: TButton;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAdminPageClick(Sender: TObject);
    procedure btnRegister1Click(Sender: TObject);
    procedure btnLogin1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bOnOff: boolean;
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmWelcome: TfrmWelcome;
  frmPreviousForm: TForm;

implementation

uses
  frmAdminPage_U, frmRegister_U, frmLogin_U, frmCourseBrowser_U,
  frmCustomise_U;

{$R *.dfm}

procedure TfrmWelcome.btnAdminPageClick(Sender: TObject);
begin
  frmWelcome.Hide;
  frmAdminPage.show;
end;

procedure TfrmWelcome.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;

end;

procedure TfrmWelcome.btnHelpClick(Sender: TObject);
begin
  if bOnOff = true then
  begin
    Panel2.Visible := true;
    btnHelp.Caption := 'Close';
    bOnOff := false;
    exit;
  end;
  if bOnOff = false then
  begin
    Panel2.Visible := false;
    btnHelp.Caption := 'Help';
    bOnOff := true;
    exit;
  end;
end;

procedure TfrmWelcome.btnLogin1Click(Sender: TObject);
begin

  frmWelcome.Hide;
  frmLogin.show;
end;

procedure TfrmWelcome.btnRegister1Click(Sender: TObject);
begin
  frmWelcome.Hide;
  frmRegister.show;
end;

procedure TfrmWelcome.Button1Click(Sender: TObject);
begin
  frmWelcome.Hide;
  frmCustomise.show;
end;

procedure TfrmWelcome.FormCreate(Sender: TObject);
begin
  bOnOff := true;
  frmWelcome.Position := poScreenCenter;
  Panel2.Visible := false;
  redHelp.Font.Color := clWhite;
  redHelp.ReadOnly := true;
  redHelp.Lines.add
    ('If ''Login'' isn''t working, try registering! Click the register button and fill in the correct information that is required. Admin page is hidden in fullscreen.');

end;

procedure TfrmWelcome.FormShow(Sender: TObject);
begin
  pnlWelcome.Color := Primary;
  Panel1.Color := Secondary;
  Panel2.Color := Secondary;
  redHelp.Color := PrimaryBrighter;
  redHelp.Font.Color := Secondary;
  Panel3.Color := Primary;

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
end;

end.
