import QSTK.qstkutil.qsdateutil as du
import QSTK.qstkutil.DataAccess as da
import datetime as dt
import numpy as np
import pandas as pd

PORTFOLIOS = ((2011, 1, 1), (2011, 12, 31), ('AAPL', 'GOOG', 'IBM', 'MSFT')), \
             ((2010, 1, 1), (2010, 12, 31), ('BRCM', 'ADBE', 'AMD', 'ADI')), \
             ((2011, 1, 1), (2011, 12, 31), ('BRCM', 'TXN', 'AMD', 'ADI')), \
             ((2010, 1, 1), (2010, 12, 31), ('BRCM', 'TXN', 'IBM', 'HNZ')), \
             ((2010, 1, 1), (2010, 12, 31), ('C', 'GS', 'IBM', 'HNZ'))


def optimise(symbols, dt_start, dt_end, ):
    alloc_range = np.arange(0., 1.1, .1)
    combinations = [[round(x1, 1), round(x2, 1), round(x3, 1), round(x4, 1)]
                    for x1 in alloc_range
                    for x2 in alloc_range
                    for x3 in alloc_range
                    for x4 in alloc_range
                    if x1 + x2 + x3 + x4 == 1]

    ls_performance = [__simulate(symbols, dt_start, dt_end, com) for com in combinations]
    df = pd.DataFrame(ls_performance, columns=["alloc", "vol", "avg_daily_ret", "sharpe_ratio", "cum_ret"])
    df.sort_values(by="sharpe_ratio", ascending=False, inplace=True)
    df.reset_index(inplace=True)
    best_result = df.ix[0]

    print "Symbols:", symbols
    print "Start/End Date:", dt_start.strftime("%Y-%m-%d"), dt_end.strftime("%Y-%m-%d")
    print "Optimal Allocation:", best_result.alloc
    print "Sharpe Ratio:", best_result.sharpe_ratio
    # print "Volatility:", best_result.vol
    # print "Average Daily Return:", best_result.avg_daily_ret
    # print "Cumulative Return:", best_result.cum_ret


def __simulate(symbols, dt_start, dt_end, alloc):
    price = get_data(symbols, dt_start, dt_end, )
    price_norm = price / price[0]
    daily_vals = price_norm.dot(alloc)
    daily_rets = daily_vals[1:] / daily_vals[:-1] - 1
    daily_rets = np.append([.0], daily_rets)

    k = np.sqrt(252)
    vol = daily_rets.std()
    avg_daily_ret = daily_rets.mean()
    sharp_ratio = k * avg_daily_ret / vol

    return alloc, vol, avg_daily_ret, sharp_ratio, daily_vals[-1]


def get_data(symbols, dt_start, dt_end, ):
    dt_timeofday = dt.timedelta(hours=16)

    ldt_timestamps = du.getNYSEdays(dt_start, dt_end, dt_timeofday)
    c_dataobj = da.DataAccess('Yahoo')
    close_price = c_dataobj.get_data(ldt_timestamps, symbols, "close")
    return close_price.values


def __to_date(date_list):
    year, month, day = date_list
    return dt.datetime(year, month, day)


def main():
    for start_date, end_date, symbols in PORTFOLIOS:
        dt_start = __to_date(start_date)
        dt_end = __to_date(end_date)
        optimise(symbols, dt_start, dt_end)
        print


if __name__ == '__main__':
    main()
