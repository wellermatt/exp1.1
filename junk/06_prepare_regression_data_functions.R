

f_ts.lagpad <- function(x, k) { c(rep(NA, k), x)[1 : length(x)]  }

f_ts.seas.harmonics = function(season.type = "WEEKLY", window.length = 313){
	if (season.type == "WEEKLY")	seas.freq = (365.25/7)
	if (season.type == "445")		seas.freq = 12
	t = 1:window.length
	SIN = COS = matrix(nr = window.length, nc = seas.freq/2)
	for (i in 1:(seas.freq/2))
	{
	COS[,i] = cos(2 * pi * i * t/seas.freq)
	SIN[,i] = sin(2 * pi * i * t/seas.freq)
	}
	colnames(SIN) = paste("SIN_",1:(seas.freq/2),sep="")
	colnames(COS) = paste("COS_",1:(seas.freq/2),sep="")
	cbind(COS,SIN)
} 

f_data.transform.add.variables.weekly = function(dat.iri, calendar.weekly){
  
  ## PREPARE THE CALENDAR FILE DUMMIES AND TRANSFORMS AND JOIN TO DATASET
  #dummies = f_calendar.holidays.by.year(calendar, shoulder.span = 1) 
  #calendar = f_calendar.lag.lead(calendar)  
	print(dat.iri$fc.item[1])
	cal.slim = calendar.weekly[,c(1:2,7:length(calendar.weekly)),with=FALSE][1:313,!"Hols_name",with=FALSE]
	dat.in = merge(dat.iri,cal.slim,by="WEEK")
	dat.in = cbind(dat.in,f_ts.seas.harmonics(season.type="WEEKLY",window.length=313))      # add the 26 sin and cos variables  

	# DEPENDENT VARIABLE DIFFERENCING AND LAGGING
	dat.in$UNITS_LAG1 = f_ts.lagpad(dat.in$UNITS,1)
	dat.in$UNITS_LAG2 = f_ts.lagpad(dat.in$UNITS,2)
	dat.in$UNITS_LAG3 = f_ts.lagpad(dat.in$UNITS,3)
	dat.in$UNITS_LAG4 = f_ts.lagpad(dat.in$UNITS,4)
	dat.in$UNITS_LAG5 = f_ts.lagpad(dat.in$UNITS,5)

	dat.in$UNITS_DIFF = c(NA, diff(dat.in$UNITS))
	dat.in$UNITS_DIFF_LAG1 = f_ts.lagpad(dat.in$UNITS_DIFF,1)
	dat.in$UNITS_DIFF_LAG2 = f_ts.lagpad(dat.in$UNITS_DIFF,2)

	dat.in$UNITS_LOG = log(dat.in$UNITS)

	# PRICE variables including differences and lags
	dat.in$PRICE_LOG = log(dat.in$PRICE)
	dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,1)
	dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,2)
	dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,3)

	dat.in$PRICE_LAG1 = f_ts.lagpad(dat.in$PRICE,1)
	dat.in$PRICE_LAG2 = f_ts.lagpad(dat.in$PRICE,2)
	dat.in$PRICE_LAG3 = f_ts.lagpad(dat.in$PRICE,3)

	dat.in$PRICE_DIFF = c(NA, diff(dat.in$PRICE))
	dat.in$PRICE_DIFF_LAG1 = f_ts.lagpad(dat.in$PRICE_DIFF,1)
	dat.in$PRICE_DIFF_LAG2 = f_ts.lagpad(dat.in$PRICE_DIFF,2)
	dat.in$PRICE_DIFF_LAG3 = f_ts.lagpad(dat.in$PRICE_DIFF,3)
	dat.in$PRICE_DIFF_LAG4 = f_ts.lagpad(dat.in$PRICE_DIFF,4)

	# PROMO LAGS
	dat.in$FEAT_ANY_LAG1 = f_ts.lagpad(dat.in$FEAT_ANY,1)

	# INTERACTION TERMS
	dat.in$PRICE_DIFF_FEAT_ANY = dat.in$PRICE_DIFF * dat.in$FEAT_ANY
	dat.in$PRICE_DIFF_Hols_any_binary = dat.in$PRICE_DIFF * dat.in$Hols_any_binary
	dat.in$FEAT_ANY_Hols_any_binary = dat.in$FEAT_ANY * dat.in$Hols_any_binary
	dat.in$PRICE_DIFF_FEAT_ANY_Hols_any_binary = dat.in$PRICE_DIFF * dat.in$FEAT_ANY * dat.in$Hols_any_binary

	# TREND TERMS BASED ON A FUNCTION (estimate of the cut points)
	#dat.in$TREND_1 = c(rep(0,50),1:(225-50), rep(0,313-225)) #* dat.in$WEEK
	#dat.in$TREND_2 = c(rep(0,225), 1:(313-225)) #* dat.in$WEEK

	dat.in
}

