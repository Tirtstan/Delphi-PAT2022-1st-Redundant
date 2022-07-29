unit frmRegister_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Menus, JPEG, clsValidation, dbPAT2022,
  clsFormatCalculations;

type
  TfrmRegister = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNameR: TEdit;
    Button1: TButton;
    Button2: TButton;
    edtSurnameR: TEdit;
    edtEmailR: TEdit;
    edtPasswordR: TEdit;
    edtIDR: TEdit;
    edtPhoneNumberR: TEdit;
    redBioR: TRichEdit;
    Panel4: TPanel;
    lblMaxCharacters: TLabel;
    btnRegisterR: TButton;
    pfp1: TImage;
    pfp2: TImage;
    pfp3: TImage;
    pfp4: TImage;
    pfp5: TImage;
    Panel5: TPanel;
    Label2: TLabel;
    lblPfp: TLabel;
    Panel6: TPanel;
    chkShowPassword: TCheckBox;
    lblNameError: TLabel;
    lblSurnameError: TLabel;
    lblEmailError: TLabel;
    lblPasswordError: TLabel;
    lblIDError: TLabel;
    lblPhoneNumberError: TLabel;
    lblPfpError: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label3: TLabel;
    lblBio: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure redBioRChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pfp1Click(Sender: TObject);
    procedure pfp2Click(Sender: TObject);
    procedure pfp3Click(Sender: TObject);
    procedure pfp4Click(Sender: TObject);
    procedure pfp5Click(Sender: TObject);
    procedure btnRegisterRClick(Sender: TObject);
    procedure chkShowPasswordClick(Sender: TObject);
  private
    { Private declarations }
    objValidation: TValidation;
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;
  sPfp: string;
  bPfp: boolean;

implementation

uses
  frmWelcome_U, frmLogin_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmRegister.btnRegisterRClick(Sender: TObject);
var
  bFlag, bName, bPassword, bID, bPhoneNumber, bSurname, bEmail, bEmailDatabase,
    bPhoneNumberDatabase, bBio, bIDDatabase: boolean;
