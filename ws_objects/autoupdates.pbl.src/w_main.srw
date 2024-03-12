$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type sle_num_specs_updated from singlelineedit within w_main
end type
type st_18 from statictext within w_main
end type
type st_16 from statictext within w_main
end type
type st_14 from statictext within w_main
end type
type sle_num_errors from singlelineedit within w_main
end type
type st_13 from statictext within w_main
end type
type st_12 from statictext within w_main
end type
type sle_num_updated from singlelineedit within w_main
end type
type st_11 from statictext within w_main
end type
type sle_num_processed from singlelineedit within w_main
end type
type st_10 from statictext within w_main
end type
type sle_to_process from singlelineedit within w_main
end type
type sle_last_ran from singlelineedit within w_main
end type
type st_9 from statictext within w_main
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
integer width = 2587
integer height = 3176
boolean titlebar = true
string title = "Auto Update Database Support"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_num_specs_updated sle_num_specs_updated
st_18 st_18
st_16 st_16
st_14 st_14
sle_num_errors sle_num_errors
st_13 st_13
st_12 st_12
sle_num_updated sle_num_updated
st_11 st_11
sle_num_processed sle_num_processed
st_10 st_10
sle_to_process sle_to_process
sle_last_ran sle_last_ran
st_9 st_9
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
integer gi_rowid
end variables

