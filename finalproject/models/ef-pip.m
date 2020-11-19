
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Model/Frame pair ef-pip.m  ;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;-------------------------------------------------------------
   ; This file uses a digraph model to couple the simple processor
   ; with the experimental frame.
   ;-------------------------------------------------------------

   ;; load the components

   (load-from  model-base_directory pip-arch.m)

   (load-from  model-base_directory ef4pip.m)

   ;; couple the experimental frame with the processor by p-ef

   (make-pair digraph-models 'ef-pip)

   ;; the composition tree

   (send ef-pip build-composition-tree ef-pip (list pip-arch ef))

   ;; the influence digraph
   (send ef-pip set-inf-dig (list (list pip-arch ef)
                                (list ef pip-arch)
   )                         )

   ;; internal coupling
   (send ef-pip set-int-coup pip-arch ef (list (cons 'out 'in)))
   (send ef-pip set-int-coup ef pip-arch (list (cons 'out 'in)))

   (send ef-pip set-ext-out-coup ef  (list (cons 'result 'out)))


   ;; define the select function to avoid  collision when the job
   ;; arrives at the time the processor finishes: processor first
   ;; then generator

   (define (sel-pip slst)
      (cond ((member pip-arch slst) pip-arch)
            ((member ef slst) ef)
   )  )

   (send ef-pip set-selectfn sel-pip)

   ;; equivalently

   (send ef-pip set-priority (list pip-arch ef))

   ;; is shorter and preferable when using flat-devs and deep-devs
                                         
   ;; the final touch, attach a root co-ordinator

 (mk-ent root-co-ordinators r)

   ;; initialize it with the co-ordinator for ef-p

  (initialize r c:ef-pip)   

   ;; start a sipipation run

  (restart r)


