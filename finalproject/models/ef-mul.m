
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Model/Frame pair ef-mul.m  ;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;-------------------------------------------------------------
   ; This file uses a digraph model to couple the simple processor
   ; with the experimental frame.
   ;-------------------------------------------------------------

   ;; load the components

   (load-from  model-base_directory mul-arch.m)

   (load-from  model-base_directory ef.m)

   ;; couple the experimental frame with the processor by p-ef

   (make-pair digraph-models 'ef-mul)

   ;; the composition tree

   (send ef-mul build-composition-tree ef-mul (list mul-arch ef))

   ;; the influence digraph
   (send ef-mul set-inf-dig (list (list mul-arch ef)
                                (list ef mul-arch)
   )                         )

   ;; internal coupling
   (send ef-mul set-int-coup mul-arch ef (list (cons 'out 'in)))
   (send ef-mul set-int-coup ef mul-arch (list (cons 'out 'in)))

   (send ef-mul set-ext-out-coup ef  (list (cons 'result 'out)))


   ;; define the select function to avoid  collision when the job
   ;; arrives at the time the processor finishes: processor first
   ;; then generator

   (define (sel-mul slst)
      (cond ((member mul-arch slst) mul-arch)
            ((member ef slst) ef)
   )  )

   (send ef-mul set-selectfn sel-mul)

   ;; equivalently

   (send ef-mul set-priority (list mul-arch ef))

   ;; is shorter and preferable when using flat-devs and deep-devs
                                         
   ;; the final touch, attach a root co-ordinator

 (mk-ent root-co-ordinators r)

   ;; initialize it with the co-ordinator for ef-p

  (initialize r c:ef-mul)   

   ;; start a simulation run

  (restart r)


