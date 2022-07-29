unit frmCourseBrowser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, DB, dbPAT2022, clsFormatCalculations;

type
  TfrmCourseBrowser = class(TForm)
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    btnBack: TButton;
    btnClose: TButton;
    pnlCourse1: TPanel;
    lblTitle: TLabel;
    lblCourse1: TLabel;
    pnlTitle: TPanel;
    pnlCourseInfo: TPanel;
    Panel2: TPanel;
    lblCourseInfo: TLabel;
    Panel3: TPanel;
    lblLength: TLabel;
    lblDescription: TLabel;
    redDescription: TRichEdit;
    lblUniversity: TLabel;
    pnlCourse2: TPanel;
    lblCourse2: TLabel;
    pnlCourse3: TPanel;
    lblCourse3: TLabel;
    pnlCourse4: TPanel;
    lblCourse4: TLabel;
    pnlCourse5: TPanel;
    lblCourse5: TLabel;
    pnlCourse6: TPanel;
    lblCourse6: TLabel;
    pnlCourse7: TPanel;
    lblCourse7: TLabel;
    pnlCourse8: TPanel;
    lblCourse8: TLabel;
    pnlCourse9: TPanel;
    lblCourse9: TLabel;
    pnlCourse10: TPanel;
    lblCourse10: TLabel;
    pnlCourse11: TPanel;
    lblCourse11: TLabel;
    pnlCourse12: TPanel;
    lblCourse12: TLabel;
    pnlCourse13: TPanel;
    lblCourse13: TLabel;
    pnlCourse14: TPanel;
    lblCourse14: TLabel;
    pnlCourse15: TPanel;
    lblCourse15: TLabel;
    pnlCourse16: TPanel;
    lblCourse16: TLabel;
    pnlCourse17: TPanel;
    lblCourse17: TLabel;
    pnlCourse18: TPanel;
    lblCourse18: TLabel;
    imgCourse: TImage;
    pnlImg: TPanel;
    lblFee: TLabel;
    pnlMoreInfo: TPanel;
    btnMoreInfo: TButton;
    Panel4: TPanel;
    procedure btnBackClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblCourse1MouseEnter(Sender: TObject);
    procedure lblCourse1MouseLeave(Sender: TObject);
    procedure lblCourse1Click(Sender: TObject);
    procedure lblCourse2Click(Sender: TObject);
    procedure lblCourse2MouseLeave(Sender: TObject);
    procedure lblCourse2MouseEnter(Sender: TObject);
    procedure lblCourse3Click(Sender: TObject);
    procedure lblCourse3MouseEnter(Sender: TObject);
    procedure lblCourse3MouseLeave(Sender: TObject);
    procedure lblCourse4Click(Sender: TObject);
    procedure lblCourse4MouseLeave(Sender: TObject);
    procedure lblCourse4MouseEnter(Sender: TObject);
    procedure lblCourse5Click(Sender: TObject);
    procedure lblCourse5MouseEnter(Sender: TObject);
    procedure lblCourse5MouseLeave(Sender: TObject);
    procedure lblCourse6Click(Sender: TObject);
    procedure lblCourse6MouseLeave(Sender: TObject);
    procedure lblCourse6MouseEnter(Sender: TObject);
    procedure lblCourse7Click(Sender: TObject);
    procedure lblCourse7MouseEnter(Sender: TObject);
    procedure lblCourse7MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCourse8Click(Sender: TObject);
    procedure lblCourse8MouseEnter(Sender: TObject);
    procedure lblCourse8MouseLeave(Sender: TObject);
    procedure lblCourse9Click(Sender: TObject);
    procedure lblCourse9MouseEnter(Sender: TObject);
    procedure lblCourse9MouseLeave(Sender: TObject);
    procedure lblCourse10Click(Sender: TObject);
    procedure lblCourse10MouseEnter(Sender: TObject);
    procedure lblCourse10MouseLeave(Sender: TObject);
    procedure lblCourse11Click(Sender: TObject);
    procedure lblCourse11MouseEnter(Sender: TObject);
    procedure lblCourse11MouseLeave(Sender: TObject);
    procedure lblCourse12Click(Sender: TObject);
    procedure lblCourse12MouseLeave(Sender: TObject);
    procedure lblCourse12MouseEnter(Sender: TObject);
    procedure lblCourse13Click(Sender: TObject);
    procedure lblCourse13MouseEnter(Sender: TObject);
    procedure lblCourse13MouseLeave(Sender: TObject);
    procedure lblCourse14Click(Sender: TObject);
    procedure lblCourse14MouseEnter(Sender: TObject);
    procedure lblCourse14MouseLeave(Sender: TObject);
    procedure lblCourse15Click(Sender: TObject);
    procedure lblCourse15MouseEnter(Sender: TObject);
    procedure lblCourse15MouseLeave(Sender: TObject);
    procedure lblCourse16Click(Sender: TObject);
    procedure lblCourse16MouseLeave(Sender: TObject);
    procedure lblCourse16MouseEnter(Sender: TObject);
    procedure lblCourse17Click(Sender: TObject);
    procedure lblCourse17MouseEnter(Sender: TObject);
    procedure lblCourse17MouseLeave(Sender: TObject);
    procedure lblCourse18Click(Sender: TObject);
    procedure lblCourse18MouseEnter(Sender: TObject);
    procedure lblCourse18MouseLeave(Sender: TObject);
    procedure btnMoreInfoClick(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmCourseBrowser: TfrmCourseBrowser;
  arrCoursePictures: array [1 .. 18] of string = (
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '7.png',
    '8.png',
    '9.png',
    '10.png',
    '11.png',
    '12.jpg',
    '13.jpg',
    '14.jpg',
    '15.png',
    '16.jpg',
    '17.png',
    '18.jpg'
  );
  iUniversityID, iCourseID: Integer;
  sUniversity, sCourseName: string;

implementation

uses
  frmLogin_U, frmUniversityBrowser_U, frmBrowserChooser_U, frmCourseInfo_U,
  frmCustomise_U;

{$R *.dfm}

procedure TfrmCourseBrowser.btnBackClick(Sender: TObject);
begin
  frmCourseBrowser.Close;
  frmBrowserChooser.Show;
end;

procedure TfrmCourseBrowser.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCourseBrowser.btnMoreInfoClick(Sender: TObject);
begin
  frmCourseBrowser.Close;
  frmCourseInfo.Show;
end;

procedure TfrmCourseBrowser.FormCreate(Sender: TObject);

begin
  frmCourseBrowser.Position := poScreenCenter;
  ScrollBox1.VertScrollBar.Visible := True;
  ScrollBox1.VertScrollBar.Range := 1900;
  ScrollBox1.VertScrollBar.Smooth := True;
  ScrollBox1.VertScrollBar.Tracking := True;

  pnlCourseInfo.Visible := false;

  iUniversityID := 0;
  iCourseID := 0;
end;

procedure TfrmCourseBrowser.FormShow(Sender: TObject);
var
  bFlag: boolean;
begin
  with dbmPAT2022 do
  begin
    tblCourses.Open;
    tblCourses.First;
  end;

  // Colour Scheme

  // Panels + Scrollbox

  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel3.Color := Primary;
  Panel4.Color := Secondary;
  pnlTitle.Color := Primary;
  ScrollBox1.Color := Secondary;
  pnlCourseInfo.Color := Secondary;
  pnlImg.Color := Secondary;
  pnlMoreInfo.Color := Primary;

  pnlCourse1.Color := Primary;
  pnlCourse2.Color := Primary;
  pnlCourse3.Color := Primary;
  pnlCourse4.Color := Primary;
  pnlCourse5.Color := Primary;
  pnlCourse6.Color := Primary;
  pnlCourse7.Color := Primary;
  pnlCourse8.Color := Primary;
  pnlCourse9.Color := Primary;
  pnlCourse10.Color := Primary;
  pnlCourse11.Color := Primary;
  pnlCourse12.Color := Primary;
  pnlCourse13.Color := Primary;
  pnlCourse14.Color := Primary;
  pnlCourse15.Color := Primary;
  pnlCourse16.Color := Primary;
  pnlCourse17.Color := Primary;
  pnlCourse18.Color := Primary;

  // Labels

  lblTitle.Font.Color := Secondary;
  lblCourseInfo.Font.Color := Secondary;
  lblLength.Font.Color := Secondary;
  lblDescription.Font.Color := Secondary;
  lblUniversity.Font.Color := Secondary;
  lblFee.Font.Color := Secondary;

  lblCourse1.Font.Color := Secondary;
  lblCourse2.Font.Color := Secondary;
  lblCourse3.Font.Color := Secondary;
  lblCourse4.Font.Color := Secondary;
  lblCourse5.Font.Color := Secondary;
  lblCourse6.Font.Color := Secondary;
  lblCourse7.Font.Color := Secondary;
  lblCourse8.Font.Color := Secondary;
  lblCourse9.Font.Color := Secondary;
  lblCourse10.Font.Color := Secondary;
  lblCourse11.Font.Color := Secondary;
  lblCourse12.Font.Color := Secondary;
  lblCourse13.Font.Color := Secondary;
  lblCourse14.Font.Color := Secondary;
  lblCourse15.Font.Color := Secondary;
  lblCourse16.Font.Color := Secondary;
  lblCourse17.Font.Color := Secondary;
  lblCourse18.Font.Color := Secondary;

  redDescription.Font.Color := Secondary;
  redDescription.Color := PrimaryBrighter;

  dbmPAT2022.tblUniversities.Open;
  dbmPAT2022.tblUniversities.First;

  // Adding info on each course panel
  dbmPAT2022.tblCourses.First;

  with objFormatCalculations do
  begin
    CourseBrowserInfo(lblCourse1);
    CourseBrowserInfo(lblCourse2);
    CourseBrowserInfo(lblCourse3);
    CourseBrowserInfo(lblCourse4);
    CourseBrowserInfo(lblCourse5);
    CourseBrowserInfo(lblCourse6);
    CourseBrowserInfo(lblCourse7);
    CourseBrowserInfo(lblCourse8);
    CourseBrowserInfo(lblCourse9);
    CourseBrowserInfo(lblCourse10);
    CourseBrowserInfo(lblCourse11);
    CourseBrowserInfo(lblCourse12);
    CourseBrowserInfo(lblCourse13);
    CourseBrowserInfo(lblCourse14);
    CourseBrowserInfo(lblCourse15);
    CourseBrowserInfo(lblCourse16);
    CourseBrowserInfo(lblCourse17);
    CourseBrowserInfo(lblCourse18);
  end;

end;

procedure TfrmCourseBrowser.lblCourse10Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse10.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse10);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse10);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse10), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse10MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse10);
end;

