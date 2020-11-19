OK
[20] (load "mbase/psm.m")

Model of type atomic-models with name PSM made.
Processor of type simulators with name S:PSM made.
OK
[21] (send psm inject 'in '(g1 (1 2 3 4 5)))
state s = 
                                                                               state s = (2 BUSY (G1 (1 2 3 4 5)) 2)state s = ()()
[22] (send psm inject 'in '(g2 (1 2 3 4 5)))
state s = 
                                                                                        state s = (2 BUSY (G1 (1 2 3 4 5)) 2)state s = ()()
[23] (send psm output?)
output y =      output y = OUT (G1 (1 3 3 5 5))#(((|#!STRUCTURE| . CONTENT)) OUT (G1 (1 3 3 5 5)))
[24] (send psm int-transition)
state s = 
                                                                                        state s = (INF PASSIVE (G1 (1 3 3 5 5)) 2)state s = ()()
[25] (transcipt-off)

[VM ERROR encountered!] Variable not defined in current environment
TRANSCIPT-OFF

[Inspect] Quit
[26] (transcript-off)
