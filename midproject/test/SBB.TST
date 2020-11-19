[2] (load "mbase/sbb.m")

Model of type atomic-models with name SBB made.
Processor of type simulators with name S:SBB made.
OK
[3] ;;;first inning
(send sbb inject 'pitch 'fiz 5)
state s = 
                                                                                       state s = (5 NONE FIZ 0 0 0 0 5)state s = ()()
[4] (send sbb int-transition)
state s = 
                                                                                   state s = (5 NONE FIZ 0 1 0 0 5)state s = ()()
[5] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FIZ 0 0 0 0 5)state s = ()()
[6] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND-3RD FIZ 0 0 0 0 5)state s = ()()
[7] (send sbb int-transition)
state s = 
                                                                                      state s = (5 3RD FIZ 0 0 0 1 5)state s = ()()
[8] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FIZ 0 1 0 1 5)state s = ()()
[9] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FIZ 0 0 0 2 5)state s = ()()
[10] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FIZ 0 1 0 2 5)state s = ()()
[11] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST-2ND FIZ 0 0 0 2 5)state s = ()()
[12] (send sbb int-transition)
state s = 
                                                                                      state s = (5 1ST-2ND FIZ 0 1 0 2 5)state s = ()()
[13] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FIZ 0 0 0 2 5)state s = ()()
[14] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FIZ 0 1 0 2 5)state s = ()()
[15] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FIZ 0 2 0 2 5)state s = ()()
[16] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FIZ 0 0 1 2 5)state s = ()()
[17] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FIZ 0 1 1 2 5)state s = ()()
[18] (send sbb int-transition)
state s = 
                                                                                      state s = (5 3RD FIZ 0 0 1 3 5)state s = ()()
[19] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 0 1 5 5)state s = ()()
[20] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 1 1 5 5)state s = ()()
[21] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 2 1 5 5)state s = ()()
[22] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 0 2 5 5)state s = ()()
[23] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 1 2 5 5)state s = ()()
[24] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FIZ 0 0 2 5 5)state s = ()()
[25] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FIZ 0 1 2 5 5)state s = ()()
[26] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 0 2 7 5)state s = ()()
[27] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 1 2 7 5)state s = ()()
[28] (send sbb int-transition)
state s = 
                                                                                  state s = (5 2ND FIZ 0 2 2 7 5)state s = ()()
[29] (send sbb int-transition)
state s = 
                                                                                  state s = (INF PASSIVE FIZ 0 0 3 7 5)state s = ()()
[30] (send sbb output?)
output y =      output y = OUT 7#(((|#!STRUCTURE| . CONTENT)) OUT 7)
[31] ;;; second inning
(send sbb inject 'pitch 'foz 5)
state s = 
                                                                                        state s = (5 NONE FOZ 0 0 0 7 5)state s = ()()
[32] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 0 0 0 7 5)state s = ()()
[33] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FOZ 0 0 0 7 5)state s = ()()
[34] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FOZ 0 1 0 7 5)state s = ()()
[35] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FOZ 1 1 0 7 5)state s = ()()
[36] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FOZ 0 0 0 8 5)state s = ()()
[37] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FOZ 0 1 0 8 5)state s = ()()
[38] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FOZ 1 1 0 8 5)state s = ()()
[39] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FOZ 1 2 0 8 5)state s = ()()
[40] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST-2ND FOZ 0 0 0 8 5)state s = ()()
[41] (send sbb int-transition)
state s = 
                                                                                      state s = (5 1ST-2ND FOZ 0 1 0 8 5)state s = ()()
[42] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FOZ 0 0 0 8 5)state s = ()()
[43] (send sbb int-transition)
state s = 
                                                                                      state s = (5 2ND-3RD FOZ 1 0 0 8 5)state s = ()()
[44] (send sbb int-transition)
state s = 
                                                                                      state s = (5 3RD FOZ 0 0 0 9 5)state s = ()()
[45] (send sbb int-transition)
state s = 
                                                                                  state s = (5 3RD FOZ 1 0 0 9 5)state s = ()()
[46] (send sbb int-transition)
state s = 
                                                                                  state s = (5 1ST FOZ 0 0 0 10 5)state s = ()()
[47] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST-2ND FOZ 0 0 0 10 5)state s = ()()
[48] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND FOZ 0 1 0 10 5)state s = ()()
[49] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND FOZ 1 1 0 10 5)state s = ()()
[50] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND FOZ 2 1 0 10 5)state s = ()()
[51] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND FOZ 3 1 0 10 5)state s = ()()
[52] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 0 0 0 10 5)state s = ()()
[53] (send sbb int-transition)
state s = 
                                                                                       state s = (5 3RD FOZ 0 0 0 11 5)state s = ()()
[54] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 1 0 0 11 5)state s = ()()
[55] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 2 0 0 11 5)state s = ()()
[56] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 0 0 0 13 5)state s = ()()
[57] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 1 0 0 13 5)state s = ()()
[58] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 1 1 0 13 5)state s = ()()
[59] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 1 2 0 13 5)state s = ()()
[60] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 0 0 1 13 5)state s = ()()
[61] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 1 0 1 13 5)state s = ()()
[62] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND FOZ 2 0 1 13 5)state s = ()()
[63] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 0 1 13 5)state s = ()()
[64] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 0 0 1 14 5)state s = ()()
[65] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 1 0 1 14 5)state s = ()()
[66] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 2 0 1 14 5)state s = ()()
[67] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 2 1 1 14 5)state s = ()()
[68] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 3 1 1 14 5)state s = ()()
[69] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST-2ND FOZ 0 0 1 14 5)state s = ()()
[70] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 0 0 1 15 5)state s = ()()
[71] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 1 0 1 15 5)state s = ()()
[72] (send sbb int-transition)
state s = 
                                                                                       state s = (5 3RD FOZ 0 0 1 16 5)state s = ()()