f_data.transform.add.variables.445 = function(dat.iri, calendar.445){
  
  ## PREPARE THE CALENDAR FILE DUMMIES AND TRANSFORMS AND JOIN TO DATASET
  #dummies = f_calendar.holidays.by.year(calendar, shoulder.span = 1) 
  #calendar = f_calendar.lag.lead(calendar)  
  dat.in = merge(dat.iri,calendar.445,by="period_id")
  dat.in = cbind(dat.in,f_ts.seas.harmonics(season.type="445", window.length = 72))      # add the 26 sin and cos variables  
  
  # DEPENDENT VARIABLE DIFFERENCING AND LAGGING
  dat.in$UNITS_LAG1 = f_ts.lagpad(dat.in$UNITS,1)
  dat.in$UNITS_LAG2 = f_ts.lagpad(dat.in$UNITS,2)
  dat.in$UNITS_LAG3 = f_ts.lagpad(dat.in$UNITS,3)
  dat.in$UNITS_LAG4 = f_ts.lagpad(dat.in$UNITS,4)
  dat.in$UNITS_LAG5 = f_ts.lagpad(dat.in$UNITS,5)
  
  dat.in$UNITS_DIFF = c(NA, diff(dat.in$UNITS))
  dat.in$UNITS_DIFF_LAG1 = f_ts.lagpad(dat.in$UNITS_DIFF,1)
  dat.in$UNITS_DIFF_LAG2 = f_ts.lagpad(dat.in$UNITS_DIFF,2)
  
  dat.in$UNITS_LOG = log(dat.in$UNITS)
  
  # PRICE variables including differences and lags
  dat.in$PRICE_LOG = log(dat.in$PRICE)
  dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,1)
  dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,2)
  dat.in$PRICE_LOG_LAG1 = f_ts.lagpad(dat.in$PRICE_LOG,3)
  
  dat.in$PRICE_LAG1 = f_ts.lagpad(dat.in$PRICE,1)
  dat.in$PRICE_LAG2 = f_ts.lagpad(dat.in$PRICE,2)
  dat.in$PRICE_LAG3 = f_ts.lagpad(dat.in$PRICE,3)
  
  dat.in$PRICE_DIFF = c(NA, diff(dat.in$PRICE))
  dat.in$PRICE_DIFF_LAG1 = f_ts.lagpad(dat.in$PRICE_DIFF,1)
  dat.in$PRICE_DIFF_LAG2 = f_ts.lagpad(dat.in$PRICE_DIFF,2)
  dat.in$PRICE_DIFF_LAG3 = f_ts.lagpad(dat.in$PRICE_DIFF,3)
  dat.in$PRICE_DIFF_LAG4 = f_ts.lagpad(dat.in$PRICE_DIFF,4)
  
  # PROMO LAGS
  dat.in$FEAT_ANY_LAG1 = f_ts.lagpad(dat.in$FEAT_ANY,1)
  
  
  # INTERACTION TERMS
  #dat.in$PRICE_DIFF_FEAT_ANY = dat.in$PRICE_DIFF * dat.in$FEAT_ANY
  #dat.in$PRICE_DIFF_Hols_any_binary = dat.in$PRICE_DIFF * dat.in$Hols_any_binary
  #dat.in$FEAT_ANY_Hols_any_binary = dat.in$FEAT_ANY * dat.in$Hols_any_binary
  #dat.in$PRICE_DIFF_FEAT_ANY_Hols_any_binary = dat.in$PRICE_DIFF * dat.in$FEAT_ANY * dat.in$Hols_any_binary
  
  # TREND TERMS BASED ON A FUNCTION (estimate of the cut points)
  #dat.in$TREND_1 = c(rep(0,50),1:(225-50), rep(0,313-225)) #* dat.in$WEEK
  #dat.in$TREND_2 = c(rep(0,225), 1:(313-225)) #* dat.in$WEEK
  
  dat.in
}

