
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Model/Frame pair ef-p.m  ;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;-------------------------------------------------------------
   ; This file uses a digraph model to couple the simple processor
   ; with the experimental frame.
   ;-------------------------------------------------------------

   ;; load the components

   (load-from  model-base_directory pl.m)

   (load-from  model-base_directory ef.m)

   ;; couple the experimental frame with the processor by p-ef

   (make-pair digraph-models 'ef-pl)

   ;; the composition tree

   (send ef-pl build-composition-tree ef-pl (list pl ef))

   ;; the influence digraph
   (send ef-pl set-inf-dig (list (list pl ef)
                                (list ef pl)
   )                         )

   ;; internal coupling
   (send ef-pl set-int-coup pl ef (list (cons 'out 'in)))
   (send ef-pl set-int-coup ef pl (list (cons 'out 'in)))

   (send ef-pl set-ext-out-coup ef  (list (cons 'result 'out)))


   ;; define the select function to avoid  collision when the job
   ;; arrives at the time the processor finishes: processor first
   ;; then generator

   (define (sel-p slst)
      (cond ((member pl slst) pl)
            ((member ef slst) ef)
   )  )

   (send ef-pl set-selectfn sel-p)

   ;; equivalently

    (send ef-pl set-priority (list pl ef))

   ;; is shorter and preferable when using flat-devs and deep-devs
                                         
   ;; the final touch, attach a root co-ordinator

   (mk-ent root-co-ordinators r)

   ;; initialize it with the co-ordinator for ef-p

   (initialize r c:ef-pl)   

   ;; start a simulation run

   (restart r)


