\name{heatex-package}
\alias{heatex-package}
\docType{package}
\title{Heat exhange package, heatex}
\description{The heatex package includes functions to calculate heat exchange between the body and the environment during physical activity. The program is suitable for walking, running or cycling, and for air velocities to 4 m.s-1.}
\details{
\tabular{ll}{
Package: \tab heatex\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-01-28\cr
License: \tab GPL (version 2 or later)\cr
}
Overview: The heatex package calculates heat storage in the body and the components of heat exchange (conductive, convective, radiative, and evaporative) between the body and the environment during physical activity based on the principles of partitional calorimetry. The program enables heat exchange calculations for a range of environmental conditions when wearing various clothing ensembles. An example dataset is provided with the heatex package to inform users about the required inputs. Users should check that the variable 'ArAD' has the correct ratio of the body area exposed to radiation versus the total body surface area. The ArAD ratio included in the released version of the package is 0.70 for a seated posture, the relevant ratio for a standing posture is 0.73. The function 'heatex' performs the heat exchange calculations and sends output data to a dataframe named 'results'. 

Following is the list of data variables that are needed to run the heatex function in the required order of the arguments:
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
21.tcl = Temperature of the outer body surface, including clothing temperature if relevant, in degrees celsius.


Following is a description of the formulae and outputs for the calculations.

1. Environmental Variables

1.1 Calculation of mean radiant temperature, Tr
(from Goldman, 1978)
Tr (oC) = ((1+(0.222 x (va0.5))) x (Tg - Tdb)) + Tdb
where va = air velocity (m.s-1), Tg = black globe temperature (oC) and Tdb = dry bulb temperature (oC).

1.2 Calculation of convective heat transfer coefficient, hc
(from Kerslake, 1972)
hc (W.m-2.K-1) = 8.3 x (va0.6)
where va = air velocity (m.s-1).

1.3 Calculation of radiative heat transfer coefficient, hr
(from Parsons, 1993)
hr (W.m-2.K-1) = 4.E.sigma.ArAd.((273.2 + ((Tcl + Tr)/2))3)
where E = emissivity of the skin surface (0.98: Gonzalez, 1995, p.299), sigma = Stefan-Boltzmann constant (5.67 x 10-8 W.m-2.K-4), ArAd = ratio of the area of the body exposed to radiation versus the total body surface area (0.70 for seated postures, 0.73 for standing postures), Tcl = mean surface temperature of the body (oC), and Tr = mean radiant temperature (oC).

1.4 Calculation of combined heat transfer coefficient, h
(from Parsons, 1993)
h (W.m-2.K-1) = hc + hr
where hc is the convective heat transfer coefficient (W.m-2.K-1) and hr is the convective heat transfer coefficient (W.m-2.K-1).

1.5 Calculation of evaporative heat transfer coefficient, he
(from Kerslake, 1972)
he (W.m-2.kPa-1) = 16.5 x hc
where hc is the convective heat transfer coefficient (W.m-2.K-1).

2. Clothing Variables

2.1 Calculation of the clothing area factor, fcl
(adapted from Parsons, 1993)
fcl = 1 + (0.31 x (Icl/0.155))
where Icl = intrinsic clothing insulation (m2.oC.W-1).

2.2 Calculation of effective clothing insulation, Icle
(from McIntyre, 1980)
Icle (clo units) = Icl - ((fcl-1)/(0.155 x fcl x h))
where Icl = intrinsic clothing insulation (m2.oC.W-1), fcl = clothing area factor (ND), h = combined heat transfer coefficient (W.m-2.K-1).

2.3 Calculation of the permeation efficiency factor of clothing, fpcl
(adapted from Parsons, 1993)
fpcl = 1/(1+(0.344 x hc x Icle))
where hc is the convective heat transfer coefficient (W.m-2.K-1) and Icle is the effective clothing insulation (clo units).

2.4 Calculation of the intrinsic thermal resistance of clothing, Rc
(from Holmer, 1985)
Rc (m2.K.W-1) = (Tsk - Tdb)/hc
where Tsk = mean skin temperature (K), Tdb = dry bulb temperature (K) and hc is the convective heat transfer coefficient (W.m-2.K-1).

2.5 Calculation of the intrinsic evaporative resistance of clothing, Re
(from Holmer, 1985)
Re (m2.kPa.W-1) = (Ps- Pa)/he
where Ps = saturated water vapor pressure at the skin surface (kPa), Pa is the partial water vapor pressure (kPa) and he is the evaporative heat transfer coefficient (W.m-2.KPa-1).

3. Physiological Variables

3.1 Calculation of body surface area, AD
AD (m2) = 0.00718 x wt0.425 x H0.725
where wt = body mass (kg) and H = height (cm).

3.2 Calculation of mean body temperature, Tb
(from Kerslake, 1972)
Tb (oC) = (0.33 x Tsk + 0.67 x Tc)
where Tsk = skin temperature (oC) and Tc = body core temperature (oC).

3.3 Calculation of saturated water vapor pressure at the skin surface, Ps
(from Fanger, 1970)
Ps (mmHg) = 1.92 x Tsk -25.3 (for 27oC < Tsk < 37 oC).
where Tsk = skin temperature (oC).

4. Partitional Calorimetry Equations

4.1 Calculation of the energy equivalent of oxygen, EE
(modified from Parsons, 1993)
EE (J.L O2-1) = (0.23 x RER + 0.77) x 21 166
where RER = respiratory exchange ratio (ND), 21 166 is the energy equivalent of oxygen (J.LO2-1).

4.2 Calculation of metabolic free energy production, M
(modified from Parsons,1993)
M (W.m-2) = (((EE x VO2 x t)/(t x 60))/AD)
where EE = energy equivalent (J.L O2-1), VO2 = oxygen consumption (L.min-1), t = exercise time (min) and AD = body surface area (m2).

4.3 Calculation of mechanical efficiency, n
(from Parsons, 1993)
n = W/M
where W = work rate (W.m-2) and M = metabolic free energy production (W.m-2).

4.4 Calculation of internal heat production, H
(from McIntyre, 1980)
H (W.m-2) = (M x (1- n)) x 1/AD
where M = metabolic free production (W.m-2), n= mechanical efficiency and AD is the body surface area (m2).

4.5 Calculation of body heat storage, S
S (W.m-2) = ((3474 x wt x (Tb final - Tb initial))/t)/AD
where 3474= average specific heat of body tissue (J.kg-1.oC-1), wt= body mass (kg), Tb = mean body temperature (oC), t = exercise time (s) and AD = body surface area (m2).

4.6 Calculation of heat transfer via conduction, K
K (W.m-2) = AD x ((Tsk - Tcl)/Rc)
where AD = body surface area (m2), Tsk = mean skin temperature (K), Tcl = mean fabric temperature (K), and Rc = intrinsic thermal resistance of clothing (m2.K.W-1).

4.7 Calculation of heat transfer via radiation, R
(adapted from McIntyre, 1980)
R (W.m-2) = E.sigma.fcl.feff.(Ts4 - Tr4)
where E = emittance from the outer surface of a clothed body (0.97), sigma = Stefan-Boltzmann constant (5.67 x 10-8 W.m-2.K-4), fcl = clothing area factor (ND), feff = effective radiation areaof a clothed body (0.71), and Ts = surface temperature of the body (oC) and Tr = mean radiant temperature (oC).

4.8 Calculation of heat transfer via convection, C
(from Fanger, 1970)
C (W.m-2) = (AD x fcl x hc x (Ts - Tdb))/ AD
where AD = body surface area (m2), fcl = clothing area factor (ND), hc = convective heat transfer coefficient (W.m-2.K-1), Ts = surface temperature of the body (oC) and Tdb = dry bulb temperature (oC).

4.9 Calculation of required evaporative heat loss, Ereq
(from Gonzalez, 1995)
Ereq (W.m-2) = H - K - R - C -S
where H = internal heat production (W.m-2), K = heat exchange via conduction (W.m-2), R= heat exchange via radiation (W.m-2), C = heat exchange via convection (W.m-2), and S = body heat storage (W.m-2).

4.10 Calculation of the maximal evaporative capacity of the environment, Emax
(from McIntyre, 1980)
Emax (W.m-2) = fpcl x he x (Ps - Pa)
where fpcl = permeation efficiency factor of clothing, he = evaporative heat transfer coefficient (W.m-2.kPa-1), Ps = partial water vapor pressure at the skin surface (kPa), and Pa = partial water vapor pressure of ambient air (kPa).

4.11 Calculation of skin wettedness, w
w = Ereq/ Emax
where Ereq = required evaporative heat loss (W.m-2) and Emax= maximal evaporative capacity of the environment (W.m-2).

4.12 Calculation of evaporative heat transfer via skin diffusion, Ed
(modified from Fanger, 1970)
Ed (W.m-2) = (l.m.(Ps - Pa))
where l = latent heat of evaporation of sweat (2430 J.g-1), m = permeance coefficient of the skin (1.694 x 10-4 g.s-1.m-2.mmHg-1), Ps = partial water vapor pressure at the skin surface (mmHg) and Pa= partial water vapor pressure in ambient air (mmHg)

4.13 Calculation of heat transfer by sweat evaporation from the skin surface, Esw
Esw (W.m-2) = ((((wtinitial - wtfinal)-(fluid/food intake+urine/faeces loss)-((0.019 x VO2 x (44-Pa)) x t)))x 2430)/((t x 60) x AD)
where wt = body mass (g), fluid/food intake and urine/faeces loss are in grams, the expression 0.019 x VO2 x (44-Pa) accounts for respiratory weight loss in g.min-1 (Mitchell et al., 1972), VO2= oxygen uptake in L.min-1, t = observation time (min), and AD = body surface area (m2).

4.14 Calculation of heat transfer via evaporation from the skin surface, Esk
Esk (W.m-2) = Ed + Esw
where Ed = heat transfer by skin diffusion (W.m-2) and Esw = heat transfer from sweat evaporation from the skin surface (W.m-2).

4.15 Calculation of heat transfer via the respiratory tract, Eres+Cres
(from McIntyre, 1980)
Eres+Cres (W.m-2) = (0.0014 x M x (Tex-Tdb))+(0.0017 x M x (58.7-Pa))
where M = metabolic heat production (W.m-2), Tex= expired air temperature (assumed to be 34oC if Tex is not measured directly), Tdb = dry bulb temperature (oC), and Pa= partial water vapor pressure of ambient air (mmHg).

}
\author{Kerry Atkins

Maintainer: Kerry Atkins (atkins.kerry04@gmail.com)
}
\references{Kerry Atkins and Martin Thompson (2000) A Spreadsheet for Partitional Calorimetry. Sportscience 4(3), sportsci.org/jour/0003/ka.html.

Fanger PO (1970) Thermal Comfort. New York: McGraw-HillGoldman RF (1978) Prediction of human heat tolerance. In: Folinsbee LJ, Wagner JA, Borgia JF, Drinkwater BL, Gliner JA, Bedi JF (editors). Environmental Stress: Individual Human Adaptations. New York: Academic Press.

Gonzalez RR (1995) Biophysics of heat exchange and clothing: applications to sports physiology. Medicine Exercise Nutrition and Health 4, 290-305.

Holmer I (1985) Heat exchange and thermal insulation compared in woolen and nylon garments during wear trials. Textile Research Journal 55, 511-518.

Kerslake DM (1972) The Stress of Hot Environments. Cambridge: University Press.

McIntyre DA (1980) Indoor Climate. London: Applied Science.

Mitchell JW, Nadel ER, Stolwijk JAJ (1972) Respiratory weight losses during exercise. Journal of Applied Physiology 32, 474-476.
Parsons KC (1993) Human Thermal Environments. London: Taylor and Francis.
}

\keyword{Heat exchange,heat transfer}


\examples{
# The following example demonstrates the use of the heatex function with the supplied example data:

data(df)
example<-heatex(df)
#view results
example
}

\note{The heatex function uses the following constants. The user should revise these as needed.

The latent heat of evaporation of sweat (variable 'l') is 2430 J.g-1.
The permeance coefficient of the skin (variable 'm.coef') is 1.694 x 10-4 g.s-1.m-2.mmHg-1.
Stefan-Boltzmann constant (variable 'sigma') is 5.67 x 10-8 W.m-2.K-4.
Emittance from the outer surface of a clothed body (variable 'E') is 0.97.
Effective radiation area of a clothed body (variable 'feff') is 0.71.

The following variables should be changed in the function to be specific to the test conditions.

The ratio of the body area exposed to radiation versus the total body surface area (variable 'ArAd') should be 0.70 for a seated posture and 0.73 for a standing posture. ArAD is set to 0.70 in the released heatex package.

If the test subject is clothed, the final skin temperature variable ('tskf') should be changed to the temperature of the clothing ('tcl') in the calculation of the heat transfer via radiation (r). Similarly, the 'tskf' variable in the calculation of the heat transfer via convection should be changed to the 'tcl_K' variable.}

