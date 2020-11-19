


   ;;;;;;;; ef.m ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The module of a global experimental frame ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



   ;-------------------------------------------------------------
   ; This file contains the construction of the experiment frame
   ; by using digraph-models. The components
   ; are retrieved from the models.m defined in model-base.
   ;; components: One generator (genr.m)  -- genr
   ;              one transducer (transd.m) -- transd
   ;-------------------------------------------------------------


   ;; Two component of experimental frame, generator and transducer

   (load-from  model-base_directory genr4pip.m)
   (load-from  model-base_directory transd.m)

   ;; couple them in a digraph-model

   (make-pair digraph-models 'ef)
   (send ef build-composition-tree ef (list genr transd))
   (send ef set-inf-dig (list (list genr transd) (list transd genr)))

   ;; the connection from transducer to generator is made
   ;; for the termination of experiment                  

   (send ef set-int-coup transd genr (list (cons 'out 'stop)))

   (send ef set-int-coup genr transd (list (cons 'out 'ariv)))
   (send ef set-ext-inp-coup transd (list (cons 'in 'solved)))
   (send ef set-ext-out-coup genr (list (cons 'out 'out)))
   (send ef set-ext-out-coup transd (list (cons 'out 'result)))


