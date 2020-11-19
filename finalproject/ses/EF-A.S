
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       ;;; ef-a.s ENTITY STRUCTURE FOR SIMPLE ARCHITECTURES ;;;;;;
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;-------------------------------------------------------------
   ;; this file contains the structure construction of the experimental
   ;; frame and all four architectures.
   ;;;-------------------------------------------------------------

   ;; create the root node -- entstr of ef ef-a

   (make-entstr 'ef-a)

   ;; add a level of decomposition

   (add-item e:ef-a asp 'ef-a-dec)

   ;; set cursor to ef-a-dec
   ;; and describe ef-a-dec    

   (set-current-item e:ef-a 'ef-a-dec)

   ;; add its components -- arch and ef

   (add-item e:ef-a ent 'arch)
   (add-item e:ef-a ent 'ef)

   ;-------- coupling -----------------------------------
   (add-couple e:ef-a 'arch 'ef 'out 'in)
   (add-couple e:ef-a 'ef 'arch 'out 'in)
   (add-couple e:ef-a 'ef 'ef-a 'result 'out)
   ;-----------------------------------------------------

   ;; priority based selectfn

   (add-priority e:ef-a '(arch ef))
   
   ;; now describing arch

   (set-current-item e:ef-a 'arch)

   ;; arch can be any of the architecture under test

   (add-item e:ef-a spec 'arch-spec)

   (set-current-item e:ef-a 'arch-spec)
   ;; and those architectures under test are --

   (add-item e:ef-a ent 'psm)
   (add-item e:ef-a ent 'pip)
   (add-item e:ef-a ent 'mul)
   (add-item e:ef-a ent 'd&c)

   ;;; the descriptions of pipeline architecture
   ;;; -- pip

   (set-current-item e:ef-a 'pip)
   (add-item e:ef-a asp 'pip-dec)
   (set-current-item e:ef-a 'pip-dec)
   (add-item e:ef-a ent 'pip-c)
   (add-item e:ef-a ent 'psm1)
   (add-item e:ef-a ent 'psm2)
   (add-item e:ef-a ent 'psm3)

   ;-------- coupling -----------------------------------
   (add-couple e:ef-a 'pip 'pip-c 'in 'in)
   (add-couple e:ef-a 'pip-c 'pip 'out 'out)
   (add-couple e:ef-a 'pip-c 'psm1 'x1 'in)
   (add-couple e:ef-a 'pip-c 'psm2 'x2 'in)
   (add-couple e:ef-a 'pip-c 'psm3 'x3 'in)
   (add-couple e:ef-a 'psm1 'pip-c 'out 'y1)
   (add-couple e:ef-a 'psm2 'pip-c 'out 'y2)
   (add-couple e:ef-a 'psm3 'pip-c 'out 'y3)

   ;; priority based selectfn

   (add-priority e:ef-a '(psm1 psm2 psm3 pip-c))

   ;;; the descriptions of multi-server architecture
   ;;; -- mul

   (set-current-item e:ef-a 'mul)
   (add-item e:ef-a asp 'mul-dec)
   (set-current-item e:ef-a 'mul-dec)
   (add-item e:ef-a ent 'mul-c)
   (add-item e:ef-a ent 'psm1)
   (add-item e:ef-a ent 'psm2)
   (add-item e:ef-a ent 'psm3)
   ;-------- coupling -----------------------------------
   (add-couple e:ef-a 'mul 'mul-c 'in 'in)
   (add-couple e:ef-a 'mul-c 'mul 'out 'out)
   (add-couple e:ef-a 'mul-c 'psm1 'x1 'in)
   (add-couple e:ef-a 'mul-c 'psm2 'x2 'in)
   (add-couple e:ef-a 'mul-c 'psm3 'x3 'in)
   (add-couple e:ef-a 'psm1 'mul-c 'out 'y1)
   (add-couple e:ef-a 'psm2 'mul-c 'out 'y2)
   (add-couple e:ef-a 'psm3 'mul-c 'out 'y3)


   ;; priority based selectfn

   (add-priority e:ef-a '(pl1 pl2 pl3 mul-c))


   ;;; the descriptions of divide and conquer architecture
   ;;; -- d&c ;;can't use dc since (dc) exits

   (set-current-item e:ef-a 'd&c)
   (add-item e:ef-a asp 'd&c-dec)
   (set-current-item e:ef-a 'd&c-dec)
   (add-item e:ef-a ent 'dc-c)
   (add-item e:ef-a ent 'psm1)
   (add-item e:ef-a ent 'psm2)
   (add-item e:ef-a ent 'psm3)
   (add-item e:ef-a ent 'p&div)
   (add-item e:ef-a ent 'p&cmpl)
   ;-------- coupling -----------------------------------
   (add-couple e:ef-a 'd&c 'dc-c 'in 'in)
   (add-couple e:ef-a 'dc-c 'd&c 'out 'out)
   (add-couple e:ef-a 'dc-c 'psm1 'x1 'in)
   (add-couple e:ef-a 'dc-c 'psm2 'x2 'in)
   (add-couple e:ef-a 'dc-c 'psm3 'x3 'in)
   (add-couple e:ef-a 'dc-c 'p&div 'px 'in)
   (add-couple e:ef-a 'dc-c 'p&cmpl 'cx 'in)
   (add-couple e:ef-a 'psm1 'dc-c 'out 'y1)
   (add-couple e:ef-a 'psm2 'dc-c 'out 'y2)
   (add-couple e:ef-a 'psm3 'dc-c 'out 'y3)
   (add-couple e:ef-a 'p&div 'dc-c 'out 'py)
   (add-couple e:ef-a 'p&cmpl 'dc-c 'out 'cy)

   ;; priority based selectfn

   (add-priority e:ef-a '(p&cmpl p3 p2 p1 p&div dc-c))


   ;; describe the experimental frame structure

   (set-current-item e:ef-a 'ef)
   (add-item e:ef-a asp 'ef-dec)

   ;; experimental frame consists of generator and transducer

   (set-current-item e:ef-a 'ef-dec)
   (add-item e:ef-a ent 'transd)
   (add-item e:ef-a ent 'genr)

   ;-------- coupling -----------------------------------

   (add-couple e:ef-a 'ef 'transd 'in 'solved)
   (add-couple e:ef-a 'transd 'ef 'out 'result)
   (add-couple e:ef-a 'transd 'genr 'out 'stop)
   (add-couple e:ef-a 'genr 'ef 'out 'out)
   (add-couple e:ef-a 'genr 'transd 'out 'ariv)
                       
   ;; save the entity structure

   (save-en e:ef-a)

