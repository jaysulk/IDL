; ------------------------------------------------------------------------
; Function to determine the LWC lapse rate
;
; Equations adapted from J. Snider's 2014 Microphysics notes.
; T is in K. P is in P.
;
; Author: Jason A. Sulskis
; Project: COPE-MED
; Manager: Jeff French & David Leon
; Date: 02/12/2014
;
; Requires: phycon.pro, lv.pro, gamma_s.pro, and ws.pro
; -----------------------------------------------------------------------
;
function gamma_l, T, P

phycon ; Load system variables
H = 8500. ; Assumed average scale height of 8.5 km

gamma_s=gamma_s(T,P) ; Get saturated adiabatic lapse rate (in K/m)

L=lv(T) ; Get latent heat of vaporization
w=ws(T,P) ; Get mixing ratio

Pd=P-es(T) ; Calculate dry air pressure

; Break expression up into parts to avoid mistakes with ()
x1=(!epsilon+w)*w*L
x2=!Rd*T^2.
x=x1/x2
y1=w*P
y2=Pd*H
y=y1/y2


; Return value of gamma_l
return, (x*gamma_s)-y

end