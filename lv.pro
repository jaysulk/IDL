;
function Lv,T
;
; ------------------------------------------------------------------------
; Function to calculate the latent heat of vaporization
;
; Author: Jason A. Sulskis
; Project: ATSC5006 Lab#2
; Date: 01/21/2014
; Requires: phycon.pro
; -----------------------------------------------------------------------

; Call useful TD variables
phycon

; Define Latent Heat of Vaporization
result = !Lvo - (!Cl - !Cpv)*(T-!Tko)

return, result

end