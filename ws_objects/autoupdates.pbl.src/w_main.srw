$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_8 from statictext within w_main
end type
type st_7 from statictext within w_main
end type
type st_6 from statictext within w_main
end type
type lb_status from listbox within w_main
end type
type st_status from statictext within w_main
end type
type pb_stop from picturebutton within w_main
end type
type pb_start from picturebutton within w_main
end type
type sle_starttime from singlelineedit within w_main
end type
type st_5 from statictext within w_main
end type
type st_4 from statictext within w_main
end type
type sle_dow from singlelineedit within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type sle_interval from singlelineedit within w_main
end type
type st_1 from statictext within w_main
end type
type pb_close from picturebutton within w_main
end type
end forward

global type w_main from window
integer width = 2386
integer height = 1708
boolean titlebar = true
string title = "Auto Update Database Support"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_8 st_8
st_7 st_7
st_6 st_6
lb_status lb_status
st_status st_status
pb_stop pb_stop
pb_start pb_start
sle_starttime sle_starttime
st_5 st_5
st_4 st_4
sle_dow sle_dow
st_3 st_3
st_2 st_2
sle_interval sle_interval
st_1 st_1
pb_close pb_close
end type
global w_main w_main

type variables
boolean gb_stoprunning
integer gi_interval
string gs_dow
string gs_status
integer li_default_interval
boolean gb_stopclicked
end variables

on w_main.create
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.lb_status=create lb_status
this.st_status=create st_status
this.pb_stop=create pb_stop
this.pb_start=create pb_start
this.sle_starttime=create sle_starttime
this.st_5=create st_5
this.st_4=create st_4
this.sle_dow=create sle_dow
this.st_3=create st_3
this.st_2=create st_2
this.sle_interval=create sle_interval
this.st_1=create st_1
this.pb_close=create pb_close
this.Control[]={this.st_8,&
this.st_7,&
this.st_6,&
this.lb_status,&
this.st_status,&
this.pb_stop,&
this.pb_start,&
this.sle_starttime,&
this.st_5,&
this.st_4,&
this.sle_dow,&
this.st_3,&
this.st_2,&
this.sle_interval,&
this.st_1,&
this.pb_close}
end on

on w_main.destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.lb_status)
destroy(this.st_status)
destroy(this.pb_stop)
destroy(this.pb_start)
destroy(this.sle_starttime)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_dow)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_interval)
destroy(this.st_1)
destroy(this.pb_close)
end on

