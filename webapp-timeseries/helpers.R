# Get a random (daily) timeseries of 
# @param n, size of time series
# @param date_origin, origin date of the timeseries wanted as 'yyyy-mm-dd'
# @return a dataframe with two columns (date and value)
getTimeseries <- function (n, dateorigin) {
  origin <- lubridate::ymd(dateorigin)
  dates <- origin + days(0:(n-1))
  values <- rnorm(n, floor(runif(1,0,100)), floor(runif(1,0,200)))
  df <- data.frame(date=dates, value=values)
  return(df)
}