procedure TfrmCourseBrowser.lblCourse10MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse10, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse11Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse11.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse11);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse11);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse11), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse11MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse11);
end;

procedure TfrmCourseBrowser.lblCourse11MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse11, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse12Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse12.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse12);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse12);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse12), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse12MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse12);
end;

procedure TfrmCourseBrowser.lblCourse12MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse12, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse13Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse13.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse13);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse13);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse13), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse13MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse13);
end;

procedure TfrmCourseBrowser.lblCourse13MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse13, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse14Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse14.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse14);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse14);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse14), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse14MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse14);
end;

procedure TfrmCourseBrowser.lblCourse14MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse14, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse15Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse15.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse15);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse15);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse15), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse15MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse15);
end;

procedure TfrmCourseBrowser.lblCourse15MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse15, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse16Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse16.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse16);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse16);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse16), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse16MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse16);
end;

procedure TfrmCourseBrowser.lblCourse16MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse16, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse17Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse17.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse17);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse17);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse17), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse17MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse17);
end;

procedure TfrmCourseBrowser.lblCourse17MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse17, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse18Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse18.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse18);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse18);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse18), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse18MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse18);
end;

procedure TfrmCourseBrowser.lblCourse18MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse18, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse1Click(Sender: TObject);
var
  bFlag: boolean;
  tCourseDescriptions: TextFile;
  sCourseID: string;
  iPos: Integer;
  sLine: string;
  sCourseDescriptions: string;
  I: Integer;
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse1.Caption;

  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse1);


    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse1);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse1), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;
  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse1MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse1);
