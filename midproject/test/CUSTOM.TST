OK
[60] (load "mbase/custom.m")

Model of type atomic-models with name RIS made.
Processor of type simulators with name S:RIS made.
OK
[61] (send ris inject 'pixel 'r1 5)
state s = 
                                                                                          state s = (5 0 R1 - 6 BLACK 5)state s = ()()
[62] (send ris inject 'pixel 'r2 3)
state s = 
                                                                                  state s = (2 0 R1 (R2) 6 BLACK 5)state s = ()()
[63] (send ris inject 'pixel 'r3 2)
state s = 
                                                                                    state s = (0 0 R1 (R2 R3) 6 BLACK 5)state s = ()()
[64] (send ris int-transition)
state s = 
                                                                                       state s = (5 MISS R1 (R2 R3) 6 BLACK 5)state s = ()()
[65] (send ris output?)
output y =      output y = MISSED-COLOR BLACK#(((|#!STRUCTURE| . CONTENT)) MISSED-COLOR BLACK)
[66] (send ris int-transition)
state s = 
                                                                                          state s = (5 0 R2 (R3) 6 BLACK 5)state s = ()()
[67] (send ris int-transition)
state s = 
                                                                                    state s = (5 MISS R2 (R3) 6 BLACK 5)state s = ()()
[68] (send ris output?)
output y =                   output y = MISSED-COLOR BLACK#(((|#!STRUCTURE| . CONTENT)) MISSED-COLOR BLACK)
[69] (send ris int-transition)
state s = 
                                                                                       state s = (5 0 R3 - 6 BLACK 5)state s = ()()
[70] (send ris int-transition)
state s = 
                                                                                  state s = (5 MISS R3 - 6 BLACK 5)state s = ()()
[71] (send ris output?)
output y =                   output y = MISSED-COLOR BLACK#(((|#!STRUCTURE| . CONTENT)) MISSED-COLOR BLACK)
[72] (send ris int-transition)
state s = 
                                                                                     state s = (INF PASSIVE R3 - 6 BLACK 5)state s = ()()
[73] (send ris inject 'pixel 'r4 5)
state s = 
                                                                                          state s = (5 0 R4 - 6 BLACK 5)state s = ()()
[74] (send ris inject 'pixel 'r5 3)
state s = 
                                                                                  state s = (2 0 R4 (R5) 6 BLACK 5)state s = ()()
[75] (send ris inject 'pixel 'r6 2)
state s = 
                                                                                    state s = (0 0 R4 (R5 R6) 6 BLACK 5)state s = ()()
[76] (send ris int-transition)
state s = 
                                                                                       state s = (5 1 R4 (R5 R6) 6 BLACK 5)state s = ()()
[77] (send ris int-transition)
state s = 
                                                                                       state s = (5 DONE R4 (R5 R6) 6 BLACK 5)state s = ()()
[78] (send ris output?)
output y =                   output y = PIXEL-COLOR R4#(((|#!STRUCTURE| . CONTENT)) PIXEL-COLOR R4)
[79] (send ris int-transition)
state s = 
                                                                                          state s = (5 0 R5 (R6) 6 BLACK 5)state s = ()()
[80] (send ris int-transition)
state s = 
                                                                                    state s = (5 1 R5 (R6) 6 BLACK 5)state s = ()()
[81] (send ris int-transition)
state s = 
                                                                                    state s = (5 DONE R5 (R6) 6 BLACK 5)state s = ()()
[82] (send ris output?)
output y =               output y = PIXEL-COLOR R5#(((|#!STRUCTURE| . CONTENT)) PIXEL-COLOR R5)
[83] (send ris int-transition)
state s = 
                                                                                       state s = (5 0 R6 - 6 BLACK 5)state s = ()()
[84] (send ris int-transition)
state s = 
                                                                                  state s = (5 MISS R6 - 6 BLACK 5)state s = ()()
[85] (send ris output?)
output y =               output y = MISSED-COLOR BLACK#(((|#!STRUCTURE| . CONTENT)) MISSED-COLOR BLACK)
[86] (send ris int-transition)
state s = 
                                                                                     state s = (INF PASSIVE R6 - 6 BLACK 5)state s = ()()
[87] (transcript-off)
