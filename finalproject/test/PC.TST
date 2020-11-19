OK
[39] (load "mbase/pc.m")

Model of type atomic-models with name PC made.
Processor of type simulators with name S:PC made.
OK
[40] (send pc inject 'in '(g1 (1 2 3 4 5)(6 7 8 9 10)(11 12 13 14 15)))
state s = 
                                                                               state s = (3 BUSY (G1 (1 2 3 4 5) (6 7 8 9 10) (11 12 13 14 15)) 3)state s = ()()
[41] (send pc inject 'in '(g2 (1 2 3 4 5)(6 7 8 9 10)(11 12 13 14 15)))
state s = 
                                                                                                                      state s = (3 BUSY (G1 (1 2 3 4 5) (6 7 8 9 10) (11 12 13 14 15)) 3)state s = ()()
[42] (send pc output?)
output y =       output y = OUT (G1 (1 2 3 4 5 6 7 8 9 
10 11 12 13 14 15))#(((|#!STRUCTURE| . CONTENT)) OUT (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))
[43] (send pc int-transition)
state s = 
                                                                                                                  state s = (INF PASSIVE (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) 3)state s = ()()
[44] (transcript-off)
