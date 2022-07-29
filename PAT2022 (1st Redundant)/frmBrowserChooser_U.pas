unit frmBrowserChooser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, JPEG,
  clsFormatCalculations;

type
  TfrmBrowserChooser = class(TForm)
    pnlChoose: TPanel;
    Label1: TLabel;
    pnlUniversities: TPanel;
    pnlCourses: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    btnUni: TButton;
    Panel1: TPanel;
    btnCourses: TButton;
    imgUni: TImage;
    imgCourse: TImage;
    btnClose: TButton;
    btnBack: TButton;
    btnProfile: TButton;
    procedure btnUniClick(Sender: TObject);
    procedure btnCoursesClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProfileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmBrowserChooser: TfrmBrowserChooser;

implementation

uses
  frmCourseBrowser_U, frmUniversityBrowser_U, frmLogin_U, frmProfile_U,
  frmWelcome_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmBrowserChooser.btnBackClick(Sender: TObject);
begin
  frmBrowserChooser.Hide;
  frmLogin.show;
end;

procedure TfrmBrowserChooser.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmBrowserChooser.btnCoursesClick(Sender: TObject);
begin
  frmBrowserChooser.Close;
  frmCourseBrowser.show;
end;

procedure TfrmBrowserChooser.btnProfileClick(Sender: TObject);
begin
  iStudentProfileID := iStudentID;
  frmProfile.show;
end;

procedure TfrmBrowserChooser.btnUniClick(Sender: TObject);
begin
  frmBrowserChooser.Close;
  frmUniversityBrowser.show;
end;

procedure TfrmBrowserChooser.FormCreate(Sender: TObject);
begin
  frmBrowserChooser.Position := poScreenCenter;
  imgUni.Proportional := true;
  imgCourse.Proportional := true;
  imgUni.Picture.LoadFromFile('Uni.png');
  imgCourse.Picture.LoadFromFile('Course.png');
end;

procedure TfrmBrowserChooser.FormShow(Sender: TObject);
begin
  // Colour Scheme

  // Panels

  pnlChoose.Color := Primary;
  pnlUniversities.Color := Secondary;
  pnlCourses.Color := Secondary;
  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel3.Color := Primary;
  Panel4.Color := Primary;

  // Labels

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;

end;

end.
