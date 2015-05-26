; ------------------------------------------------------------------------
; Function to calculate the saturation vapor pressure. T is in K.
;
; Author: Jason A. Sulskis
; Project: ATSC5006 Lab#2
; Instructor: Jefferson Snider
; Date: 01/21/2014
;
; Requires: phycon.pro
; -----------------------------------------------------------------------
;
function es,T

; Call useful TD variables
phycon

; Return saturation vapor pressure
return,!eso*exp(((!Lvo+(!Cl-!Cpv)*!Tko)/!Rv)*((1./!Tko)-(1./T))-((!Cl-!Cpv)/!Rv)*alog(T/!Tko))

end