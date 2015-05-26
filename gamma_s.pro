; ------------------------------------------------------------------------
; Function to determine the Saturated Adabatic Lapse Rate
;
; Equations adapted from J. Snider's 2014 Microphysics notes.
; T is in K. P is in P.
;
; Author: Jason A. Sulskis
; Project: COPE-MED
; Manager: Jeff French & David Leon
; Date: 02/12/2014
;
; Requires: phycon.pro, lv.pro, and ws.pro
; -----------------------------------------------------------------------
;
function gamma_s,T,P

phycon ; Load system variables
gamma_d = 0.0098 ; Dry adiabatic lapse rate = 9.8 K/km = 0.0098 K/m

L=Lv(T)
w=ws(T,P)

x1=L*w
x2=!Rd*T
x=x1/x2
y1=!epsilon*L^2.*w
y2=!cpd*!Rd*T^2.
y=y1/y2

; Return value of gamma_s
return, gamma_d*((1.+x)/(1.+y))

end