on w_main.create
this.sle_num_specs_updated=create sle_num_specs_updated
this.st_18=create st_18
this.st_16=create st_16
this.st_14=create st_14
this.sle_num_errors=create sle_num_errors
this.st_13=create st_13
this.st_12=create st_12
this.sle_num_updated=create sle_num_updated
this.st_11=create st_11
this.sle_num_processed=create sle_num_processed
this.st_10=create st_10
this.sle_to_process=create sle_to_process
this.sle_last_ran=create sle_last_ran
this.st_9=create st_9
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
this.Control[]={this.sle_num_specs_updated,&
this.st_18,&
this.st_16,&
this.st_14,&
this.sle_num_errors,&
this.st_13,&
this.st_12,&
this.sle_num_updated,&
this.st_11,&
this.sle_num_processed,&
this.st_10,&
this.sle_to_process,&
this.sle_last_ran,&
this.st_9,&
this.st_8,&
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
destroy(this.sle_num_specs_updated)
destroy(this.st_18)
destroy(this.st_16)
destroy(this.st_14)
destroy(this.sle_num_errors)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.sle_num_updated)
destroy(this.st_11)
destroy(this.sle_num_processed)
destroy(this.st_10)
destroy(this.sle_to_process)
destroy(this.sle_last_ran)
destroy(this.st_9)
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
	integer li_lb_begin_count
	integer li_lb_end_count
	li_lb_begin_count = lb_status.totalitems()
	li_lb_end_count = 0
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
	//lb_status.additem(ls_sysdatetime + " Start timer loop")
	sle_last_ran.text = ls_sysdatetime
	boolean bDoUpdates
	bDoUpdates = false
	boolean bEnableTimer
	bEnableTimer = false
	string lsa_parseoutdata[]
	integer li_num_parse_items
	boolean bWaitForIntervalTimeout
	bWaitForIntervalTimeout = false
	string ls_sql_err_text
	//------------------------------------------------------------------------
	string ls_currdate
	ls_currdate = ""
	datetime dt_currdate
	dt_currdate = f_get_system_datetime(ls_currdate) // 2/21/2024 07:24:00
	integer li_sysdate_year
	li_sysdate_year = 0
	li_sysdate_year = Year(Date(dt_currdate))
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
	decimal dec_currdate_jd
	boolean bUpdatedob
	boolean bUpdatedobjd
	boolean bUpdatedobupdatejd
	boolean bUpdatedobshort
	integer li_curr_day
	integer li_curr_month
	integer li_curr_year
	date ld_temp_curr_date
	ld_temp_curr_date = date(string(dt_sysdatetime))
	li_curr_day = day(ld_temp_curr_date)
	li_curr_month = month(ld_temp_curr_date)
	li_curr_year = year(ld_temp_curr_date)
	string ls_temp_curr_date
	ls_temp_curr_date = f_lpad(string(li_curr_month), 2, "0") + "/" + f_lpad(string(li_curr_day), 2, "0") + "/" + string(li_curr_year) + " 00:00:00"
	datetime ldt_temp_curr_datetime
	ldt_temp_curr_datetime = datetime(ls_temp_curr_date)
	dec_currdate_jd = f_get_julian_date_value1900(ldt_temp_curr_datetime, true)
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
		//update the system datetime JD and from and to JD's
		datetime ldt_sysdatetime
		ls_sysdatetime = ""
		ldt_sysdatetime = f_get_system_datetime(ls_sysdatetime)
		ls_sysdatetime = string(ldt_sysdatetime)
		ld_temp_curr_date  = date(string(ldt_sysdatetime))
		li_curr_day = day(ld_temp_curr_date)
		li_curr_month = month(ld_temp_curr_date)
		li_curr_year = year(ld_temp_curr_date)
		ls_temp_curr_date = f_lpad(string(li_curr_month), 2, "0") + "/" + f_lpad(string(li_curr_day), 2, "0") + "/" + string(li_curr_year) + " 00:00:00"
		ldt_temp_curr_datetime = datetime(ls_temp_curr_date)
		gdec_currdate_jd = f_get_julian_date_value1900(ldt_temp_curr_datetime, true)
		gdec_bd_span_from = abs((gdec_currdate_jd - (gi_bd_span_from * 86400)))
		gdec_bd_span_to = abs((gdec_currdate_jd + (gi_bd_span_from * 86400)))
		lb_status.additem(ls_sysdatetime + " Doing Updates")
		bWaitForIntervalTimeout = true
		//do update
		string ls_sql
		ls_sql = "select a.empno, a.dob, a.dobjd, a.dispbd, a.dispbdupdatejd, a.empname, a.active, a.dobshort, b.grpid "
		ls_sql += "from sns_employees a, sns_staffing_grps_positions2 b "
		ls_sql += "where a.active = 1 "
		ls_sql += "and ((a.empno > 0) and (a.empno < 19999)) "
		ls_sql += "and a.empno = b.assgnd_empno "
		ls_sql += "and ((a.dispbdupdatejd = 0) or (a.dispbdupdatejd is null) or (a.dispbdupdatejd <= " + string(gdec_currdate_jd) + ")) "
		//ls_sql += "and b.grpid in (117,118,135,136,137,138,139,140,59) "
		ls_sql += "order by b.grpid"
		//		
		//old sql ls_sql = "select empno, dob, dobjd, dispbd, dispbdupdatejd, empname, active, dobshort from sns_employees where active = 1 and ((empno > 0) and (empno < 19999)) and ((dobjd is null) or (dobjd = 0)) and dispbdupdatejd <= " + string(dec_currdate_jd)
		//
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
			string ls_empname
			integer li_num_updated
			integer li_num_specs_updated
			integer li_num_errors
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
			decimal dec_dispbdjd
			decimal dec_dispbdupdatejd
			decimal dec_dobjd
			decimal dec_bd_span_from
			decimal dec_bd_span_to
			date dt_date
			datetime dt_datetime
			datetime dt_shortbd
			integer li_chk_year
			integer li_dob_len
			integer nRtnDispBd
			string ls_update_sql	
			string ls_short_birthday
			string ls_dobshort
			long ll_grpid
			string ls_curryr_birthday
			decimal dec_num_past_days
			decimal dec_num_within_days
			decimal dec_temp_bd_span_from
			decimal dec_temp_bd_span_to
			integer li_temp_num
			string lsa_found_data[]
			long ll_temp_empno	
			boolean bupdate_board_specs
			//----------------------
			integer li_uloop
			integer li_upos
			long ll_uid //id of sns_board_specs record
			integer li_ucol //column of found empno
			string ls_uloopdata
			string ls_column_number
			string ls_dispbd_prefix
			string ls_dispbd
			string ls_dobsh_prefix
			string ls_dobsh
			string ls_sbs_update_sql			
			//---------------------
			li_num_updated = 0
			li_num_specs_updated = 0
			li_num_errors = 0
			dec_temp_bd_span_from = gdec_bd_span_from
			dec_temp_bd_span_to = gdec_bd_span_to		
			//---------------------
			sle_to_process.text = string(li_num_dobs)
			for li_loop = 1 to li_num_dobs
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
				ls_curryr_birthday = ""
				dec_dobjd = 0
				dec_jddob = 0
				dec_dispbdjd = 0
				dec_dispbdupdatejd = 0
				bUpdatedob = false
				bUpdatedobjd = false
				bUpdatedobupdatejd = false
				bUpdatedobshort = false
				nRtnDispBd = 0
				ls_update_sql = ""
				ls_short_birthday = ""
				ls_empname = ""
				ls_dobshort = ""
				ls_dob = ""
				dec_jddob = 0
				dec_dispbdjd = 0
				dec_dispbdupdatejd = 0
				dec_num_past_days = 0
				dec_num_within_days = 0
				bupdate_board_specs = false
				//---------------	-----------------				
				ls_loopdata = lsa_dobs[li_loop]
				li_num_parse_items = f_parseoutstring_ext(ls_loopdata, gs_delim, ref lsa_parseoutdata)
				if(li_num_parse_items >= 8) then
					ll_empno = f_stol(lsa_parseoutdata[1])
					if(ll_empno > 0) then
						if(ll_empno = 15378) then 
							//2/21
							li_stop = 0
						elseif(ll_empno = 18091) then
							//2/22
							li_stop = 0
						elseif(ll_empno = 17024) then
							//2/28
							li_stop = 0
						elseif(ll_empno = 16464) then
							//3/3
							li_stop = 0
						end if
						
						
						if(pos("15449,17872,15567", string(ll_empno)) > 0) then
							li_stop = 0
						end if
						
   					ls_empname = lsa_parseoutdata[6]
						ls_dobshort = trim(lsa_parseoutdata[8])
						ls_dob = trim(lsa_parseoutdata[2])
						if((IsNull(ls_dob) = true) or (ls_dob = "")) then
							ls_dob = ""
							//get dob from fm.io_employee
							//
							select dob into :ls_dob from io_employee_add where empno = :ll_empno using SQLCA_FM;
							//
							if((IsNull(ls_dob) = true) or (ls_dob = "")) then
								lb_status.additem("No DOB found in io_employee_add table. empno=" + string(ll_empno) + " empname=" + ls_empname)
								continue //skip to next record to update/check
							end if
							bUpdatedob = true
							bUpdatedobjd = true
						end if
						ls_empname = trim(lsa_parseoutdata[6])
						dec_jddob = f_stodec(lsa_parseoutdata[3])						
						dec_dispbdjd = f_stodec(lsa_parseoutdata[4])
						dec_dispbdupdatejd = f_stodec(lsa_parseoutdata[5])
						if(f_len_ext(ls_dobshort) = 0) then
							bUpdatedobshort = true
						end if
						integer li_curr_dispbd_rtn_value
						li_curr_dispbd_rtn_value = f_displayEmployeeBirthday(gi_bd_span_from, gi_bd_span_to, ls_dobshort) 
						
						if((dec_dispbdjd = 0) or (dec_dispbdjd <> li_curr_dispbd_rtn_value)) then
							bUpdatedobjd = true
						end if
						
						if((dec_dispbdupdatejd = 0) or (dec_dispbdupdatejd <> gdec_currdate_jd)) then
							bUpdatedobupdatejd = true
						end if		
						if(f_len_ext(ls_dob) < 10) then
							//convert ls_dob from 06-JAN-86 to MM/DD/YYYY if not already
							li_rtn_status = f_extract_sysdate_time_components_ext_mod(ls_dob, ls_format, li_sysdate_year, ref ls_month, ref ls_day, ref ls_year, ref ls_hour, ref ls_minute, ref ls_second, ref ls_date, ref ls_time)
						else
							ls_format = "MM/DD/YYYY"
							li_rtn_status = f_extract_sysdate_time_components_ext_mod(ls_dob, ls_format, li_sysdate_year, ref ls_month, ref ls_day, ref ls_year, ref ls_hour, ref ls_minute, ref ls_second, ref ls_date, ref ls_time)									
							ls_new_dob = ls_dob									
						end if
						s_dt_values lstr_dt_values
						ls_month = f_convert_month(ls_month, true)
						li_chk_year = f_stoi(ls_year)
						lstr_dt_values.li_month = f_stoi(ls_month)
						lstr_dt_values.li_day = f_stoi(ls_day)
						lstr_dt_values.li_year = f_stoi(ls_year)
						lstr_dt_values.li_hour = f_stoi(ls_hour)
						lstr_dt_values.li_min = f_stoi(ls_minute)
						lstr_dt_values.li_sec = f_stoi(ls_second)
						if(f_len_ext(ls_new_dob) = 0) then
							ls_new_dob = f_format_datetime_string_ext(true, lstr_dt_values,true,true,'/',false,false,false,false,false)
						end if
						
						li_dob_len = f_len_ext(ls_new_dob)
						if(li_dob_len = 10) then
							ls_short_birthday = mid(ls_new_dob, 1, 5)
							ls_curryr_birthday = ls_short_birthday + "/" + string(li_sysdate_year)
							dt_shortbd = datetime(ls_curryr_birthday)
							dec_dobjd = f_get_julian_date_value1900(dt_shortbd, false)	
							dec_num_past_days  = (abs(gdec_currdate_jd - dec_dobjd)/86400)
							dec_num_within_days  = (abs(gdec_currdate_jd + dec_dobjd)/86400)
							dt_date = date(ls_new_dob)
							if(f_is_valid_date(dt_date) = true) then
								//
								//update sns_employees
								//
								dt_datetime = datetime(dt_date)
								dec_jddob = f_get_julian_date_value1900(dt_datetime, false)			
								//build update sql
								ls_update_sql = "update sns_employees "
								if(bUpdatedob = true) then
									ls_update_sql += "set dob = '" + ls_new_dob + "' "
								end if	
								if(bUpdatedobjd = true) then
									if(pos(ls_update_sql, "set") = 0) then
										ls_update_sql += "set dobjd =" + string(dec_jddob) + " "
									else
										ls_update_sql += ", dobjd =" + string(dec_jddob) + " "
									end if
								end if
								nRtnDispBd = f_displayEmployeeBirthday(gi_bd_span_from, gi_bd_span_to, ls_short_birthday) 
								if((nRtnDispBd <> 0) or (bUpdatedobjd = true) or (dec_dispbdjd <> nRtnDispBd)) then
									dec_dispbdjd = gdec_currdate_jd
									if(pos(ls_update_sql, "set") = 0) then
										ls_update_sql += "set dispbd = " + string(nRtnDispBd) + " "
									else
										ls_update_sql += ", dispbd = " + string(nRtnDispBd) + " "
									end if
								end if
								if(bUpdatedobupdatejd = true) then
									dec_dispbdupdatejd = gdec_currdate_jd
									if(pos(ls_update_sql, "set") = 0) then
										ls_update_sql += "set dispbdupdatejd =" + string(dec_dispbdupdatejd) + " "
									else
										ls_update_sql += ", dispbdupdatejd =" + string(dec_dispbdupdatejd) + " "
									end if
								end if
								if(bUpdatedobshort = true) then
									ls_dobshort = ls_short_birthday
									if(pos(ls_update_sql, "set") = 0) then
										ls_update_sql += "set dobshort = '" + ls_dobshort + "' "
									else
										ls_update_sql += ", dobshort = '" + ls_dobshort + "' "
									end if
								end if
								if(pos(ls_update_sql, "set") = 0) then
									lb_status.additem("invalid update sql. empno=" + string(ll_empno) + " empname=" + ls_empname)
									continue //skip to next record to update/check
								else
									ls_update_sql += "where empno = " + string(ll_empno)
									//
									execute immediate :ls_update_sql using sqlca;
									//
									lb_status.additem(ls_update_sql)
									if(sqlca.sqlcode <> -1) then
										//
										commit using sqlca;
										//
										li_num_updated++
										bupdate_board_specs = true
									else
										ls_sql_err_text = sqlca.sqlerrtext
										//
										rollback using sqlca;
										//
										lb_status.additem("Error: " + ls_sql_err_text + ". empno=" + string(ll_empno) + " empname=" + ls_empname)
										li_num_errors++
									end if
								end if
								if(bupdate_board_specs = true) then
									//
									//update sns_board_specs
									//	
									li_temp_num = 0
									ll_temp_empno = 0
									ll_temp_empno = ll_empno 
									li_temp_num = f_retrieve_bd_specs_empno_columns(ll_temp_empno, ref lsa_found_data, ref sqlca)
									if(li_temp_num > 0) then
										//update dispbd_xxx = nRtnDispBd, dobsh_xxx = ls_short_birthday
										//example of lsa_found_data
										//15378 = 2|1, 109|1
										//18091 = 2|2, 54|1, 110|1
										//17024 = 14|1, 111|1
										//16464 = 112|1
										ls_sbs_update_sql = ""
										ls_dispbd_prefix = "dispbd_"
										ls_dobsh_prefix = "dobsh_"
										long ll_exists_id
										string ls_update_sbs_sql_check
										string lsa_exists[]
										integer li_num_exists_items
										boolean bOkToUpdateBoardSpecs
										for li_uloop = 1 to li_temp_num
											bOkToUpdateBoardSpecs = true
											ls_uloopdata = lsa_found_data[li_uloop]
											li_upos = pos(ls_uloopdata, "|")
											if(li_upos > 0) then
												ll_uid = f_stol(mid(ls_uloopdata, 1, (li_upos - 1)))
												li_ucol = f_stoi(mid(ls_uloopdata, (li_upos + 1)))
												if((ll_uid > 0) and (li_ucol > 0)) then
													ls_column_number = f_lpad(string(li_ucol), 3, "0")
													ls_dispbd = ls_dispbd_prefix + ls_column_number
													ls_dobsh = ls_dobsh_prefix + ls_column_number
													ls_sbs_update_sql = "update sns_board_specs set " + ls_dispbd + "=" + string(nRtnDispBd) + ", " + ls_dobsh + "= '" + ls_short_birthday + "' "
													ls_sbs_update_sql += "where id = " + string(ll_uid)
													//
													ls_update_sbs_sql_check = "select id," + ls_dispbd + "," + ls_dobsh + "	from sns_board_specs where id = " + string(ll_uid)
													//
													li_num_exists_items = f_app_ds_populate_string_array_by_sql(ref lsa_exists, ls_update_sbs_sql_check, gi_pad_len, gs_delim, gb_compress, ref sqlca)
													if(li_num_exists_items > 0) then
														integer li_epos
														li_epos = pos(lsa_exists[1], gs_delim)
														if(li_epos > 0) then
															string ls_temp_data
															ls_temp_data = trim(mid(lsa_exists[1], (li_epos + 1)))
															if((IsNull(ls_temp_data) = true) or (ls_temp_data = "") or (ls_temp_data = gs_delim)) then
																bOkToUpdateBoardSpecs = true
															else
																bOkToUpdateBoardSpecs = false
															end if
														end if
													end if
													if(bOkToUpdateBoardSpecs = true) then													
														if(f_len_ext(ls_sbs_update_sql) > 0) then
															//
																execute immediate :ls_sbs_update_sql using sqlca;
															//
															if(sqlca.sqlcode <> -1) then
																//
																commit using sqlca;
																//
																li_num_specs_updated++
															else
																ls_sql_err_text = sqlca.sqlerrtext
																//
																rollback using sqlca;
																//
																lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " failed to update sns_board_specs id#=" + string(ll_uid))
															end if
														end if
														end if
												end if
											end if
										next
									end if
								end if
							else
								lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " newdob is not valid=" + ls_new_dob)
							end if
						else
							lb_status.additem(ls_empname + " empno: " + string(ll_empno) + " newdob length is not valid=" + ls_new_dob)
						end if
					end if //ll_empno > 0 chk
				end if
				sle_num_processed.text = string(li_loop)
				sle_num_updated.text = string(li_num_updated)
				sle_num_specs_updated.text = string(li_num_specs_updated)
				sle_num_errors.text = string(li_num_errors)
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
	li_lb_end_count = lb_status.totalitems()
	if(li_lb_end_count > li_lb_begin_count) then
		integer li_scroll_index
		li_scroll_index = li_lb_end_count
		li_scroll_index = (li_scroll_index - 10)
		if(li_scroll_index > 0) then
			lb_status.SetTop(li_scroll_index)
		end if
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
gi_rowid = 0