event timer;Timer(0)
if(gb_stoprunning = false) then
	string ls_timer_interval
	ls_timer_interval = sle_interval.text
	integer li_timer_interval
	li_timer_interval = f_stoi(ls_timer_interval)
	st_status.text = "RUNNING"
	st_status.BackColor = rgb(0,255,0)
	st_status.TextColor = rgb(0,0,0)
	datetime dt_sysdatetime
	string ls_sysdatetime
	ls_sysdatetime = ""
	dt_sysdatetime = f_get_system_datetime(ls_sysdatetime)
	ls_sysdatetime = string(dt_sysdatetime)
	lb_status.additem(ls_sysdatetime + " Start timer loop")
	boolean bDoUpdates
	bDoUpdates = false
	boolean bEnableTimer
	bEnableTimer = false
	string lsa_parseoutdata[]
	integer li_num_parse_items
	boolean bWaitForIntervalTimeout
	bWaitForIntervalTimeout = false
	//------------------------------------------------------------------------
	string ls_currdate
	ls_currdate = ""
	datetime dt_currdate
	dt_currdate = f_get_system_datetime(ls_currdate) // 2/21/2024 07:24:00
	ls_currdate = String(dt_currdate) // 2/21/2024 07:34:00
	integer li_startday
	li_startday = DayNumber(date(dt_currdate))
	string ls_startday 
	ls_startday = string(li_startday)
	string ls_starthour
	string ls_startminute
	string ls_startsecond
	integer li_starthour
	integer li_startminute
	integer li_startsecond
	string ls_starttime
	integer li_num_colons
	string ls_currtime
	string ls_currhour
	string ls_currminute
	string ls_currsecond
	integer li_currhour
	integer li_currminute
	integer li_currsecond
	boolean bOkToContinue
	bOkToContinue = false
	int spos	
	//====================================================================
	string ls_dow
	ls_dow = sle_dow.text
	if((pos(ls_dow, ls_startday) > 0) or (ls_dow = "0")) then //running day of week check
		//running dow match. continue
		ls_starttime = sle_starttime.text
		li_num_colons = f_count_num_characters(ls_starttime, ":")
		if(li_num_colons = 2) then
			ls_starthour = ""
			ls_startminute = ""
			ls_startsecond = ""
			li_num_parse_items = f_parseoutstring_ext(ls_starttime, ":", ref lsa_parseoutdata)
			if(li_num_parse_items >= 3) then
				ls_starthour = lsa_parseoutdata[1]
				ls_startminute = lsa_parseoutdata[2]
				ls_startsecond = lsa_parseoutdata[3]
				li_starthour = f_stoi(ls_starthour)
				li_startminute = f_stoi(ls_startminute)
				li_startsecond = f_stoi(ls_startsecond)
				ls_currtime = ""
				li_currhour = 0
				li_currminute = 0
				li_currsecond = 0
				spos = pos(ls_currdate, " ")
				if(spos > 0) then
					ls_currtime = trim(mid(ls_currdate, (spos + 1)))
					li_num_parse_items = f_parseoutstring_ext(ls_currtime, ":", ref lsa_parseoutdata)
					if(li_num_parse_items >= 3) then
						ls_currhour = lsa_parseoutdata[1]
						ls_currminute = lsa_parseoutdata[2]
						ls_currsecond = lsa_parseoutdata[3]
						li_currhour = f_stoi(ls_currhour)
						li_currminute = f_stoi(ls_currminute)
						li_currsecond = f_stoi(ls_currsecond)
						bOkToContinue = true
					end if
				end if
				if(bOkToContinue = true) then
					if((li_starthour = li_currhour) and (li_startminute = li_currminute)) then
						bDoUpdates = true					
					else
						bEnableTimer = true
					end if
				else
					lb_status.additem("Invalid starttime format.")
					pb_stop.enabled = false
					pb_start.enabled = true
					pb_close.enabled = true
				end if
			else
				lb_status.additem("Invalid starttime format.")
				pb_stop.enabled = false
				pb_start.enabled = true
				pb_close.enabled = true
			end if
		else
			lb_status.additem("Notification: Invalid starttime. must be in format HH:MM:SS")		
		end if	
	else
		bEnableTimer = true
	end if
	if(bDoUpdates = true) then
		lb_status.additem(ls_sysdatetime + " Doing Updates")
		bWaitForIntervalTimeout = true
		//do update
		string ls_sql
		ls_sql = "select empno, dob, dobjd, empname, active from sns_employees where ((dobjd is null) or (dobjd = 0)) and active = 1 and empno > 0 and empno < 19999"
		string lsa_dobs[]
		integer li_num_dobs
		li_num_dobs = f_app_ds_populate_string_array_by_sql(ref lsa_dobs, ls_sql, gi_pad_len, gs_delim, gb_compress, ref sqlca)
		if(li_num_dobs > 0) then
			integer li_stop
			integer li_loop
			string ls_loopdata
			//---------------------
			long ll_empno
			string ls_dob
			long ll_dobjd
			string ls_empname
			integer li_num_updated
			integer li_num_errors
			//---------------------
			li_num_updated = 0
			li_num_errors = 0
			//---------------------
			for li_loop = 1 to li_num_dobs
				ls_loopdata = lsa_dobs[li_loop]
				li_num_parse_items = f_parseoutstring_ext(ls_loopdata, gs_delim, ref lsa_parseoutdata)
				if(li_num_parse_items >= 4) then
					ll_empno = f_stol(lsa_parseoutdata[1])
					if(ll_empno > 0) then
						ls_empname = lsa_parseoutdata[4]
						string ls_format
						string ls_month
						string ls_day
						string ls_year
						string ls_hour
						string ls_minute
						string ls_second
						string ls_date
						string ls_time
						integer li_rtn_status
						string ls_new_dob
						decimal dec_jddob
						date dt_date
						datetime dt_datetime
						integer li_chk_year
						integer li_dob_len
						//--------------------------------
						ls_format = "DD-MMM-YYYY" //INPUT FORMAT 
						ls_month = ""
						ls_day = ""
						ls_year = ""
						ls_hour = ""
						ls_minute = ""
						ls_second = ""
						ls_date = ""
						ls_time = ""
						ls_new_dob = ""
						//--------------------------------
						ls_dob = trim(lsa_parseoutdata[2])
						ll_dobjd = f_stol(lsa_parseoutdata[3])
						ls_empname = trim(lsa_parseoutdata[4])
						if(((IsNull(ls_dob) = true) or (ls_dob = "")) or (ll_dobjd = 0)) then
							//get dob from fm.io_employee
							//
							select dob into :ls_dob from fm.io_employee_add where empno = :ll_empno using SQLCA_FM;
							//
							if(IsNull(ls_dob) = true) then
								ls_dob = ""
								lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " DOB is blank")
							else
								//convert ls_dob from 06-JAN-86 to MM/DD/YYYY
								li_rtn_status = f_extract_sysdate_time_components_ext(ls_dob, ls_format, ref ls_month, ref ls_day, ref ls_year, ref ls_hour, ref ls_minute, ref ls_second, ref ls_date, ref ls_time)
								s_dt_values lstr_dt_values
								ls_month = f_convert_month(ls_month, true)
								li_chk_year = f_stoi(ls_year)
								lstr_dt_values.li_month = f_stoi(ls_month)
								lstr_dt_values.li_day = f_stoi(ls_day)
								lstr_dt_values.li_year = f_stoi(ls_year)
								lstr_dt_values.li_hour = f_stoi(ls_hour)
								lstr_dt_values.li_min = f_stoi(ls_minute)
								lstr_dt_values.li_sec = f_stoi(ls_second)
								ls_new_dob = f_format_datetime_string_ext(true, lstr_dt_values,true,true,'/',false,false,false,false,false)
								li_dob_len = f_len_ext(ls_new_dob)
								if(li_dob_len = 10) then
									dt_date = date(ls_new_dob)
									if(f_is_valid_date(dt_date) = true) then
										dt_datetime = datetime(dt_date)
										dec_jddob = f_get_julian_date_value_ext(dt_datetime)
										//lb_status
										//
										string ls_update_sql
										ls_update_sql = "update sns_employees set dobjd = " + string(dec_jddob) + " where empno = " + string(ll_empno)
										//
										execute immediate :ls_update_sql using sqlca;
										//
										//lb_status.additem(ls_update_sql)
										if(sqlca.sqlcode <> -1) then
											//
											commit using sqlca;
											//
											li_num_updated++
										else
											//
											rollback using sqlca;
											//
											li_num_errors++
										end if
									else
										lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " newdob is not valid=" + ls_new_dob)
									end if
								else
									lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " newdob length is not valid=" + ls_new_dob)
								end if
							end if
						end if
					end if //ll_empno > 0 chk
				end if
				Yield()
			next
			if((li_num_updated > 0) or (li_num_errors > 0)) then
				lb_status.additem("#Updates: " + string(li_num_updated) + " #Errors=" + string(li_num_errors))
			end if
		end if
		bEnableTimer = true
	else
		bEnableTimer = true
	end if
 	f_delay(5)
	st_status.text = "WAITING"
	st_status.BackColor = rgb(255,0,0)
	st_status.TextColor = rgb(255,255,255)
	if(gb_stopclicked = true) then
		pb_close.enabled = true
	end if
	Yield()
	if(bEnableTimer = true) then
		if(bWaitForIntervalTimeout = true) then
			integer li_wait_time
			li_wait_time = f_stoi(ls_timer_interval)
			li_wait_time = (li_wait_time * 2)
			lb_status.additem(ls_sysdatetime + " Waiting for Delay Timeout: " + string(li_wait_time) + "secs")
			f_delay(li_wait_time)
			lb_status.additem(ls_sysdatetime + " Continuing timer running")
		end if
		Timer(li_timer_interval)
	end if
