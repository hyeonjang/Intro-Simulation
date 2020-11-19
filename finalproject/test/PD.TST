OK
[28] (load "mbase/pd.m")

Model of type atomic-models with name PD made.
Processor of type simulators with name S:PD made.
OK
[29] (send pd inject 'in '(g1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))
state s = 
                                                                               state s = (3 BUSY (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) 3)state s = ()()
[30] (send pd inject 'in '(g2 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))
state s = 
                                                                                                                  state s = (3 BUSY (G1 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) 3)state s = ()()
[31] (send pd output?)
output y =      output y = OUT (G1 (1 2 3 4 5) (6 7 8 
9 10) (11 12 13 14 15))#(((|#!STRUCTURE| . CONTENT)) OUT (G1 (1 2 3 4 5) (6 7 8 9 10) (11 12 13 14 15)))
[32] (send pd int-transition)
state s = 
                                                                                                                      state s = (INF PASSIVE (G1 (1 2 3 4 5) (6 7 8 9 10) (11 12 13 14 15)) 3)state s = ()()
[33] (transcript-off)
