
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

   (load-from model-base_directory p.m)
   (load-from model-base_directory mul-c.m)

   ;; make three copies from original p processor and copy its initial state

   (send p make-new 'p1)                                        
   (send p1 copy-state p)

   (send p make-new 'p2) 
   (send p2 copy-state p)

   (send p make-new 'p3)
   (send p3 copy-state p)
                                                                
   ;;now couple them to the multi-server
  
   (make-pair digraph-models 'mul-arch) 

   ;;composition tree

   (send mul-arch build-composition-tree
                  mul-arch
                  (list mul-c p1 p2 p3))

   ;;influence digraph

   (send mul-arch set-inf-dig (list (list mul-c p1 p2 p3)
                                      (list p1 mul-c)
                                      (list p2 mul-c)
                                      (list p3 mul-c)))

   ;;internal coupling between processors and co-ordinator

   (send mul-arch set-int-coup mul-c p1 (list (cons 'x1 'in)))
   (send mul-arch set-int-coup p1 mul-c (list (cons 'out 'y1)))
   (send mul-arch set-int-coup mul-c p2 (list (cons 'x2 'in)))
   (send mul-arch set-int-coup p2 mul-c (list (cons 'out 'y2)))
   (send mul-arch set-int-coup mul-c p3 (list (cons 'x3 'in)))
   (send mul-arch set-int-coup p3 mul-c (list (cons 'out 'y3)))

   ;; external-input coupling

   (send mul-arch set-ext-inp-coup mul-c (list (cons 'in 'in)))

   ;; external -output coupling                                  

   (send mul-arch set-ext-out-coup mul-c (list (cons 'out 'out)))

   ;; define the select function to avoid  collision when a job
   ;; arrives at the time a processor finishes: processors first
   ;; then co-ordinator

   (define (sel-mul slst)
       (cond ((member p1 slst) p1)
             ((member p2 slst) p2)
             ((member p3 slst) p3)
             ((member mul-c slst) mul-c)
      ))

   (send mul-arch set-selectfn sel-mul)

  ;; equivalently

    (send mul-arch set-priority (list p1 p2 p3 mul-c))

  ;; is shorter and preferable when using flat-devs and deep-devs