end if 
end event

event open;gb_stoprunning = true
pb_start.enabled = true
pb_stop.enabled = false
li_default_interval = 2
end event

type st_8 from statictext within w_main
integer x = 873
integer y = 264
integer width = 507
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "(hh:mm:ss)"
boolean focusrectangle = false
end type

type st_7 from statictext within w_main
integer x = 933
integer y = 420
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "0=for daily"
boolean focusrectangle = false
end type

type st_6 from statictext within w_main
integer x = 933
integer y = 328
integer width = 361
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Day Numbers"
boolean focusrectangle = false
end type

type lb_status from listbox within w_main
integer x = 14
integer y = 700
integer width = 2309
integer height = 876
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type st_status from statictext within w_main
integer x = 549
integer y = 612
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 255
string text = "WAITING"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_stop from picturebutton within w_main
integer x = 763
integer y = 488
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Stop"
boolean originalsize = true
long textcolor = 16777215
long backcolor = 255
end type

event clicked;gb_stoprunning = true
pb_start.enabled = true
pb_stop.enabled = false
gb_stopclicked = true
timer(0)

end event

type pb_start from picturebutton within w_main
integer x = 457
integer y = 488
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Start"
boolean originalsize = true
long backcolor = 65280
end type

event clicked;if(gb_stoprunning = true) then
	gb_stoprunning = false
	string ls_interval
	ls_interval = sle_interval.text
	gi_interval = f_stoi(ls_interval)
	if(gi_interval = 0) then
		gi_interval = 2
	end if
	gs_status = "WAITING"
	lb_status.reset()
	pb_start.enabled = false
	pb_stop.enabled = true
	pb_close.enabled = false
	gb_stopclicked = false
	Timer(gi_interval, w_main)
	//====================================================================
end if
end event

type sle_starttime from singlelineedit within w_main
integer x = 549
integer y = 248
integer width = 306
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "00:01:00"
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_main
integer x = 233
integer y = 264
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "StartTime:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_main
integer x = 928
integer y = 376
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "(sun=1,mon=2...sat=7)"
boolean focusrectangle = false
end type

type sle_dow from singlelineedit within w_main
integer x = 549
integer y = 356
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2,3,4,5,6"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_main
integer x = 238
integer y = 372
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "Run DOW: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 850
integer y = 160
integer width = 507
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "(secs / 0=only once)"
boolean focusrectangle = false
end type

type sle_interval from singlelineedit within w_main
integer x = 549
integer y = 136
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "30"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_main
integer x = 23
integer y = 152
integer width = 517
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "Running Interval:"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_close from picturebutton within w_main
integer x = 9
integer y = 24
integer width = 334
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean originalsize = true
long textcolor = 16777215
long backcolor = 255
end type

event clicked;close(w_main)
end event

