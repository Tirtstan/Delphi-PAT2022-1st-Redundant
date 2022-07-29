unit clsFormatCalculations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Edge, DB, dbPAT2022;

type
  TFormatCalculation = class(TObject)
  private
    { private declarations }
  public
    procedure MouseEnterLabel(sample: TLabel);
    procedure MouseLeaveLabel(sample, ifsample: TLabel);
    procedure MouseLeaveLabelUni(sample, selected: TLabel);
    procedure CourseBrowserInfo(course: TLabel);
    procedure UniBrowserInfo(lblUni, lblProvince, lblPublic: TLabel;
      redOut: TRichEdit);
    function FindCourseID(lblCourse: TLabel): integer;
    function FindCourseDescription(): string;
    function FindCourseLength(lblCourse: TLabel): string;
    function FindCourseFee(lblCourse: TLabel): real;
    function FindCourseUni(): string;
    function LoadUniReviews(): string;
    function LoadUniReviewsV2(cmbStudents: TComboBox;
      lblRating: TLabel): string;
    function LoadCourseReviews(): string;
    function LoadCourseReviewsV2(cmbStudents: TComboBox;
      lblRating: TLabel): string;
    function CalculateFee(rWeeks: real; lblFee: TLabel): real;
    procedure FormHideShow(frmHide, frmShow: TForm);
    procedure FormBack(); // Too basic, need more variables, maybe later
    function FindPrimary(var tFile: Textfile): TColor;
    function FindPrimaryBrighter(var tFile: Textfile): TColor;
    function FindSecondary(var tFile: Textfile): TColor;
    function FindSecondaryBrighter(var tFile: Textfile): TColor;
  end;

var
  tBack: Textfile;
  frmPreviousShow, frmPreviousHide: TForm;

implementation

uses
  frmCourseBrowser_U, frmUniversityBrowser_U, frmUniversityInfo_U, frmLogin_U,
  frmWelcome_U, frmCustomise_U;

{ TFormatCalculation }

function TFormatCalculation.CalculateFee(rWeeks: real; lblFee: TLabel): real;
var
  sFee: string;
begin
  sFee := copy(lblFee.Caption, 2, 100);
  result := rWeeks * StrToFloat(sFee);
end;

procedure TFormatCalculation.CourseBrowserInfo(course: TLabel);
begin
  with dbmPAT2022 do
  begin
    course.Caption := tblCourses['Course'];
    tblCourses.Next;
  end;
end;

function TFormatCalculation.FindCourseDescription(): string;
var
  tCourseDescriptions: Textfile;
  sCourseID, sLine: string;
  iPos: integer;
  bFlag: boolean;
begin
  if FileExists('CourseDescriptions.txt') then
  begin
    assignfile(tCourseDescriptions, 'CourseDescriptions.txt');
    Reset(tCourseDescriptions);
    while NOT(EOF(tCourseDescriptions)) do
    begin
      readln(tCourseDescriptions, sLine);
      iPos := pos('|', sLine);
      sCourseID := copy(sLine, 1, iPos - 1);
      if sCourseID = IntToStr(iCourseID) then
      begin

        Delete(sLine, 1, iPos);
        iPos := pos('/', sLine);
        result := copy(sLine, 1, iPos - 1);
        break;
      end;

    end;
    closeFile(tCourseDescriptions);
  end
  else
  begin
    ShowMessage
      ('"CourseDescriptions.txt" file for a course''s info is missing.');
    closeFile(tCourseDescriptions);
    exit;
  end;
end;

function TFormatCalculation.FindCourseFee(lblCourse: TLabel): real;
var
  bFlag: boolean;
begin
  // Finding CourseID
  bFlag := True;

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.EOF) OR (bFlag = True) do
    begin
      if (tblCourses['CourseID']) = StrToInt(copy(lblCourse.Name, 10)) then
      begin
        result := tblCourses['Fee'];
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;

end;

function TFormatCalculation.FindCourseID(lblCourse: TLabel): integer;
var
  bFlag: boolean;
begin
  // Finding CourseID
  bFlag := True;

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.EOF) OR (bFlag = True) do
    begin
      if (tblCourses['CourseID']) = StrToInt(copy(lblCourse.Name, 10, 2)) then
      begin
        result := tblCourses['CourseID'];
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;

end;

function TFormatCalculation.FindCourseLength(lblCourse: TLabel): string;
var
  bFlag: boolean;
begin
  // Finding length
  bFlag := True;

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.EOF) OR (bFlag = True) do
    begin
      if (tblCourses['CourseID']) = StrToInt(copy(lblCourse.Name, 10, 2)) then
      begin
        result := tblCourses['CourseLength'];
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;
end;

function TFormatCalculation.FindCourseUni: string;
begin
  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.EOF) do
    begin
      if tblCourses['CourseID'] = iCourseID then
      begin
        tblUniversities.First;
        while NOT(tblUniversities.EOF) do
        begin
          if tblUniversities['UniversityID'] = tblCourses['UniversityID'] then
          begin
            result := tblUniversities['University'];
          end;
          tblUniversities.Next;
        end;
      end;
      tblCourses.Next;
    end;
  end;
