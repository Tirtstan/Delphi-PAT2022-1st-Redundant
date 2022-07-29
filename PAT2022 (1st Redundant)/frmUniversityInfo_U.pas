unit frmUniversityInfo_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, dbPAT2022, JPEG, clsFormatCalculations, Math;

type
  TfrmUniversityInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBack: TButton;
    Panel3: TPanel;
    lblUniTitle: TLabel;
    imgUni: TImage;
    Panel4: TPanel;
    redDescription: TRichEdit;
    Label1: TLabel;
    Panel5: TPanel;
    btnClose: TButton;
    redReviews: TRichEdit;
    Panel6: TPanel;
    Label2: TLabel;
    pnlButtons1: TPanel;
    pnlWriteReview: TPanel;
    redReview: TRichEdit;
    Label3: TLabel;
    Panel10: TPanel;
    Panel9: TPanel;
    pnlConfirmReview: TPanel;
    bitWriteReview: TBitBtn;
    bitDeleteReview: TBitBtn;
    bitConfirmReview: TBitBtn;
    lblMaxCharacters: TLabel;
    pnlButtons2: TPanel;
    Panel8: TPanel;
    Label4: TLabel;
    Panel11: TPanel;
    lblProvince: TLabel;
    lblPublic: TLabel;
    lstUniCourses: TListBox;
    pnlLst: TPanel;
    lblUniverCourses: TLabel;
    Panel7: TPanel;
    btnMoreInfo: TButton;
    pnlButtons3: TPanel;
    Panel13: TPanel;
    btnShowProfile: TButton;
    cmbStudents: TComboBox;
    lblRatingVisual: TLabel;
    lblRating: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure redReviewChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitWriteReviewClick(Sender: TObject);
    procedure bitDeleteReviewClick(Sender: TObject);
    procedure bitConfirmReviewClick(Sender: TObject);
    procedure btnMoreInfoClick(Sender: TObject);
    procedure lstUniCoursesClick(Sender: TObject);
    procedure lblUniverCoursesMouseEnter(Sender: TObject);
    procedure lblUniverCoursesMouseLeave(Sender: TObject);
    procedure lblUniverCoursesClick(Sender: TObject);
    procedure btnShowProfileClick(Sender: TObject);
    procedure cmbStudentsChange(Sender: TObject);
    procedure lblUniTitleMouseEnter(Sender: TObject);
    procedure lblUniTitleMouseLeave(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    sUniversityRating: string;
    iUniversityReviewID: Integer;
  public
    { Public declarations }
    sStudentName, sStudentSurname: string;
  end;

var
  frmUniversityInfo: TfrmUniversityInfo;
  iUniversityID: Integer;

implementation

uses
  frmUniversityBrowser_U, frmRegister_U, frmLogin_U, frmCourseBrowser_U,
  frmCourseInfo_U, frmProfile_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmUniversityInfo.bitConfirmReviewClick(Sender: TObject);
var
  dCurrentDate: TDateTime;
begin
  with dbmPAT2022 do
  begin
    dCurrentDate := now;
    tblUniversityReviews.Open;
    tblUniversityReviews.Sort := 'UReviewID ASC';

    tblUniversityReviews.Last;
    iUniversityReviewID := tblUniversityReviews['UReviewID'];
    inc(iUniversityReviewID);
    tblUniversityReviews.Insert;
    tblUniversityReviews.Append;
    tblUniversityReviews['UReviewID'] := iUniversityReviewID;
    tblUniversityReviews['Review'] := redReview.Text;
    tblUniversityReviews['StudentID'] := iStudentID;
    tblUniversityReviews['UniversityID'] := iUniversityID;
    tblUniversityReviews['Rating'] := StrToInt(sUniversityRating);
    tblUniversityReviews['ReviewDate'] := DateToStr(dCurrentDate);
    tblUniversityReviews.Post;
    tblUniversityReviews.Refresh;

    ShowMessage('Review Posted!');

    // Reload here
    redReviews.Clear;
    redReviews.Text := objFormatCalculations.LoadUniReviewsV2(cmbStudents,
      lblRating);

    pnlButtons2.Visible := false;
    pnlWriteReview.Visible := false;
    bitWriteReview.Enabled := false;
    bitDeleteReview.Enabled := true;
  end;
end;

procedure TfrmUniversityInfo.bitDeleteReviewClick(Sender: TObject);
var
  bFlag: boolean;
  iYesOrNo: Integer;
  bFlag2: boolean;
begin
  with dbmPAT2022 do
  begin
    tblUniversityReviews.Open;

    iYesOrNo := MessageDlg('Are you sure you want to delete your review?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes);

    // Finding the correct university
    tblUniversities.First;
    if iYesOrNo = mrYes then
    begin
      bFlag := true;
      bFlag2 := true;

      // Deleting the correct review

      tblUniversityReviews.First;
      while not(tblUniversityReviews.Eof) OR (bFlag2 = true) do
      begin
        if (tblUniversityReviews['StudentID'] = iStudentID) AND
          (tblUniversityReviews['UniversityID'] = iUniversityID) then
        begin
          tblUniversityReviews.Delete;
          tblUniversityReviews.Refresh;
          bFlag2 := false;
        end;
        tblUniversityReviews.Next;
      end;

      bitWriteReview.Enabled := true;
      bitDeleteReview.Enabled := false;

      // Reloading reviews
      redReviews.Clear;
      redReviews.Text := objFormatCalculations.LoadUniReviewsV2(cmbStudents,
        lblRating);
      ShowMessage('Review deleted!');
    end
    else if iYesOrNo = mrNo then
    begin
      bitWriteReview.Enabled := false;
      bitDeleteReview.Enabled := true;
    end;
  end;

end;

procedure TfrmUniversityInfo.bitWriteReviewClick(Sender: TObject);
begin
  redReview.Clear;
  sUniversityRating := InputBox('Student rating of the university',
    'Enter a number from 1 to 5', '');
  if (sUniversityRating = '1') or (sUniversityRating = '2') or
    (sUniversityRating = '3') or (sUniversityRating = '4') or
    (sUniversityRating = '5') then
  begin
    pnlWriteReview.Visible := true;
    pnlButtons1.Visible := true;
    pnlButtons2.Visible := true;
    pnlConfirmReview.Visible := true;

    bitWriteReview.Enabled := false;
    bitConfirmReview.Visible := true;
  end
  else if sUniversityRating = '' then
  begin
    exit;
  end
  else
  begin
    ShowMessage('Value doesn''t fall from ''1 to 5''');
    exit;
  end;
end;

procedure TfrmUniversityInfo.btnMoreInfoClick(Sender: TObject);
var
  bFlag: boolean;
  iIndex: Integer;
  sItems: string;
  I: Integer;
begin
  bFlag := true;
  sItems := lstUniCourses.Items[lstUniCourses.ItemIndex];

  with dbmPAT2022 do
  begin
    tblCourses.Open;
    tblCourses.Sort := 'CourseID ASC';
    tblCourses.First;

    while NOT(tblCourses.Eof) OR (bFlag = true) do
    begin
      if sItems = tblCourses['Course'] then
      begin
        iCourseID := tblCourses['CourseID'];
        { frmUniversityInfo.Close;
          frmCourseInfo.Show; }
        objFormatCalculations.FormHideShow(frmUniversityInfo, frmCourseInfo);
        bFlag := false;
      end
      else if sItems = '-1' then
      begin
        ShowMessage('Please select a course.');
      end;

      tblCourses.Next;
    end;
  end;

end;

procedure TfrmUniversityInfo.btnShowProfileClick(Sender: TObject);
var
  iPos: Integer;
  sStudent: string;
begin

  with dbmPAT2022 do
  begin

    sStudent := cmbStudents.Items[cmbStudents.ItemIndex];
    iPos := pos(' ', sStudent);
    sStudentName := copy(sStudent, 1, iPos - 1);
    Delete(sStudent, 1, iPos);

    sStudentSurname := copy(sStudent, 1);
    tblStudents.First;
    // Debug
    // ShowMessage(sStudentName + sStudentSurname);

    while NOT(tblStudents.Eof) do
    begin
      if (sStudentName = tblStudents['StudentName']) AND
        (sStudentSurname = tblStudents['Surname']) then
      begin
        btnShowProfile.Enabled := true;
        iStudentProfileID := tblStudents['StudentID'];
        frmProfile.Show;
        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TfrmUniversityInfo.cmbStudentsChange(Sender: TObject);
begin
  if cmbStudents.ItemIndex = -1 then
  begin
    btnShowProfile.Enabled := false;
  end
  else
  begin
    btnShowProfile.Enabled := true;
  end;

end;

procedure TfrmUniversityInfo.btnBackClick(Sender: TObject);
begin
  frmUniversityInfo.Close;
  frmUniversityBrowser.Show;

end;

procedure TfrmUniversityInfo.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmUniversityInfo.FormCreate(Sender: TObject);
begin
  frmUniversityInfo.Position := poScreenCenter;
  iUniversityReviewID := 0;
  redReviews.Cursor := crDefault;

  pnlButtons2.Visible := false;

  pnlWriteReview.Visible := false;
  pnlConfirmReview.Visible := false;

  btnMoreInfo.Enabled := false;
  btnShowProfile.Enabled := false;

  btnMoreInfo.Enabled := false;
end;

procedure TfrmUniversityInfo.FormShow(Sender: TObject);
var
  iStudentIDReview: Integer;
  sLine, sReviewerName, sPublic: string;
  iCount: Integer;
  rRating: real;
  iRating: Integer;
begin

  // Colour Scheme

  // Panels

  Panel1.Color := Primary;
  Panel2.Color := Secondary;
  Panel3.Color := Primary;
  Panel4.Color := Primary;
  Panel5.Color := Secondary;
  Panel6.Color := Primary;
  Panel7.Color := Secondary;
  Panel8.Color := Primary;
  Panel9.Color := Secondary;
  Panel10.Color := Secondary;
  Panel11.Color := Primary;
  Panel13.Color := Secondary;
  pnlConfirmReview.Color := Secondary;
  pnlLst.Color := Primary;
  Panel11.Color := Primary;
  pnlButtons1.Color := Primary;
  pnlButtons2.Color := Primary;
  pnlButtons3.Color := Primary;
  pnlWriteReview.Color := Primary;

  // Labels

  lblUniTitle.Font.Color := Secondary;
  lblMaxCharacters.Font.Color := Secondary;
  lblProvince.Font.Color := Secondary;
  lblPublic.Font.Color := Secondary;
  lblUniverCourses.Font.Color := Secondary;
  lblRatingVisual.Font.Color := Secondary;
  lblRating.Font.Color := Secondary;
  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
  Label4.Font.Color := Secondary;

  // Boxes

  lstUniCourses.Color := PrimaryBrighter;
  lstUniCourses.Font.Color := Secondary;
  redDescription.Color := PrimaryBrighter;
  redDescription.Font.Color := Secondary;
  redReviews.Color := PrimaryBrighter;
  redReviews.Font.Color := Secondary;
  redReview.Color := PrimaryBrighter;
  redReview.Font.Color := Secondary;

  // Other stuff

  redReview.MaxLength := 255;
  iUniversityID := 0;
  bitWriteReview.Enabled := true;
  bitDeleteReview.Enabled := false;

  // Set the correct university desciption, title, public/private, province and picture
  lblUniTitle.Caption := sUniversityName;

  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.First;
    while NOT(tblUniversities.Eof) do
    begin
      if sUniversityName = tblUniversities['University'] then
      begin
        iUniversityID := tblUniversities['UniversityID'];
        redDescription.Text := tblUniversities['Description'];
        imgUni.Picture.LoadFromFile('Uni' + IntToStr(iUniversityID) + '.jpg');
        if BoolToStr(tblUniversities['Public']) = '-1' then
        begin
          sPublic := 'Public';
        end
        else if BoolToStr(tblUniversities['Public']) = '0' then
        begin
          sPublic := 'Private'
        end;
        lblPublic.Caption := sPublic;
        lblProvince.Caption := tblUniversities['Province'];
        break;
      end;
      tblUniversities.Next;
    end;
  end;

  // University's Courses Display listbox version

  lstUniCourses.Items.Clear;
  with dbmPAT2022 do
  begin
    tblCourses.Open;
    tblCourses.First;
    while NOT(tblCourses.Eof) do
    begin
      if tblCourses['UniversityID'] = iUniversityID then
      begin
        lstUniCourses.Items.Add(tblCourses['Course']);
      end;
      tblCourses.Next;
    end;

  end;

  // Displaying reviews

  redReviews.Clear;
  redReviews.Text := objFormatCalculations.LoadUniReviewsV2(cmbStudents,
    lblRating);

  // Rating Visual

  rRating := Ceil(StrToFloat(lblRating.Caption));

  if rRating = 1 then
  begin
    lblRatingVisual.Caption := '*';
  end
  else if rRating = 2 then
  begin
    lblRatingVisual.Caption := '**';
  end
  else if rRating = 3 then
  begin
    lblRatingVisual.Caption := '***';
  end
  else if rRating = 4 then
  begin
    lblRatingVisual.Caption := '****';
  end
  else if rRating = 5 then
  begin
    lblRatingVisual.Caption := '*****';
  end;

  // SCARY \/
  with dbmPAT2022 do
  begin
    tblUniversityReviews.First;
    while NOT(tblUniversityReviews.Eof) do
    begin
      if tblUniversityReviews['UniversityID'] = iUniversityID then
      begin
        if (tblUniversityReviews['StudentID'] = iStudentID) then
        begin
          bitWriteReview.Enabled := false;
          bitDeleteReview.Enabled := true;
          break;
        end;
      end;
      tblUniversityReviews.Next;
    end;
  end;
  // SCARY ^ DON'T TOUCH

end;

procedure TfrmUniversityInfo.lblUniTitleMouseEnter(Sender: TObject);
begin
  lblUniTitle.ShowHint := true;
  lblUniTitle.Hint := lblUniTitle.Caption;
end;

procedure TfrmUniversityInfo.lblUniTitleMouseLeave(Sender: TObject);
begin
  lblUniTitle.ShowHint := false;
end;

procedure TfrmUniversityInfo.lblUniverCoursesClick(Sender: TObject);
begin
  { frmUniversityInfo.Close;
    frmCourseBrowser.Show; }

  objFormatCalculations.FormHideShow(frmUniversityInfo, frmCourseBrowser);
end;

procedure TfrmUniversityInfo.lblUniverCoursesMouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUniverCourses);
end;

procedure TfrmUniversityInfo.lblUniverCoursesMouseLeave(Sender: TObject);
begin
  lblUniverCourses.Font.Color := Secondary;
end;

procedure TfrmUniversityInfo.lstUniCoursesClick(Sender: TObject);
begin
  if lstUniCourses.ItemIndex = -1 then
  begin
    btnMoreInfo.Enabled := false;
  end
  else
  begin
    btnMoreInfo.Enabled := true;
  end;
end;

procedure TfrmUniversityInfo.redReviewChange(Sender: TObject);
var
  iCharactersLeft: Integer;
begin
  iCharactersLeft := 255 - (length(redReview.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

end.
