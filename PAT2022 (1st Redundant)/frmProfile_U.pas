unit frmProfile_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, dbPAT2022, JPEG, db, Vcl.Buttons, clsValidation;

type
  TfrmProfile = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    imgPfp: TImage;
    Panel4: TPanel;
    lblName: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    redBio: TRichEdit;
    Panel9: TPanel;
    lblEmail: TLabel;
    lblPassword: TLabel;
    lblPhoneNumber: TLabel;
    lblIDtitle: TLabel;
    lblBio: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    redPhoneNumber: TRichEdit;
    Panel13: TPanel;
    redEmail: TRichEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    chkPassword: TCheckBox;
    chkID: TCheckBox;
    Panel16: TPanel;
    bitConfirmChanges: TBitBtn;
    bitChangeEmail: TBitBtn;
    bitChangePhoneNumber: TBitBtn;
    bitChangePassword: TBitBtn;
    bitChangeBio: TBitBtn;
    lblMaxCharacters: TLabel;
    Panel17: TPanel;
    edtID: TEdit;
    edtPassword: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkPasswordClick(Sender: TObject);
    procedure chkIDClick(Sender: TObject);
    procedure bitChangeEmailClick(Sender: TObject);
    procedure bitChangePhoneNumberClick(Sender: TObject);
    procedure bitChangePasswordClick(Sender: TObject);
    procedure bitConfirmChangesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitChangeBioClick(Sender: TObject);
    procedure redBioChange(Sender: TObject);
  private
    { Private declarations }
    objValidation: TValidation;
    sNewEmail, sNewPhoneNumber, sNewPassword, sNewBio: string;
    bEmailChanged, bPhoneNumberChanged, bPasswordChanged, bBioChanged: boolean;
  public
    { Public declarations }

  end;

var
  frmProfile: TfrmProfile;
  iStudentProfileID: integer;

implementation

uses
  frmCourseBrowser_U, frmLogin_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmProfile.bitChangeEmailClick(Sender: TObject);
var
  sEmail: string;
begin
  // Getting old email and new email
  sEmail := InputBox('Input old email to confirm', 'Email:', '');
  if NOT(sEmail = redEmail.Text) then
  begin
    ShowMessage('Incorrect old email.');
    exit;
  end
  else
  begin
    sNewEmail := InputBox('Input new email', 'Email:', '');
    if objValidation.IsValidEmail(sNewEmail) = true then
    begin
      ShowMessage('Settings saved! Click confirm changes to apply them!');
      bitConfirmChanges.Enabled := true;
      bEmailChanged := true;
      exit;
    end
    else
    begin
      ShowMessage('Not valid email.');
      exit;
    end;
  end;

  // Checking eligibility on clicking the confirm button

  if (sNewEmail = '') AND (sNewPhoneNumber = '') AND (sNewPassword = '') then
  begin
    bitConfirmChanges.Enabled := false;
  end
  else
  begin
    bitConfirmChanges.Enabled := true;
  end;

end;

procedure TfrmProfile.bitChangePasswordClick(Sender: TObject);
var
  sPassword: string;
begin
  // Getting old password and new password

  sPassword := InputBox('Input old password to confirm', 'Password:', '');
  if NOT(sPassword = edtPassword.Text) then
  begin
    ShowMessage('Incorrect old password.');
    exit;
  end
  else
  begin
    sNewPassword := InputBox('Input new password', 'Password:', '');

    if objValidation.IsPasswordCrazy(sNewPassword) = true then
    begin
      ShowMessage('Settings saved! Click confirm changes to apply them!');
      bitConfirmChanges.Enabled := true;
      bPasswordChanged := true;
      exit;
    end
    else
    begin
      ShowMessage('Not valid password.');
      exit;
    end;
  end;

  // Checking eligibility on clicking the confirm button

  if (sNewEmail = '') AND (sNewPhoneNumber = '') AND (sNewPassword = '') then
  begin
    bitConfirmChanges.Enabled := false;
  end
  else
  begin
    bitConfirmChanges.Enabled := true;
  end;

end;

procedure TfrmProfile.bitChangePhoneNumberClick(Sender: TObject);
var
  sPhoneNumber: string;
