
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Model/Frame pair ef-dc.m  ;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;-------------------------------------------------------------
   ; This file uses a digraph model to couple the simple processor
   ; with the experimental frame.
   ;-------------------------------------------------------------

   ;; load the components

   (load-from  model-base_directory dc-arch.m)

   (load-from  model-base_directory ef.m)

   ;; couple the experimental frame with the processor by p-ef

   (make-pair digraph-models 'ef-dc)

   ;; the composition tree

   (send ef-dc build-composition-tree ef-dc (list dc-arch ef))

   ;; the influence digraph
   (send ef-dc set-inf-dig (list (list dc-arch ef)
                                (list ef dc-arch)
   )                         )

   ;; internal coupling
   (send ef-dc set-int-coup dc-arch ef (list (cons 'out 'in)))
   (send ef-dc set-int-coup ef dc-arch (list (cons 'out 'in)))

   (send ef-dc set-ext-out-coup ef  (list (cons 'result 'out)))


   ;; define the select function to avoid  collision when the job
   ;; arrives at the time the processor finishes: processor first
   ;; then generator

   (define (sel-dc slst)
      (cond ((member dc-arch slst) dc-arch)
            ((member ef slst) ef)
   )  )

   (send ef-dc set-selectfn sel-dc)

   ;; equivalently

   (send ef-dc set-priority (list dc-arch ef))

   ;; is shorter and preferable when using flat-devs and deep-devs
                                         
   ;; the final touch, attach a root co-ordinator

 (mk-ent root-co-ordinators r)

   ;; initialize it with the co-ordinator for ef-p

  (initialize r c:ef-dc)   

   ;; start a sidcation run

  (restart r)


