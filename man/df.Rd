\name{df}
\alias{df}
\docType{data}
\title{
Example data for heat exchange (heatex) package
}
\description{
This dataset includes the required input data to perform the heat exchange calculations used in the heatex package.
}
\usage{data(df)}
\format{
  A data frame with 2 observations on the following 21 variables.
  \describe{
    \item{\code{time}}{a numeric vector}
    \item{\code{workrate}}{a numeric vector}
    \item{\code{ht}}{a numeric vector}
    \item{\code{wt}}{a numeric vector}
    \item{\code{bmi}}{a numeric vector}
    \item{\code{bmf}}{a numeric vector}
    \item{\code{fluidfood}}{a numeric vector}
    \item{\code{urinefaeces}}{a numeric vector}
    \item{\code{sweat}}{a numeric vector}
    \item{\code{tci}}{a numeric vector}
    \item{\code{tcf}}{a numeric vector}
    \item{\code{tski}}{a numeric vector}
    \item{\code{tskf}}{a numeric vector}
    \item{\code{vo2}}{a numeric vector}
    \item{\code{rer}}{a numeric vector}
    \item{\code{tdb}}{a numeric vector}
    \item{\code{tg}}{a numeric vector}
    \item{\code{va}}{a numeric vector}
    \item{\code{pa}}{a numeric vector}
    \item{\code{icl}}{a numeric vector}
    \item{\code{tcl}}{a numeric vector}
  }
}
\details{
The dataset contains example physiological, environmental and clothing data required for the heatex function.

There are 21 variables required for the heatex function as follows:
1. time = Total time for physical activity in minutes.
2. workrate = The work rate (power output) of the activity in watts.
3. ht = Subject height in centimetres.
4. wt = Subject body mass in kilograms (to calculate the body surface area, usual body mass).
5. bmi = Subject body mass before commencing physical activity in kilograms.
6. bmf = Subject body mass after physical activity in kilograms.
7. fluidfood = Fluid and food consumption during the physical activity.
8. urinefaeces = Urine and faeces loss during the physical activity.
9. sweat = Dripped sweat in grams.
10.tci = Initial body core temperature in degrees celsius.
11.tcf = Final body core temperature in degrees celsius.
12.tski = Initial skin temperature in degrees celsius.
13.tskf = Final skin temperature in degrees celsius.
14.vo2 = Oxygen consumption in litres per minute.
15.rer = Respiratory exchange ratio.
16.tdb = Dry bulb temperature of the environment in degrees celsius.
17.tg = Black globe temperature in degrees celsius.
18.va = Air velocity in metres per second.
19.pa = Ambient water vapour pressure in mmHg.
20.icl = Intrinsic clothing insulation in m2.oC.W-1.
21.tcl = Temperature of the outer body surface, including clothing temperature if relevant, in degrees celsius.}
\source{
The dataset includes example data based on research data collected by the author of the heatex package.
}
\references{
Kerry Atkins and Martin Thompson (2000) A Spreadsheet for Partitional Calorimetry. Sportscience 4(3), sportsci.org/jour/0003/ka.html.
}
\examples{
# The following example demonstrates the use of the heatex function with the supplied example data:

data(df)
example<-heatex(df)
#view results
example
}
\keyword{heatex data}
