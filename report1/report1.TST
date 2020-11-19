OK
[2] (load "report1.s")
OK
[3] stack
()
[4] (push 'a)
(A)
[5] (push 'b)
(B A)
[6] (pop)
B
[7] stack
(A)
[8] queue
()
[9] (insert 'x)
(X)
[10] (insert 'y)
(X Y)
[11] (extract)
X
[12] queue
(Y)
[13] (sequential-search-1 3 '(1 2 3 2 4 1 2 7))
3
[14] (sequential-search-1 2 '(1 12 3 1 44 5 1))
()
[15] (sequential-search-2 3 '(1 2 3 2 4 1 2 7))
3
[16] (sequential-search-2 2 '(1 12 3 1 44 5 1))
()
[17] (custom-min-1 '(2 7 -1 4 5))
-1
[18] (custom-min-2 '(2 7 0 9 -5 1 3))
-5
[19] (last-ele '(a b c))
B
[20] (last-ele '(a b (c d) f))
(C D)
[21] (last-ele '(a b () c))
()
[22] obj-lst
()
[23] (insert-obj 1 'a obj-lst)
(#(((|#!STRUCTURE| . RECORD)) 1 A))
[24] (insert-obj 2 'a obj-lst)
(#(((|#!STRUCTURE| . RECORD)) 1 A) #(((|#!STRUCTURE| . RECORD)) 2 A))
[25] (insert-obj 3 'b obj-lst)
(#(((|#!STRUCTURE| . RECORD)) 1 A) #(((|#!STRUCTURE| . RECORD)) 2 A) #(((
|#!STRUCTURE| . RECORD)) 3 B))
[26] (insert-obj 4 'c obj-lst)
(#(((|#!STRUCTURE| . RECORD)) 1 A) #(((|#!STRUCTURE| . RECORD)) 2 A) #(((
|#!STRUCTURE| . RECORD)) 3 B) #(((|#!STRUCTURE| . RECORD)) 4 C))
[27] (insert-obj 1 'a obj-lst)
You cannot insert. There is already same id
()
[28] (print-obj obj-lst)
1 A; 2 A; 3 B; 4 C;  
[29] (delete-obj 3 obj-lst)
(#(((|#!STRUCTURE| . RECORD)) 1 A) #(((|#!STRUCTURE| . RECORD)) 2 A) #(((
|#!STRUCTURE| . RECORD)) 4 C))
[30] (print-obj obj-lst)
1 A; 2 A; 4 C;  
[31] (transcript-off)
