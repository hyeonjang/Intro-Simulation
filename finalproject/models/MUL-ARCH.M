
   ;;;;;;;;;;;;mul-arch.m;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The Multi-Server Architecture ;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



   ;-------------------------------------------------------------
   ; This file contains the construction of the multi-server
   ; architecture  using a digraph-model. The components
   ; are retrieved from prototypes in the model-base.
   ; Components: Three sub-processors are copies of p in file "p.m"
   ;              One co-ordinator : mul-c  defined in "mul-c.m"
   ;-------------------------------------------------------------

   (load-from model-base_directory pl.m)
   (load-from model-base_directory mul-c.m)

   ;; make three copies from original p processor and copy its initial state

   (send pl make-new 'pl1)                                        
   (send pl1 copy-state pl)

   (send pl make-new 'pl2) 
   (send pl2 copy-state pl)

   (send pl make-new 'pl3)
   (send pl3 copy-state pl)
                                                                
   ;;now couple them to the multi-server
  
   (make-pair digraph-models 'mul-arch) 

   ;;composition tree

   (send mul-arch build-composition-tree
                  mul-arch
                  (list mul-c pl1 pl2 pl3))

   ;;influence digraph

   (send mul-arch set-inf-dig (list (list mul-c pl1 pl2 pl3)
                                      (list pl1 mul-c)
                                      (list pl2 mul-c)
                                      (list pl3 mul-c)))

   ;;internal coupling between processors and co-ordinator

   (send mul-arch set-int-coup mul-c pl1 (list (cons 'x1 'in)))
   (send mul-arch set-int-coup pl1 mul-c (list (cons 'out 'y1)))
   (send mul-arch set-int-coup mul-c pl2 (list (cons 'x2 'in)))
   (send mul-arch set-int-coup pl2 mul-c (list (cons 'out 'y2)))
   (send mul-arch set-int-coup mul-c pl3 (list (cons 'x3 'in)))
   (send mul-arch set-int-coup pl3 mul-c (list (cons 'out 'y3)))

   ;; external-input coupling

   (send mul-arch set-ext-inp-coup mul-c (list (cons 'in 'in)))

   ;; external -output coupling                                  

   (send mul-arch set-ext-out-coup mul-c (list (cons 'out 'out)))

   ;; define the select function to avoid  collision when a job
   ;; arrives at the time a processor finishes: processors first
   ;; then co-ordinator

   (define (sel-mul slst)
       (cond ((member pl1 slst) pl1)
             ((member pl2 slst) pl2)
             ((member pl3 slst) pl3)
             ((member mul-c slst) mul-c)
      ))

   (send mul-arch set-selectfn sel-mul)

  ;; equivalently

    (send mul-arch set-priority (list pl1 pl2 pl3 mul-c))

  ;; is shorter and preferable when using flat-devs and deep-devs
