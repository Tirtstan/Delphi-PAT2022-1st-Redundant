unit frmLogin_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, dbPAT2022,
  Vcl.Buttons, clsFormatCalculations, clsValidation, Vcl.WinXCtrls;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    edtEmailL: TEdit;
    edtPasswordL: TEdit;
    chkShowPassword: TCheckBox;
    btnClose: TButton;
    btnBack: TButton;
    Panel3: TPanel;
    btnLogin: TButton;
    lblForgotPassword: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnRegister: TButton;
    Panel4: TPanel;
    Label4: TLabel;
    procedure chkShowPasswordClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure lblForgotPasswordMouseEnter(Sender: TObject);
    procedure lblForgotPasswordMouseLeave(Sender: TObject);
    procedure lblForgotPasswordClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    objValidation: TValidation;
  public
    { Public declarations }

  end;

var
  frmLogin: TfrmLogin;
  iStudentID: integer;

implementation

uses
  frmWelcome_U, frmBrowserChooser_U, frmRegister_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmLogin.btnBackClick(Sender: TObject);
begin
  frmLogin.Close;
  frmWelcome.Show;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  bEmail, bPassword: boolean;
  bFlag: boolean;
begin

  iStudentID := 0;

  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.Sort := 'StudentID ASC';
    tblStudents.First;
    while NOT(tblStudents.EOF) OR (bFlag = True) do
    begin
      if (edtEmailL.Text = tblStudents['Email']) AND
        (edtPasswordL.Text = tblStudents['Password']) then
      begin
        iStudentID := tblStudents['StudentID'];
        bEmail := True;
        bPassword := True;
        bFlag := false;
      end;
      tblStudents.Next;
    end;
  end;

  if (bEmail = True) AND (bPassword = True) then
  begin
    ShowMessage('Successfully logged in!');
    frmLogin.Close;
    frmBrowserChooser.Show;
  end
  else
  begin
    ShowMessage('Email or password is incorrect.');
  end;
end;

procedure TfrmLogin.btnRegisterClick(Sender: TObject);
begin
  frmLogin.Close;
  frmRegister.Show;
end;

procedure TfrmLogin.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowPassword.Checked = false then
  begin
    edtPasswordL.PasswordChar := '*';
  end
  else
  begin
    edtPasswordL.PasswordChar := #0;
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  frmLogin.Position := poScreenCenter;
  edtPasswordL.PasswordChar := '*';
  Application.MainFormOnTaskbar := false;

  // Remove when done
  edtEmailL.Text := 'tirt@gmail.com';
  edtPasswordL.Text := 'SupBro32!!';

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  // Colour Scheme

  // Panels
  Panel1.Color := Primary;
  Panel2.Color := Secondary;
  Panel3.Color := Secondary;
  Panel4.Color := Primary;

  // Other

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
  Label4.Color := Primary;
  Label4.Font.Color := Secondary;
  lblForgotPassword.Font.Color := Secondary;

  edtEmailL.Color := PrimaryBrighter;
  edtEmailL.Font.Color := Secondary;
  edtPasswordL.Color := PrimaryBrighter;
  edtPasswordL.Font.Color := Secondary;

  chkShowPassword.Color := Primary;
  chkShowPassword.Font.Color := Secondary;

end;

procedure TfrmLogin.lblForgotPasswordClick(Sender: TObject);
var
  sNewPassword, sID: string;
begin
  sID := InputBox('Input your ID to confirm your identity', 'ID:', '');
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;
    tblStudents.Sort := 'StudentID ASC';
    while NOT(tblStudents.EOF) do
    begin
      if (tblStudents['ID'] = sID) then
      begin
        ShowMessage('Identity Confirmed!');
        sNewPassword := InputBox('Enter a new password', 'Password:', '');
        if objValidation.IsPasswordCrazy(sNewPassword) = True then
        begin
          tblStudents.Edit;
          tblStudents['Password'] := sNewPassword;
          tblStudents.Post;
          tblStudents.Refresh;
          ShowMessage('Password Changed!');
        end
        else
        begin
          ShowMessage('Password too basic.');
          exit;
        end;
        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TfrmLogin.lblForgotPasswordMouseEnter(Sender: TObject);
begin
  lblForgotPassword.Font.Color := SecondaryBrighter;
  lblForgotPassword.Cursor := crHandPoint;
  lblForgotPassword.Font.Style := [fsBold, fsUnderline];
end;

procedure TfrmLogin.lblForgotPasswordMouseLeave(Sender: TObject);
begin
  lblForgotPassword.Font.Color := Secondary;
  lblForgotPassword.Font.Style := [fsBold];
end;

end.
