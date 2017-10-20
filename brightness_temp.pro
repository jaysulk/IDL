function brightness_temp,k,Irr

phycon
BT=((!h*!sl*k)/(!kb))/alog(1+(2*!h*!sl^2.*k^3.)/(Irr))

return,BT
end