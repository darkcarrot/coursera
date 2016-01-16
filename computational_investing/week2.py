import QSTK.qstkutil.qsdateutil as du
import QSTK.qstkutil.DataAccess as da
import datetime as dt
import sys

dt_start = dt.datetime(2012, 2, 10)
dt_end = dt.datetime(2012, 2, 24)
dt_timeofday = dt.timedelta(hours=16)

ldt_timestamps = du.getNYSEdays(dt_start, dt_end, dt_timeofday)
ls_symbols = ['MSFT', 'GOOG']

c_dataobj = da.DataAccess('Yahoo')
df_close = c_dataobj.get_data(ldt_timestamps, ls_symbols, "close")

df_close.to_csv(sys.stdout, sep="\t")
