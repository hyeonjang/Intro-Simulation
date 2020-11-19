OK
[13] (load "mbase/pl.m")

Model of type atomic-models with name PL made.
Processor of type simulators with name S:PL made.
OK
[14] (send pl inject 'in '(g1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))
state s = 
                                                                               state s = (9 BUSY (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) 9)state s = ()()
[15] (send pl inject 'in '(g2 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))
state s = 
                                                                                                                  state s = (9 BUSY (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) 9)state s = ()()
[16] (send pl output?)
output y =      output y = OUT (G1 (1 3 3 5 5 7 7 9 9 
11 11 13 13 15 15))#(((|#!STRUCTURE| . CONTENT)) OUT (G1 (1 3 3 5 5 7 7 9 9 11 11 13 13 15 15)))
[17] (send pl int-transition)
state s = 
                                                                                                                  state s = (INF PASSIVE (G1 (1 3 3 5 5 7 7 9 9 11 11 13 13 15 15)) 9)state s = ()()
[18] (transcript-off)
