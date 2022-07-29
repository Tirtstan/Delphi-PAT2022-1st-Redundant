unit dbPAT2022;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, ADODB;

type
  TdbmPAT2022 = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conPAT2022DB: TADOConnection;
    tblCourseReviews, tblCourses, tblUniversityReviews, tblUniversities,
      tblStudents: TADOTable;

    dsrCourseReviews, dsrCourses, dsrUniversityReviews, dsrUniversities,
      dsrStudents: TDataSource;

    dsSQL: TDataSource;

    qrySQL: TADOQuery;
  end;

var
  dbmPAT2022: TdbmPAT2022;

implementation

uses
  frmAdminPage_U;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdbmPAT2022.DataModuleCreate(Sender: TObject);
begin
  conPAT2022DB := TADOConnection.Create(dbmPAT2022);

  tblCourseReviews := TADOTable.Create(dbmPAT2022);
  tblCourses := TADOTable.Create(dbmPAT2022);
  tblUniversityReviews := TADOTable.Create(dbmPAT2022);
  tblUniversities := TADOTable.Create(dbmPAT2022);
  tblStudents := TADOTable.Create(dbmPAT2022);

  dsrCourseReviews := TDataSource.Create(dbmPAT2022);
  dsrCourses := TDataSource.Create(dbmPAT2022);
  dsrUniversityReviews := TDataSource.Create(dbmPAT2022);
  dsrUniversities := TDataSource.Create(dbmPAT2022);
  dsrStudents := TDataSource.Create(dbmPAT2022);

  qrySQL := TADOQuery.Create(dbmPAT2022);

  dsSQL := TDataSource.Create(dbmPAT2022);

  conPAT2022DB.Close;
  conPAT2022DB.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    ExtractFilePath(ParamStr(0)) + 'DBPAT2022.mdb' +
    ';Persist Security Info=False';

  conPAT2022DB.LoginPrompt := False;
  conPAT2022DB.Open;

  tblCourseReviews.Connection := conPAT2022DB;

  tblCourseReviews.TableName := 'tblCourseReviews';

  tblCourses.Connection := conPAT2022DB;
  tblCourses.TableName := 'tblCourses';

  tblUniversityReviews.Connection := conPAT2022DB;
  tblUniversityReviews.TableName := 'tblUniversityReviews';

  tblUniversities.Connection := conPAT2022DB;
  tblUniversities.TableName := 'tblUniversities';

  tblStudents.Connection := conPAT2022DB;
  tblStudents.TableName := 'tblStudents';

  dsrCourseReviews.DataSet := tblCourseReviews;
  dsrCourses.DataSet := tblCourses;
  dsrUniversityReviews.DataSet := tblUniversityReviews;
  dsrUniversities.DataSet := tblUniversities;
  dsrStudents.DataSet := tblStudents;

  qrySQL.Connection := conPAT2022DB;
  dsSQL.DataSet := qrySQL;

end;

end.