begin
  // Getting old phone number and new phone number

  sPhoneNumber := InputBox('Input old phone number to confirm',
    'Phone Number:', '');
  if NOT(sPhoneNumber = redPhoneNumber.Text) then
  begin
    ShowMessage('Incorrect old phone number.');
    exit;
  end
  else
  begin
    sNewPhoneNumber := InputBox('Input new phone number', 'Phone Number:', '');

    if objValidation.IsPhoneNumber(sNewPhoneNumber) = true then
    begin
      ShowMessage('Settings saved! Click confirm changes to apply them!');
      bitConfirmChanges.Enabled := true;
      bPhoneNumberChanged := true;
      exit;
    end
    else
    begin
      ShowMessage('Not valid phone number.');
      exit;
    end;
  end;

  // Checking eligibility on clicking the confirm button

  if (sNewEmail = '') AND (sNewPhoneNumber = '') AND (sNewPassword = '') then
  begin
    bitConfirmChanges.Enabled := false;
  end
  else
  begin
    bitConfirmChanges.Enabled := true;
  end;

end;

procedure TfrmProfile.bitConfirmChangesClick(Sender: TObject);
var
  bFlag: boolean;
  iYesOrNo: integer;
begin

  iYesOrNo := MessageDlg
    ('Are you sure you want to change your details? Exiting the profile page will lose all changes.',
    mtConfirmation, [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrYes then
  begin
    With dbmPAT2022 do
    begin
      tblStudents.First;
      while NOT(tblStudents.Eof) OR (bFlag = true) do
      begin
        if tblStudents['StudentID'] = iStudentID then
        begin
          tblStudents.Edit;
          if bEmailChanged = true then
          begin
            tblStudents['Email'] := sNewEmail;
          end;

          if bPhoneNumberChanged = true then
          begin
            tblStudents['PhoneNumber'] := sNewPhoneNumber;
          end;

          if bPasswordChanged = true then
          begin
            tblStudents['Password'] := sNewPassword;
          end;

          if bBioChanged = true then
          begin
            tblStudents['Bio'] := redBio.Text;
          end;

          tblStudents.Post;
          tblStudents.Refresh;

          redEmail.Text := tblStudents['Email'];
          edtPassword.Text := tblStudents['Password'];
          redPhoneNumber.Text := tblStudents['PhoneNumber'];

          ShowMessage('Setting Updated!');

          bFlag := false;
        end;
        tblStudents.Next;
      end;
    end;
  end
  else if iYesOrNo = mrNo then
  begin
    exit;
  end;

end;

procedure TfrmProfile.bitChangeBioClick(Sender: TObject);
var
  iYesOrNo: integer;
begin

  iYesOrNo := MessageDlg
    ('Are you sure you want to continue to change your bio?', mtConfirmation,
    [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrNo then
  begin
    exit;
  end
  else if iYesOrNo = mrYes then
  begin
    lblMaxCharacters.Visible := true;
    redBio.Height := 177;
    redBio.Text := 'Enter new bio here.';
    redBio.ReadOnly := false;
    bBioChanged := true;
    bitConfirmChanges.Enabled := true;
    exit;
  end;

  // Checking eligibility on clicking the confirm button

  if (sNewEmail = '') AND (sNewPhoneNumber = '') AND (sNewPassword = '') then
  begin
    bitConfirmChanges.Enabled := false;
  end
  else
  begin
    bitConfirmChanges.Enabled := true;
  end;

end;

procedure TfrmProfile.btnCloseClick(Sender: TObject);
begin
  frmProfile.Close;
end;

procedure TfrmProfile.chkIDClick(Sender: TObject);
begin
  if chkID.Checked = false then
  begin
    edtID.passwordchar := '*';
  end
  else
  begin
    edtID.passwordchar := #0;
  end;
end;

procedure TfrmProfile.chkPasswordClick(Sender: TObject);
begin
  if chkPassword.Checked = false then
  begin
    edtPassword.passwordchar := '*';
  end
  else
  begin
    edtPassword.passwordchar := #0;
  end;
end;

procedure TfrmProfile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  iStudentProfileID := 0;
end;

procedure TfrmProfile.FormCreate(Sender: TObject);
begin
  frmProfile.Position := poScreenCenter;

end;

procedure TfrmProfile.FormShow(Sender: TObject);
var
  bFlag: boolean;
begin

  // Colour scheme stuff

  // Panels

  Panel1.Color := Primary;
  Panel2.Color := Secondary;
  Panel3.Color := Secondary;
  Panel4.Color := Primary;
  Panel5.Color := Primary;
  Panel6.Color := Primary;
  Panel7.Color := Primary;
  Panel8.Color := Primary;
  Panel9.Color := Primary;
  Panel10.Color := Secondary;
  Panel11.Color := Primary;
  Panel12.Color := Primary;
  Panel13.Color := Primary;
  Panel14.Color := Primary;
  Panel15.Color := Primary;
  Panel16.Color := Secondary;
  Panel17.Color := Primary;

  // Labels

  lblName.Font.Color := Secondary;
  lblEmail.Font.Color := Secondary;
  lblPassword.Font.Color := Secondary;
  lblPhoneNumber.Font.Color := Secondary;
  lblIDtitle.Font.Color := Secondary;
  lblBio.Font.Color := Secondary;
  lblMaxCharacters.Font.Color := Secondary;

  // Other

  redBio.Color := PrimaryBrighter;
  redBio.Font.Color := Secondary;
  redPhoneNumber.Color := PrimaryBrighter;
  redPhoneNumber.Font.Color := Secondary;
  redEmail.Color := PrimaryBrighter;
  redEmail.Font.Color := Secondary;

  edtID.Color := PrimaryBrighter;
  edtID.Font.Color := Secondary;
  edtPassword.Color := PrimaryBrighter;
  edtPassword.Font.Color := Secondary;

  // Other failsafing

  bEmailChanged := false;
  bPhoneNumberChanged := false;
  bPasswordChanged := false;
  bBioChanged := false;

  redBio.MaxLength := 255;
  redBio.Height := 201;
  lblMaxCharacters.Visible := false;

  sNewEmail := '';
  sNewPhoneNumber := '';
  sNewPassword := '';

  chkPassword.Checked := false;
  chkID.Checked := false;
  redBio.ReadOnly := true;
  edtID.ReadOnly := true;

  // Checking eligibility on clicking the confirm button

  if (sNewEmail = '') AND (sNewPhoneNumber = '') AND (sNewPassword = '') then
  begin
    bitConfirmChanges.Enabled := false;
  end
  else
  begin
    bitConfirmChanges.Enabled := true;
  end;

  if chkPassword.Checked = false then
  begin
    edtPassword.passwordchar := '*';
  end
  else
  begin
    edtPassword.passwordchar := #0;
  end;

  if chkID.Checked = false then
  begin
    edtID.passwordchar := '*';
  end
  else
  begin
    edtID.passwordchar := #0;
  end;

  With dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;
    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = iStudentProfileID then
      begin

        if iStudentProfileID = iStudentID then
        begin
          lblName.Caption := tblStudents['StudentName'] + ' ' + tblStudents
            ['Surname'] + ' (You)';
          redEmail.Text := tblStudents['Email'];
          edtPassword.Text := tblStudents['Password'];
          redPhoneNumber.Text := tblStudents['PhoneNumber'];
          edtID.Text := tblStudents['ID'];
          redBio.Text := tblStudents['Bio'];
          imgPfp.Picture.LoadFromFile(tblStudents['ProfilePicture']);

          bitChangeEmail.Enabled := true;
          bitChangePhoneNumber.Enabled := true;
          bitChangePassword.Enabled := true;
          bitChangeBio.Enabled := true;
          break;

        end
        else
        begin
          lblName.Caption := tblStudents['StudentName'] + ' ' + tblStudents
            ['Surname'];
          redEmail.Text := 'N/A';
          edtPassword.Text := 'N/A';
          redPhoneNumber.Text := 'N/A';
          edtID.Text := 'N/A';
          chkPassword.Checked := true;
          chkID.Checked := true;
          redBio.Text := tblStudents['Bio'];
          imgPfp.Picture.LoadFromFile(tblStudents['ProfilePicture']);

          bitChangeEmail.Enabled := false;
          bitChangePhoneNumber.Enabled := false;
          bitChangePassword.Enabled := false;
          bitChangeBio.Enabled := false;

          break;
        end;

      end
      else if tblStudents['StudentID'] = iStudentID then
      begin
        break;
      end;

      tblStudents.Next;
    end;

  end;
end;

procedure TfrmProfile.redBioChange(Sender: TObject);
var
  iCharactersLeft: integer;
begin
  lblMaxCharacters.Caption := 'Max Characters: 255';
  iCharactersLeft := 255 - (length(redBio.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

end.