end;

function TFormatCalculation.FindPrimary(var tFile: Textfile): TColor;
var
  sPrimary, sLine, sP: string;
  iPos: integer;
begin

  // Primary

  Reset(tFile);
  while NOT(EOF(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sP := (copy(sLine, 1, iPos - 1));
    if sP = '1' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sPrimary := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sPrimary);
      break;
    end;
  end;
end;

function TFormatCalculation.FindPrimaryBrighter(var tFile: Textfile): TColor;
var
  sPrimaryBrighter, sPB, sLine: string;
  iPos: integer;
begin

  // Primary Brighter

  Reset(tFile);
  while NOT(EOF(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sPB := (copy(sLine, 1, iPos - 1));
    if sPB = '2' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sPrimaryBrighter := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sPrimaryBrighter);
      break;
    end;
  end;
end;

function TFormatCalculation.FindSecondary(var tFile: Textfile): TColor;
var
  sLine, sSecondary, sS: string;
  iPos: integer;
begin

  // Secondary

  Reset(tFile);
  while NOT(EOF(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sS := (copy(sLine, 1, iPos - 1));
    if sS = '3' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sSecondary := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sSecondary);
      break;
    end;
  end;
end;

function TFormatCalculation.FindSecondaryBrighter(var tFile: Textfile): TColor;
var
  sLine, sSecondaryBrighter, sSB: string;
  iPos: integer;
begin

  // Secondary Brighter
  Reset(tFile);
  while NOT(EOF(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sSB := (copy(sLine, 1, iPos - 1));
    if sSB = '4' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sSecondaryBrighter := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sSecondaryBrighter);
      break;
    end;
  end;
end;

procedure TFormatCalculation.FormBack;
begin
  frmPreviousShow.close;
  frmPreviousHide.Show;
end;

procedure TFormatCalculation.FormHideShow(frmHide, frmShow: TForm);
begin
  frmHide.close;
  frmShow.Show;

  frmPreviousHide := frmHide;
  frmPreviousShow := frmShow;
end;

function TFormatCalculation.LoadCourseReviews: string;
var
  bFlag: boolean;
  bFlag2: boolean;
  sLine: string;
  sReviewerName: string;
begin
  // Outputting the correct reviews
  bFlag := True;
  bFlag2 := True;
  sLine := '';
  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;
    tblCourseReviews.First;
    tblStudents.Open;

    bFlag := True;

    // Displaying all info for the courses

    while NOT(tblCourseReviews.EOF) OR (bFlag = True) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin

        // Getting Student Infomation for the revelant review

        tblStudents.First;
        while NOT(tblStudents.EOF) OR (bFlag2 = True) do
        begin
          if tblStudents['StudentID'] = tblCourseReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;
            bFlag2 := false;
          end;
          tblStudents.Next;
        end;

        // Displaying the Reviews for the relevant course

        sLine := sLine + sReviewerName + #13 +
          DateToStr(tblCourseReviews['ReviewDate']) + ' | ' +
          IntToStr(tblCourseReviews['Rating']) + '/5 ';
        sLine := sLine + #13 + tblCourseReviews['Review'] + #13 + #13;

        bFlag := false;

      end;
      tblCourseReviews.Next;
    end;
    result := sLine;
  end;
end;

function TFormatCalculation.LoadCourseReviewsV2(cmbStudents: TComboBox;
  lblRating: TLabel): string;
var
  bFlag: boolean;
  bFlag2: boolean;
  sLine: string;
  sReviewerName: string;
  rCount: real;
  rRatingTotal: real;
begin
  // Outputting the correct reviews
  bFlag := True;
  bFlag2 := True;
  sLine := '';
  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;
    tblCourseReviews.First;
    tblStudents.Open;

    cmbStudents.Clear;
    cmbStudents.Items.Clear;
    bFlag := True;

    // Dispalying all info for the courses
    rCount := 0;

    while NOT(tblCourseReviews.EOF) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin
        rCount := rCount + 1;
        rRatingTotal := rRatingTotal + tblCourseReviews['Rating'];
        // Getting Student Infomation for the revelant review

        tblStudents.First;
        while NOT(tblStudents.EOF) do
        begin
          if tblStudents['StudentID'] = tblCourseReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            cmbStudents.Items.Add(sReviewerName);
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;

          end;
          tblStudents.Next;
        end;

        // Displaying the Reviews for the relevant course

        sLine := sLine + sReviewerName + #13 +
          DateToStr(tblCourseReviews['ReviewDate']) + ' | ' +
          IntToStr(tblCourseReviews['Rating']) + '/5 ';
        sLine := sLine + #13 + tblCourseReviews['Review'] + #13 + #13;

      end;
      tblCourseReviews.Next;
    end;
    lblRating.Caption := FloatToStrF(rRatingTotal / rCount, ffFixed, 8, 1);
    result := sLine;
  end;
end;

function TFormatCalculation.LoadUniReviews: string;
var
  bFlag: boolean;
  bFlag2: boolean;
  sLine: string;
  sReviewerName: string;
begin
  // Outputting the correct reviews
  bFlag := True;
  bFlag2 := True;
  sLine := '';
  with dbmPAT2022 do
  begin
    tblUniversityReviews.Open;
    tblUniversityReviews.First;
    tblStudents.Open;

    bFlag := True;

    // Dispalying all info for the university

    while NOT(tblUniversityReviews.EOF) OR (bFlag = True) do
    begin
      if tblUniversityReviews['UniversityID'] = iUniversityID then
      begin

        // Getting Student Infomation for the revelant review

        tblStudents.First;
        while NOT(tblStudents.EOF) OR (bFlag2 = True) do
        begin
          if tblStudents['StudentID'] = tblUniversityReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;
            bFlag2 := false;
          end;
          tblStudents.Next;
        end;

        // Displaying the Reviews for the relevant university

        sLine := sLine + sReviewerName + #13 +
          DateToStr(tblUniversityReviews['ReviewDate']) + ' | ' +
          IntToStr(tblUniversityReviews['Rating']) + '/5 ';
        sLine := sLine + #13 + tblUniversityReviews['Review'] + #13 + #13;

        bFlag := false;

      end;
      tblUniversityReviews.Next;
    end;
    result := sLine;
  end;
end;

function TFormatCalculation.LoadUniReviewsV2(cmbStudents: TComboBox;
  lblRating: TLabel): string;
var
  bFlag: boolean;
  bFlag2: boolean;
  sLine: string;
  sReviewerName: string;
  rRatingTotal, rCount: real;
begin
  // Outputting the correct reviews
  bFlag := True;
  bFlag2 := True;
  sLine := '';
  with dbmPAT2022 do
  begin
    tblUniversityReviews.Open;
    tblUniversityReviews.First;
    tblStudents.Open;

    bFlag := True;
    cmbStudents.Clear;
    cmbStudents.Items.Clear;
    rCount := 0;
    // Dispalying all info for the university

    while NOT(tblUniversityReviews.EOF) do
    begin
      if tblUniversityReviews['UniversityID'] = iUniversityID then
      begin
        rCount := rCount + 1;
        rRatingTotal := rRatingTotal + tblUniversityReviews['Rating'];
        // Getting Student Infomation for the revelant review

        tblStudents.First;
        while NOT(tblStudents.EOF) do
        begin
          if tblStudents['StudentID'] = tblUniversityReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            cmbStudents.Items.Add(sReviewerName);
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;
          end;
          tblStudents.Next;
        end;

        // Displaying the Reviews for the relevant university

        sLine := sLine + sReviewerName + #13 +
          DateToStr(tblUniversityReviews['ReviewDate']) + ' | ' +
          IntToStr(tblUniversityReviews['Rating']) + '/5 ';
        sLine := sLine + #13 + tblUniversityReviews['Review'] + #13 + #13;

      end;
      tblUniversityReviews.Next;
    end;
    lblRating.Caption := FloatToStrF(rRatingTotal / rCount, ffFixed, 8, 1);
    result := sLine;
  end;
end;

procedure TFormatCalculation.MouseEnterLabel(sample: TLabel);
begin
  sample.font.Color := SecondaryBrighter;
  sample.font.style := [fsBold, fsUnderline];
  sample.Cursor := crHandPoint;
end;

procedure TFormatCalculation.MouseLeaveLabel(sample, ifsample: TLabel);
begin
  sample.font.Color := Secondary;

  if ifsample.Caption = sample.Caption then
  begin
    sample.font.style := [fsBold, fsUnderline];
  end
  else
  begin
    sample.font.style := [fsBold];
  end;
end;

procedure TFormatCalculation.MouseLeaveLabelUni(sample, selected: TLabel);
begin
  sample.font.Color := Secondary;
  sample.font.style := [fsBold];

  if sample.Caption = selected.Caption then
  begin
    sample.font.style := [fsBold, fsUnderline];
  end
  else
  begin
    sample.font.style := [fsBold];
  end;
end;

procedure TFormatCalculation.UniBrowserInfo(lblUni, lblProvince,
  lblPublic: TLabel; redOut: TRichEdit);
var
  sPublic: string;
begin
  with dbmPAT2022 do
  begin
    lblUni.Caption := tblUniversities['University'];
    lblProvince.Caption := tblUniversities['Province'];
    if BoolToStr(tblUniversities['Public']) = '-1' then
    begin
      sPublic := 'Public';
    end
    else if BoolToStr(tblUniversities['Public']) = '0' then
    begin
      sPublic := 'Private'
    end;
    lblPublic.Caption := sPublic;
    redOut.Text := tblUniversities['Description'];

    tblUniversities.Next;
  end;
end;

end.
