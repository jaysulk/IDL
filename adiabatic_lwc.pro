; ------------------------------------------------------------------------
; Function to determine the adiabatic LWC in g/m^3 at altitude z in m
;
; Equations adapted from J. Snider's 2014 Microphysics notes.
; T & T_d is in C. P is in mb. z is in m.
;
; Author: Jason A. Sulskis
; Project: COPE-MED
; Manager: Jeff French & David Leon
; Date: 02/12/2014
;
; Requires: phycon.pro, findlcl.pro, find_zlcl.pro, ws.pro, es.pro, 
; and gamma_s.pro
; -----------------------------------------------------------------------
;
function adiabatic_lwc, T, T_d, P, z

phycon

; Find T and P of LCL in C and mb
cloudbase = find_lcl(T,T_d,P)
T_LCL = cloudbase[1]
P_LCL = cloudbase[0] 

; Determine altitude of LCL in m
z_LCL = find_zlcl(P,P_LCL,T_LCL)

; Convert LCL T and P to K and Pa
Tk = T_LCL+!Tko
Pa = P_LCL*100. 

; Calculate saturated adiabatic lapse rate
gamma_s=gamma_s(Tk,Pa)

; Height
height=z-z_LCL

; Calculate T and P at z
Temp=Tk-gamma_s*height
Pres=Pa*exp(-(!g*height)/(!Rd*Temp))

; Difference in mixing ratio at cloud base and z
w=ws(Tk,Pa)-ws(Temp,Pres)

;Dry air pressure 
Pd = Pres - es(Temp)

; Density of dry air 
rho_d=Pd/(!Rd*Temp)

; Specific Humidity
q=w/(1+w)

; Density of air vapor mixture
rho = (rho_d*(1. + q)) / (1. + 1.609*q )  

; Calculate LWC
LWC=rho*q*1000.

; Replace all negative values with 0.000000 since there is no such thing as negative LWC
LWC[where(LWC LT 0.,/NULL)]=0.

; Return Adiabatic LWC
return,LWC


end