[73] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 1 1 16 5)state s = ()()
[74] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 1 1 1 16 5)state s = ()()
[75] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 2 1 1 16 5)state s = ()()
[76] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 2 2 1 16 5)state s = ()()
[77] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 0 2 16 5)state s = ()()
[78] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 1 2 16 5)state s = ()()
[79] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 1 1 2 16 5)state s = ()()
[80] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 0 0 2 17 5)state s = ()()
[81] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 1 0 2 17 5)state s = ()()
[82] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 2 0 2 17 5)state s = ()()
[83] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST FOZ 3 0 2 17 5)state s = ()()
[84] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST-2ND FOZ 0 0 2 17 5)state s = ()()
[85] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 0 0 2 17 5)state s = ()()
[86] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 1 0 2 17 5)state s = ()()
[87] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 2 0 2 17 5)state s = ()()
[88] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 3 0 2 17 5)state s = ()()
[89] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-3RD FOZ 0 0 2 18 5)state s = ()()
[90] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-3RD FOZ 1 0 2 18 5)state s = ()()
[91] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-3RD FOZ 2 0 2 18 5)state s = ()()
[92] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-3RD FOZ 3 0 2 18 5)state s = ()()
[93] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND FOZ 0 0 2 19 5)state s = ()()
[94] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 0 0 2 19 5)state s = ()()
[95] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 1 0 2 19 5)state s = ()()
[96] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD FOZ 2 0 2 19 5)state s = ()()
[97] (send sbb int-transition)
state s = 
                                                                                       state s = (5 3RD FOZ 0 0 2 20 5)state s = ()()
[98] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 1 2 20 5)state s = ()()
[99] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 0 2 2 20 5)state s = ()()
[100] (send sbb int-transition)
state s = 
                                                                                   state s = (5 3RD FOZ 1 2 2 20 5)state s = ()()
[101] (send sbb int-transition)
state s = 
                                                                                   state s = (INF PASSIVE FOZ 0 0 3 20 5)state s = ()()
[102] (send sbb output?)
output y =      output y = OUT 20#(((|#!STRUCTURE| . CONTENT)) OUT 20)
[103] ;;; third inning
(send sbb inject 'pitch 'siz 5)
state s = 
                                                                                         state s = (5 NONE SIZ 0 0 0 20 5)state s = ()()
[104] (send sbb int-transition)
state s = 
                                                                                    state s = (5 NONE SIZ 0 1 0 20 5)state s = ()()
[105] (send sbb int-transition)
state s = 
                                                                                    state s = (5 NONE SIZ 0 2 0 20 5)state s = ()()
[106] (send sbb int-transition)
state s = 
                                                                                    state s = (5 1ST SIZ 0 0 0 20 5)state s = ()()
[107] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST SIZ 0 1 0 20 5)state s = ()()
[108] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST SIZ 0 2 0 20 5)state s = ()()
[109] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST SIZ 1 2 0 20 5)state s = ()()
[110] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST SIZ 2 2 0 20 5)state s = ()()
[111] (send sbb int-transition)
state s = 
                                                                                   state s = (5 1ST-2ND SIZ 0 0 0 20 5)state s = ()()
[112] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 0 1 0 20 5)state s = ()()
[113] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 0 2 0 20 5)state s = ()()
[114] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 0 0 1 20 5)state s = ()()
[115] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 0 1 1 20 5)state s = ()()
[116] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 1 1 1 20 5)state s = ()()
[117] (send sbb int-transition)
state s = 
                                                                                       state s = (5 1ST-2ND SIZ 1 2 1 20 5)state s = ()()
[118] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND-3RD SIZ 0 0 1 21 5)state s = ()()
[119] (send sbb int-transition)
state s = 
                                                                                       state s = (5 2ND SIZ 0 0 1 23 5)state s = ()()
[120] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 1 1 23 5)state s = ()()
[121] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 0 1 25 5)state s = ()()
[122] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 1 1 25 5)state s = ()()
[123] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 1 1 1 25 5)state s = ()()
[124] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 1 2 1 25 5)state s = ()()
[125] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 0 2 25 5)state s = ()()
[126] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 1 2 25 5)state s = ()()
[127] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 0 2 27 5)state s = ()()
[128] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 1 2 27 5)state s = ()()
[129] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 2 2 27 5)state s = ()()
[130] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 0 2 29 5)state s = ()()
[131] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 1 2 29 5)state s = ()()
[132] (send sbb int-transition)
state s = 
                                                                                   state s = (5 2ND SIZ 0 2 2 29 5)state s = ()()
[133] (send sbb int-transition)
state s = 
                                                                                   state s = (INF PASSIVE SIZ 0 0 3 29 5)state s = ()()
[134] (send sbb output?)
output y =       output y = OUT 29#(((|#!STRUCTURE| . CONTENT)) OUT 29)
[135] (transcript-off)