end;

procedure TfrmCourseBrowser.lblCourse1MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse1, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse2Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse2.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse2);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse2);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse2), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;
  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse2MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse2);
end;

procedure TfrmCourseBrowser.lblCourse2MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse2, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse3Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse3.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse3);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse3);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse3), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;
  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse3MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse3);
end;

procedure TfrmCourseBrowser.lblCourse3MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse3, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse4Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse4.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse4);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse4);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse4), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse4MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse4);
end;

procedure TfrmCourseBrowser.lblCourse4MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse4, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse5Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse5.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse5);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse5);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse5), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse5MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse5);
end;

procedure TfrmCourseBrowser.lblCourse5MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse5, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse6Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse6.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse6);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse6);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse6), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;
  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse6MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse6);
end;

procedure TfrmCourseBrowser.lblCourse6MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse6, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse7Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse7.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse7);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse7);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse7), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse7MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse7);
end;

procedure TfrmCourseBrowser.lblCourse7MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse7, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse8Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse8.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse9.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse8);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse8);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse8), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse8MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse8);
end;

procedure TfrmCourseBrowser.lblCourse8MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse8, lblCourseInfo);
end;

procedure TfrmCourseBrowser.lblCourse9Click(Sender: TObject);
begin
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := lblCourse9.Caption;

  lblCourse1.Font.Style := [fsBold];
  lblCourse2.Font.Style := [fsBold];
  lblCourse3.Font.Style := [fsBold];
  lblCourse4.Font.Style := [fsBold];
  lblCourse5.Font.Style := [fsBold];
  lblCourse6.Font.Style := [fsBold];
  lblCourse7.Font.Style := [fsBold];
  lblCourse8.Font.Style := [fsBold];
  lblCourse10.Font.Style := [fsBold];
  lblCourse11.Font.Style := [fsBold];
  lblCourse12.Font.Style := [fsBold];
  lblCourse13.Font.Style := [fsBold];
  lblCourse14.Font.Style := [fsBold];
  lblCourse15.Font.Style := [fsBold];
  lblCourse16.Font.Style := [fsBold];
  lblCourse17.Font.Style := [fsBold];
  lblCourse18.Font.Style := [fsBold];

  with objFormatCalculations do
  begin
    // Find CourseID

    iCourseID := FindCourseID(lblCourse9);

    // Description

    redDescription.Clear;
    redDescription.Text := FindCourseDescription();

    // Finding length of course

    lblLength.Caption := FindCourseLength(lblCourse9);

    // Finding Course Fee

    lblFee.Caption := FloatToStrF(FindCourseFee(lblCourse9), ffCurrency, 8, 2);

    // Finding which university the course is at

    lblUniversity.Caption := FindCourseUni;

  end;

  // Finding relevant picture

  imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);

end;

procedure TfrmCourseBrowser.lblCourse9MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblCourse9);
end;

procedure TfrmCourseBrowser.lblCourse9MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblCourse9, lblCourseInfo);
end;

end.
