function planck_fn,xtype$,var,T
  
  h = 6.626d-34
  kB = 1.38065d-23
  c = 2.99792d8
  a=8*!pi*h
  b=h/kB
  
  case xtype$ of
  
  'Frequency': u=(a*var^3)*(EXP((b*var)/T)-1)^(-1)
  'Wavelength': u=(a*c*(var^(-5))*(EXP((b*c)/(var*T))-1)^(-1)
  'Wavenumber': u=(a*c*var^3)*(EXP((b*c*var)/T)-1)^(-1)
  
  endcase
  
  return,u
  
end

  