Timer(0)
end event

event close;Timer(0)
Close(w_main)
end event

type sle_num_specs_updated from singlelineedit within w_main
integer x = 2217
integer y = 600
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_18 from statictext within w_main
integer x = 1751
integer y = 612
integer width = 453
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "#Specs Updated:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_16 from statictext within w_main
integer x = 1111
integer y = 512
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "To Process:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from statictext within w_main
integer x = 2048
integer y = 24
integer width = 485
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "03/07/2024 11:48"
boolean focusrectangle = false
end type

type sle_num_errors from singlelineedit within w_main
integer x = 379
integer y = 2964
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within w_main
integer x = 32
integer y = 2980
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "#Errors:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_main
integer x = 1019
integer y = 616
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "#Emp Updated:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_num_updated from singlelineedit within w_main
integer x = 1435
integer y = 600
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_main
integer x = 1838
integer y = 512
integer width = 370
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "#Processed:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_num_processed from singlelineedit within w_main
integer x = 2217
integer y = 492
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_main
integer x = 1111
integer y = 512
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33488896
long backcolor = 67108864
string text = "To Process:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_to_process from singlelineedit within w_main
integer x = 1435
integer y = 496
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type sle_last_ran from singlelineedit within w_main
integer x = 1527
integer y = 248
integer width = 581
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_main
integer x = 1211
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
string text = "Last Ran:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_main
integer x = 873
integer y = 264
integer width = 334
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
integer width = 2514
integer height = 2260
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

event clicked;if((gb_stoprunning = true) or (st_status.text = "WAITING")) then
	Timer(0)
	close(w_main)
else
	MessageBox("Notification", "Click the stop button to close!")
end if

end event