begin

  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;
  end;

  lblNameError.Visible := true;
  lblSurnameError.Visible := true;
  lblEmailError.Visible := true;
  lblPasswordError.Visible := true;
  lblIDError.Visible := true;
  lblPhoneNumberError.Visible := true;
  lblPfpError.Visible := true;

  iStudentID := 0;

  // Name Validation
  bName := false;

  if (objValidation.TextValidation(edtNameR.Text) = true) then
  begin
    lblNameError.Font.Color := clLime;
    lblNameError.Caption := 'Valid Name.';
    bName := true;
  end
  else
  begin
    lblNameError.Font.Color := Secondary;
    lblNameError.Caption :=
      'Name cannot include special characters or numbers.';
    bName := false;
  end;

  // Surname Validation
  bSurname := false;

  if (objValidation.TextValidation(edtSurnameR.Text) = true) then
  begin
    lblSurnameError.Font.Color := clLime;
    lblSurnameError.Caption := 'Valid Surname.';
    bSurname := true;
  end
  else
  begin
    lblSurnameError.Font.Color := Secondary;
    lblSurnameError.Caption :=
      'Surname cannot include special characters or numbers.';
    bSurname := false;
  end;

  // Email and Email Database Validation
  bEmail := false;
  bEmailDatabase := false;

  if (objValidation.IsValidEmail(edtEmailR.Text) = true) then
  begin
    lblEmailError.Font.Color := clLime;
    lblEmailError.Caption := 'Valid Email.';
    bEmail := true;

    // Email Database Validation

    with dbmPAT2022 do
    begin
      tblStudents.Sort := 'StudentID ASC';
      tblStudents.First;
      while NOT(tblStudents.Eof) do
      begin
        if NOT(edtEmailR.Text = tblStudents['Email']) then
        begin
          lblEmailError.Font.Color := clLime;
          lblEmailError.Caption := 'Vaild Email.';
          bEmailDatabase := true;
        end
        else
        begin
          lblEmailError.Font.Color := Secondary;
          lblEmailError.Caption := 'Valid email but taken.';
          bEmailDatabase := false;
          break;
        end;
        tblStudents.Next;
      end;
    end;

  end
  else
  begin
    lblEmailError.Font.Color := Secondary;
    lblEmailError.Caption := 'Invalid Email.';
    bEmail := false;
  end;

  // Password Validation
  bPassword := false;

  if (objValidation.IsPasswordCrazy(edtPasswordR.Text) = true) then
  begin
    lblPasswordError.Font.Color := clLime;
    lblPasswordError.Caption := 'Valid Password.';
    bPassword := true;
  end
  else
  begin
    lblPasswordError.Font.Color := Secondary;
    lblPasswordError.Caption := 'Password too basic.';
    bPassword := false;
  end;

  // ID Validation
  bID := false;

  if (objValidation.ValidateIDNEW(edtIDR.Text) = true) then
  begin
    lblIDError.Font.Color := clLime;
    lblIDError.Caption := 'Valid ID.';
    bID := true;

    // ID Database validation

    with dbmPAT2022 do
    begin
      tblStudents.Sort := 'StudentID ASC';
      tblStudents.First;
      while NOT(tblStudents.Eof) do
      begin
        if NOT(edtIDR.Text = tblStudents['ID']) then
        begin
          lblIDError.Font.Color := clLime;
          lblIDError.Caption := 'Vaild ID.';
          bIDDatabase := true;
        end
        else
        begin
          lblIDError.Font.Color := Secondary;
          lblIDError.Caption := 'Valid ID but taken.';
          bIDDatabase := false;
          break;
        end;
        tblStudents.Next;
      end;
    end;

  end
  else
  begin
    lblIDError.Font.Color := Secondary;
    lblIDError.Caption := 'Invalid ID.';
    bID := false;
  end;

  // Phone Number Validation

  if (objValidation.IsPhoneNumber(edtPhoneNumberR.Text) = true) then
  begin
    lblPhoneNumberError.Font.Color := clLime;
    lblPhoneNumberError.Caption := 'Valid Phone Number.';
    bPhoneNumber := true;

    with dbmPAT2022 do
    begin
      tblStudents.Sort := 'StudentID ASC';
      tblStudents.First;
      while NOT(tblStudents.Eof) do
      begin
        if NOT(edtPhoneNumberR.Text = tblStudents['PhoneNumber']) then
        begin
          lblPhoneNumberError.Font.Color := clLime;
          lblPhoneNumberError.Caption := 'Vaild Phone Number.';
          bPhoneNumberDatabase := true;
        end
        else
        begin
          lblPhoneNumberError.Font.Color := Secondary;
          lblPhoneNumberError.Caption := 'Valid phone number but taken.';
          bPhoneNumberDatabase := false;
          break;
        end;
        tblStudents.Next;
      end;
    end;

  end
  else
  begin
    lblPhoneNumberError.Font.Color := Secondary;
    lblPhoneNumberError.Caption := 'Invalid Phone Number.';
    bPhoneNumber := false;
  end;

  // Profile Picture Vaildation

  if bPfp = false then
  begin
    lblPfpError.Font.Color := Secondary;
    lblPfpError.Caption := 'Invalid Profile Picture.';
  end;

  // Temp  Database Verification fix

  { bEmailDatabase := true;
    bPhoneNumberDatabase := true;
    bIDDatabase := true; }

  // Full Validation

  if (bPassword = true) AND (bName = true) AND (bSurname = true) AND
    (bEmail = true) AND (bEmailDatabase = true) AND (bPassword = true) AND
    (bID = true) AND (bIDDatabase = true) AND (bPhoneNumber = true) AND
    (bPhoneNumberDatabase = true) then
  begin
    // Database adding

    with dbmPAT2022 do
    begin
      tblStudents.Sort := 'StudentID ASC';
      tblStudents.Last;
      iStudentID := tblStudents['StudentID'];
      inc(iStudentID);
      tblStudents.Insert;
      tblStudents.Append;
      tblStudents['StudentID'] := iStudentID;
      tblStudents['StudentName'] := edtNameR.Text;
      tblStudents['Surname'] := edtSurnameR.Text;
      tblStudents['Email'] := edtEmailR.Text;
      tblStudents['Password'] := edtPasswordR.Text;
      tblStudents['ID'] := edtIDR.Text;
      tblStudents['PhoneNumber'] := edtPhoneNumberR.Text;
      tblStudents['Bio'] := redBioR.Text;
      tblStudents['ProfilePicture'] := sPfp;
      tblStudents.Post;
      tblStudents.Refresh;
    end;

    ShowMessage('Successfully Registered!');
    frmRegister.Close;
    frmLogin.Show;

  end
  else
  begin
    ShowMessage('Incorrect details.');
  end;

end;

procedure TfrmRegister.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmRegister.Button2Click(Sender: TObject);
begin
  frmRegister.Close;
  frmWelcome.Show;
end;

procedure TfrmRegister.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowPassword.Checked = false then
  begin
    edtPasswordR.PasswordChar := '*';
  end
  else
  begin
    edtPasswordR.PasswordChar := #0;
  end;
end;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  frmRegister.Position := poScreenCenter;

  edtPasswordR.PasswordChar := '*';

  lblNameError.Visible := false;
  lblSurnameError.Visible := false;
  lblEmailError.Visible := false;
  lblPasswordError.Visible := false;
  lblIDError.Visible := false;
  lblPhoneNumberError.Visible := false;
  lblPfpError.Visible := false;

