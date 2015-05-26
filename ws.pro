; ------------------------------------------------------------------------
; Function to calculate the mixing ratio
;
; Author: Jason A. Sulskis
; Project: ATSC5006 Lab#2
; Instructor: Jefferson Snider
; Date: 01/21/2014
; 
; Requires: phycon.pro, es.pro
; -----------------------------------------------------------------------
;
function ws,T,P


; Call useful TD variables
phycon

; Return mixing ratio
return,(!Rd/!Rv)*es(T)/(P-es(T))

end