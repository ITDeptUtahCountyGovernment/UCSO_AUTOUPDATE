$PBExportHeader$autoupdates.sra
$PBExportComments$Generated Application Object
forward
global type autoupdates from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
integer gi_pad_len
boolean gb_compress
string gs_delim
string gs_crlf
string gs_cr
string gs_lf
string gs_copyright_symbol
string gs_tab
string gs_winuser
string gs_dbconnection
string gs_ip_addr
string gs_computername
transaction SQLCA_FM
integer gi_bd_span_from
integer gi_bd_span_to
integer gi_bd_no_display
integer gi_bd_before_days
integer gi_bd_after_days
integer gi_bd_today
decimal gdec_bd_span_from
decimal gdec_bd_span_to
decimal gdec_currdate_jd

//nrtnvalue = 0 do not display birthday
//          = 1 birthday within 7 days
//          = 2 birthday past 7days
//          = 3 on birthday

end variables
global type autoupdates from application
string appname = "autoupdates"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "21.0.0.1506"
boolean manualsession = false
boolean unsupportedapierror = false
end type
global autoupdates autoupdates

on autoupdates.create
appname="autoupdates"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on autoupdates.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gs_dbconnection = "db1.world" //"db1_test" //"db1.world" 

// Profile justice_dev
SQLCA.DBMS = "O10 Oracle10g (10.1.0)"
SQLCA.LogPass = "JUSTICE"
SQLCA.ServerName = gs_dbconnection //"db1.world" or "db1_test"
SQLCA.LogId = "justice"
SQLCA.AutoCommit = False
SQLCA.DBParm = ""
connect using SQLCA;

string sqlerror = ""
//check for successful connection
if SQLCA.sqlcode < 0 then
	sqlerror = "DB ERROR! (DB1.WORLD-JUSTICE "
	sqlerror += SQLCA.sqlerrtext
	MessageBox("SQL CONNECT", sqlerror )
	halt
end if

select sys_context ('USERENV','IP_ADDRESS'),
		 sys_context ('USERENV','TERMINAL'),
		 sys_context ('USERENV','os_user')
into :gs_ip_addr,
     :gs_computername,
	 :gs_winuser
FROM dual
using sqlca;

string sqlerrorfm
//FM IO_EMPLOYEE, IO_DEPARTMENT 
// Profile SQLCA_FM
::SQLCA_FM = create transaction
// Profile FM DB1.WORLD
SQLCA_FM.DBMS = "O10 Oracle10g (10.1.0)"
SQLCA_FM.LogPass = "8b$dg#t13"
SQLCA_FM.ServerName = "db1.world"
SQLCA_FM.LogId = "FM"
SQLCA_FM.AutoCommit = False
SQLCA_FM.DBParm = ""
connect using SQLCA_FM;
//
//check for successful connection
if SQLCA_FM.sqlcode < 0 then
	sqlerrorfm = "DB ERROR! (DB1.WORLD-FM)"
	sqlerrorfm += SQLCA_FM.sqlerrtext
	MessageBox("SQL CONNECT", sqlerrorfm )
	halt
end if


//set global vars
gs_delim = "Ç" //char(128)
gs_crlf = "~r~n"
gs_cr = "~r"
gs_lf = "~n"
gs_copyright_symbol = "©"
gs_tab = "~t"
gi_pad_len = 120
gb_compress = true
gs_winuser = Trim(Upper(gs_winuser))

string ls_temp_parameter
ls_temp_parameter = f_get_settings_parameter("SYSTEM","BD_SPAN_FROM","ndata", ref sqlca)
gi_bd_span_from = f_stoi(ls_temp_parameter)
ls_temp_parameter = f_get_settings_parameter("SYSTEM","BD_SPAN_TO","ndata", ref sqlca)
gi_bd_span_to = f_stoi(ls_temp_parameter)

datetime ldt_sysdatetime
string ls_sysdatetime
ls_sysdatetime = ""
ldt_sysdatetime = f_get_system_datetime(ls_sysdatetime)
ls_sysdatetime = string(ldt_sysdatetime)
date ld_temp_curr_date
ld_temp_curr_date  = date(string(ldt_sysdatetime))
integer li_curr_day
integer li_curr_month
integer li_curr_year
li_curr_day = day(ld_temp_curr_date)
li_curr_month = month(ld_temp_curr_date)
li_curr_year = year(ld_temp_curr_date)
string ls_temp_curr_date
ls_temp_curr_date = f_lpad(string(li_curr_month), 2, "0") + "/" + f_lpad(string(li_curr_day), 2, "0") + "/" + string(li_curr_year) + " 00:00:00"
datetime ldt_temp_curr_datetime
ldt_temp_curr_datetime = datetime(ls_temp_curr_date)
gdec_currdate_jd = f_get_julian_date_value1900(ldt_temp_curr_datetime, true)
gdec_bd_span_from = (gdec_currdate_jd - (gi_bd_span_from * 86400))
gdec_bd_span_to = (gdec_currdate_jd + (gi_bd_span_from * 86400))

// 0 do not display birthday
// 1 birthday within 7 days
// 2 birthday past 7days
// 3 on birthday
gi_bd_no_display = 0
gi_bd_before_days = 1
gi_bd_after_days = 2
gi_bd_today = 3



open(w_main)
end event