end;

procedure TfrmRegister.FormShow(Sender: TObject);
var
  I: integer;
begin

  // Colour scheme stuff

  // Panels

  Panel1.Color := primary;
  Panel2.Color := Secondary;
  Panel3.Color := Secondary;
  Panel4.Color := primary;
  Panel5.Color := primary;
  Panel6.Color := Secondary;
  Panel7.Color := primary;
  Panel8.Color := primary;

  // Edit Boxes

  edtNameR.Color := PrimaryBrighter;
  edtNameR.Font.Color := Secondary;

  edtSurnameR.Color := PrimaryBrighter;
  edtSurnameR.Font.Color := Secondary;

  edtEmailR.Color := PrimaryBrighter;
  edtEmailR.Font.Color := Secondary;

  edtPasswordR.Color := PrimaryBrighter;
  edtPasswordR.Font.Color := Secondary;

  edtIDR.Color := PrimaryBrighter;
  edtIDR.Font.Color := Secondary;

  edtPhoneNumberR.Color := PrimaryBrighter;
  edtPhoneNumberR.Font.Color := Secondary;

  redBioR.Font.Color := Secondary;
  redBioR.Color := PrimaryBrighter;

  // Labels

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
  Label3.Color := primary;
  lblPfp.Font.Color := Secondary;
  lblMaxCharacters.Font.Color := Secondary;

  lblNameError.Color := primary;
  lblNameError.Font.Color := Secondary;

  lblSurnameError.Color := primary;
  lblSurnameError.Font.Color := Secondary;

  lblEmailError.Color := primary;
  lblEmailError.Font.Color := Secondary;

  lblPasswordError.Color := primary;
  lblPasswordError.Font.Color := Secondary;

  lblIDError.Color := primary;
  lblIDError.Font.Color := Secondary;

  lblPhoneNumberError.Color := primary;
  lblPhoneNumberError.Font.Color := Secondary;

  lblPfpError.Color := primary;
  lblPfpError.Font.Color := Secondary;

  lblBio.Font.Color := Secondary;

  // Loading stuff

  redBioR.MaxLength := 255;

  pfp1.Picture.LoadFromFile('hmmm2.png');
  pfp1.Cursor := crHandPoint;
  pfp1.Proportional := true;

  pfp2.Picture.LoadFromFile('ruairir (2).png');
  pfp2.Cursor := crHandPoint;
  pfp2.Proportional := true;

  pfp3.Picture.LoadFromFile('connorhot.jpg');
  pfp3.Cursor := crHandPoint;
  pfp3.Proportional := true;

  pfp4.Picture.LoadFromFile('satisfactory_logo_full_color_square.png');
  pfp4.Cursor := crHandPoint;
  pfp4.Proportional := true;

  pfp5.Picture.LoadFromFile('shroud.png');
  pfp5.Cursor := crHandPoint;
  pfp5.Proportional := true;

end;

procedure TfrmRegister.pfp1Click(Sender: TObject);
begin
  lblPfp.Caption := '(1. Selected)';
  sPfp := 'hmmm2.png';
  lblPfpError.Font.Color := clLime;
  lblPfpError.Caption := 'Valid Profile Picture.';
  bPfp := true;
end;

procedure TfrmRegister.pfp2Click(Sender: TObject);
begin
  lblPfp.Caption := '(2. Selected)';
  sPfp := 'ruairir (2).png';
  lblPfpError.Font.Color := clLime;
  lblPfpError.Caption := 'Valid Profile Picture.';
  bPfp := true;
end;

procedure TfrmRegister.pfp3Click(Sender: TObject);
begin
  lblPfp.Caption := '(3. Selected)';
  sPfp := 'connorhot.jpg';
  lblPfpError.Font.Color := clLime;
  lblPfpError.Caption := 'Valid Profile Picture.';
  bPfp := true;
end;

procedure TfrmRegister.pfp4Click(Sender: TObject);
begin
  lblPfp.Caption := '(4. Selected)';
  sPfp := 'satisfactory_logo_full_color_square.png';
  lblPfpError.Font.Color := clLime;
  lblPfpError.Caption := 'Valid Profile Picture.';
  bPfp := true;
end;

procedure TfrmRegister.pfp5Click(Sender: TObject);
begin
  lblPfp.Caption := '(5. Selected)';
  sPfp := 'shroud.png';
  lblPfpError.Font.Color := clLime;
  lblPfpError.Caption := 'Valid Profile Picture.';
  bPfp := true;
end;

procedure TfrmRegister.redBioRChange(Sender: TObject);
var
  iCharactersLeft: integer;
begin
  iCharactersLeft := 255 - (length(redBioR.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

end.
