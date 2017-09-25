>>> add8 = 6.744
>>> comp8 = 7.621
>>> mux8 = 6.063
>>> mul16 = 9.658
>>> sub16 = 7.648
>>> reg16 = 4.284
>>> d = add8
>>> e = add8
>>> g = comp8 + max(d,e)
>>> z = mux8 + max(g,d,e)
>>> f = mul16
>>> xwire = sub16 + max(f,d)
>>> x = reg16 + xwire
>>> x
21.589999999999996



>>> add32 = 15.376
>>> sub32 = 15.376
>>> comp32 = 14.481
>>> mux32 = 11.581
>>> shl32 = 17.205
>>> shr32 = 18.330
>>> reg32 = 4.973

>>> d = add32
>>> e = add32
>>> f = sub32+d+e
>>> f=sub32
>>> dEQe = comp32 + max(d,e)
>>> dLTe = comp32 + max(d,e)
>>> g = mux32 + max(dLTe,d,e)
>>> h = mux32 + max(dEQe,g,f)
>>> xwire = shl32 + max(g,dLTe)
>>> zwire = shr32 + max(g,dEQe)
>>> x = reg32 + xwire
>>> z = reg32 + zwire
>>> max(x,z)
64.741