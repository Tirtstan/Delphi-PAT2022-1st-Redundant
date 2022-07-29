unit frmCourseInfo_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, dbPAT2022, JPEG, clsFormatCalculations,
  Vcl.Samples.Spin, VCLTee.TeCanvas, Math;

type
  TfrmCourseInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBack: TButton;
    Panel3: TPanel;
    lblCourseTitle: TLabel;
    imgCourse: TImage;
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
    lblLength: TLabel;
    lblUniversity: TLabel;
    lblFee: TLabel;
    redFee: TRichEdit;
    Panel7: TPanel;
    bitCalculateFee: TBitBtn;
    spnWeeks: TSpinEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    btnShowProfile: TButton;
    cmbStudents: TComboBox;
    lblRatingVisual: TLabel;
    lblRating: TLabel;
    tmrUniTooltip: TTimer;
    pnlUniTooltip: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    imgUniTooltip: TImage;
    Panel17: TPanel;
    lblProvince: TLabel;
    lblPublic: TLabel;
    Panel18: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure redReviewChange(Sender: TObject);
    procedure bitWriteReviewClick(Sender: TObject);
    procedure bitDeleteReviewClick(Sender: TObject);
    procedure bitConfirmReviewClick(Sender: TObject);
    procedure bitCalculateFeeClick(Sender: TObject);
    procedure btnShowProfileClick(Sender: TObject);
    procedure cmbStudentsChange(Sender: TObject);
    procedure lblUniversityMouseEnter(Sender: TObject);
    procedure lblUniversityMouseLeave(Sender: TObject);
    procedure lblUniversityClick(Sender: TObject);
    procedure lblUniversityMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tmrUniTooltipTimer(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    iCourseReviewID: Integer;
    sCourseRating: string;
  public
    { Public declarations }
  end;

var
  frmCourseInfo: TfrmCourseInfo;

implementation

uses

  frmCourseBrowser_U, frmUniversityInfo_U, frmUniversityBrowser_U, frmLogin_U,
  frmProfile_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmCourseInfo.bitCalculateFeeClick(Sender: TObject);
var
  rWeeks: real;
begin
  rWeeks := spnWeeks.Value;
  redFee.Text := FloatToStrF(objFormatCalculations.CalculateFee(rWeeks, lblFee),
    ffCurrency, 8, 2);
end;

procedure TfrmCourseInfo.bitConfirmReviewClick(Sender: TObject);
var
  dCurrentDate: TDateTime;
begin
  with dbmPAT2022 do
  begin

    dCurrentDate := now;
    tblCourseReviews.Open;
    tblCourseReviews.Sort := 'CReviewID ASC';

    tblCourseReviews.Last;
    iCourseReviewID := tblCourseReviews['CReviewID'];
    inc(iCourseReviewID);
    tblCourseReviews.Insert;
    tblCourseReviews.Append;
    tblCourseReviews['CReviewID'] := iCourseReviewID;
    tblCourseReviews['Review'] := redReview.Text;
    tblCourseReviews['StudentID'] := iStudentID;
    tblCourseReviews['CourseID'] := iCourseID;
    tblCourseReviews['Rating'] := StrToInt(sCourseRating);
    tblCourseReviews['ReviewDate'] := DateToStr(dCurrentDate);
    tblCourseReviews.Post;
    tblCourseReviews.Refresh;

    ShowMessage('Review Posted!');

    // Reload here
    redReviews.Clear;
    redReviews.Text := objFormatCalculations.LoadCourseReviewsV2(cmbStudents,
      lblRating);

    pnlButtons2.Visible := false;
    pnlWriteReview.Visible := false;
    bitWriteReview.Enabled := false;
    bitDeleteReview.Enabled := true;

  end;
end;

procedure TfrmCourseInfo.bitDeleteReviewClick(Sender: TObject);
var
  bFlag: boolean;
  iYesOrNo: Integer;
begin
  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;
    tblCourseReviews.First;
    iYesOrNo := MessageDlg('Are you sure you want to delete your review?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes);

    if iYesOrNo = mrYes then
    begin
      bFlag := true;
      while not(tblCourseReviews.Eof) OR (bFlag = true) do
      begin
        if (tblCourseReviews['StudentID'] = iStudentID) AND
          (tblCourseReviews['CourseID'] = iCourseID) then
        begin
          tblCourseReviews.Delete;
          tblCourseReviews.Refresh;
          bFlag := false;
        end;
        tblCourseReviews.Next;
      end;

      bitWriteReview.Enabled := true;
      bitDeleteReview.Enabled := false;

      // Reloading reviews
      redReviews.Clear;
      redReviews.Text := objFormatCalculations.LoadCourseReviewsV2(cmbStudents,
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

procedure TfrmCourseInfo.bitWriteReviewClick(Sender: TObject);
begin
  redReview.Clear;
  sCourseRating := InputBox('Student rating of the course',
    'Enter a number from 1 to 5', '');
  if (sCourseRating = '1') or (sCourseRating = '2') or (sCourseRating = '3') or
    (sCourseRating = '4') or (sCourseRating = '5') then
  begin
    pnlWriteReview.Visible := true;
    pnlButtons1.Visible := true;
    pnlButtons2.Visible := true;
    pnlConfirmReview.Visible := true;

    bitWriteReview.Enabled := false;
    bitConfirmReview.Visible := true;
  end
  else if sCourseRating = '' then
  begin
    exit;
  end
  else
  begin
    ShowMessage('Value doesn''t fall from ''1 to 5''');
    exit;
  end;
end;

procedure TfrmCourseInfo.btnBackClick(Sender: TObject);
begin
  frmCourseInfo.Close;
  frmCourseBrowser.Show;

end;

procedure TfrmCourseInfo.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCourseInfo.btnShowProfileClick(Sender: TObject);
var
  iPos: Integer;
  sStudent: string;
  sStudentName: string;
  sStudentSurname: string;
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

procedure TfrmCourseInfo.cmbStudentsChange(Sender: TObject);
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

procedure TfrmCourseInfo.FormCreate(Sender: TObject);
begin
  frmCourseInfo.Position := poScreenCenter;
  iCourseReviewID := 0;
  redReviews.Cursor := crDefault;

  pnlButtons2.Visible := false;

  pnlWriteReview.Visible := false;
  pnlConfirmReview.Visible := false;
end;

procedure TfrmCourseInfo.FormShow(Sender: TObject);
var
  bFlag: boolean;
  rRating: real;
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
  Panel12.Color := Primary;
  Panel13.Color := Secondary;
  pnlButtons1.Color := Primary;
  pnlButtons2.Color := Primary;
  pnlConfirmReview.Color := Secondary;
  pnlWriteReview.Color := Primary;
  pnlUniTooltip.Color := Primary;
  Panel14.Color := Secondary;
  Panel15.Color := Primary;
  Panel15.Font.Color := Secondary;
  Panel16.Color := Primary;
  Panel17.Color := Primary;
  Panel18.Color := Primary;

  // Labels

  lblCourseTitle.Font.Color := Secondary;
  lblMaxCharacters.Font.Color := Secondary;
  lblLength.Font.Color := Secondary;
  lblUniversity.Font.Color := Secondary;
  lblRating.Font.Color := Secondary;
  lblRatingVisual.Font.Color := Secondary;
  lblFee.Font.Color := Secondary;
  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
  Label4.Font.Color := Secondary;
  lblProvince.Font.Color := Secondary;
  lblPublic.Font.Color := Secondary;

  // Other colour stuff

  redDescription.Color := PrimaryBrighter;
  redDescription.Font.Color := Secondary;
  redReviews.Color := PrimaryBrighter;
  redReviews.Font.Color := Secondary;
  redReview.Color := PrimaryBrighter;
  redReview.Font.Color := Secondary;
  redFee.Color := PrimaryBrighter;
  redFee.Font.Color := Secondary;

  spnWeeks.Color := PrimaryBrighter;
  spnWeeks.Font.Color := Secondary;

  // Other

  pnlUniTooltip.Visible := false;

  spnWeeks.Value := 1;
  redFee.Clear;
  redReview.MaxLength := 255;
  bitWriteReview.Enabled := true;
  bitDeleteReview.Enabled := false;

  tmrUniTooltip.Enabled := false;
  tmrUniTooltip.Interval := 1500;

  btnShowProfile.Enabled := false;

  // Load course's reviews

  redReviews.Clear;
  redReviews.Text := objFormatCalculations.LoadCourseReviewsV2(cmbStudents,
    lblRating);

  // Load all of the course's length, fee and image

  bFlag := true;

  with dbmPAT2022 do
  begin
    tblCourses.Open;
    tblCourses.First;
    while NOT(tblCourses.Eof) OR (bFlag = true) do
    begin
      if iCourseID = tblCourses['CourseID'] then
      begin
        lblCourseTitle.Caption := tblCourses['Course'];
        imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);
        lblLength.Caption := tblCourses['CourseLength'];
        lblFee.Caption := 'R' + FloatToStrF(tblCourses['Fee'], ffFixed, 8, 2);
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;

  // Description
  redDescription.Clear;
  redDescription.Text := objFormatCalculations.FindCourseDescription();

  // University, public/private and province (for tooltip)
  imgUniTooltip.Proportional := true;
  imgUniTooltip.Center := true;

  lblUniversity.Caption := objFormatCalculations.FindCourseUni();

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) do
    begin
      if tblCourses['CourseID'] = iCourseID then
      begin

        tblUniversities.First;
        while NOT(tblUniversities.Eof) do
        begin
          if tblUniversities['UniversityID'] = tblCourses['UniversityID'] then
          begin
            lblProvince.Caption := tblUniversities['Province'];
            lblPublic.Caption := BoolToStr(tblUniversities['Public']);

            if lblPublic.Caption = '-1' then
            begin
              lblPublic.Caption := 'Public';
            end
            else
            begin
              lblPublic.Caption := 'Private';
            end;

            imgUniTooltip.Picture.LoadFromFile
              ('Uni' + IntToStr(tblUniversities['UniversityID']) + '.jpg');
          end;
          tblUniversities.Next;
        end;
      end;
      tblCourses.Next;
    end;
  end;

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

  // Checking eligibility for deletion or creation of a review

  bFlag := true;
  with dbmPAT2022 do
  begin
    tblCourseReviews.First;
    while NOT(tblCourseReviews.Eof) AND (bFlag = true) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin
        if (tblCourseReviews['StudentID'] = iStudentID) then
        begin
          bitWriteReview.Enabled := false;
          bitDeleteReview.Enabled := true;
          bFlag := false;
        end;
      end;
      tblCourseReviews.Next;
    end;
  end;
  // Scary ^ DON'T TOUCH
end;

procedure TfrmCourseInfo.lblUniversityClick(Sender: TObject);
var
  bFlag: boolean;
begin
  bFlag := true;
  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.Sort := 'UniversityID ASC';
    tblUniversities.First;

    while NOT(tblUniversities.Eof) OR (bFlag = true) do
    begin
      if tblUniversities['University'] = lblUniversity.Caption then
      begin
        sUniversityName := tblUniversities['University'];
        { frmCourseInfo.close;
          frmUniversityInfo.Show; }

        objFormatCalculations.FormHideShow(frmCourseInfo, frmUniversityInfo);
        bFlag := false;
      end;
      tblUniversities.Next;
    end;
  end;

end;

procedure TfrmCourseInfo.lblUniversityMouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUniversity);
  lblUniversity.hint := lblUniversity.Caption;

  tmrUniTooltip.Enabled := true;
end;

procedure TfrmCourseInfo.lblUniversityMouseLeave(Sender: TObject);
begin
  lblUniversity.Font.Color := Secondary;
  lblUniversity.Font.style := [fsBold];

  pnlUniTooltip.Visible := false;
  tmrUniTooltip.Enabled := false;
end;

procedure TfrmCourseInfo.lblUniversityMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  CursorPos: tPoint;
begin
  CursorPos := Mouse.CursorPos;
  pnlUniTooltip.Top := (CursorPos.Y - 165);
  pnlUniTooltip.Left := (CursorPos.X - 400);
end;

procedure TfrmCourseInfo.redReviewChange(Sender: TObject);
var
  iCharactersLeft: Integer;
begin
  iCharactersLeft := 255 - (length(redReview.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

procedure TfrmCourseInfo.tmrUniTooltipTimer(Sender: TObject);
begin
  pnlUniTooltip.Visible := true;
end;

end.
