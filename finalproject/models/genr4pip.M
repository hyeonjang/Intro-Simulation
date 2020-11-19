
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;  Generator genr.m;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



   ;-------------------------------------------------------------
   ; This file contains the definition of the job generator
   ;-------------------------------------------------------------
   ; It should perform following tasks:
   ; generates a job every inter-arrival-time
   ; Option: stops the generating sequence when receiving a stop
   ;         signal  (stop)
   ;-------------------------------------------------------------

   ;; create a generator                     

   (make-pair atomic-models 'genr)

   ; add another state variable: inter-arrival time

   (send genr def-state '(inter-arrival-time))


   ; initialization

   (send genr set-s (make-state 'sigma              0
                                'phase              'active
                                'inter-arrival-time 3
                   )
   )


   ;; Add external transition function to terminate the generator
   ;; when the experiment is over instead of using keyboard interrupt

   (define (ext-genr s e x)
     (case (content-port x)
           ('stop       
              (passivate)  ;when receive stop signal passivate
           )
           (else (continue))
     )
   )

   ;; definition of internal transition function

   (define (int-genr s)
     (case (state-phase s)
           ('active
               (set! (state-sigma s) (state-inter-arrival-time s))
            )       ;;;reset sigma each time an internal transition occurs
                    ;;; Note: not really necessary for fixed inter-arrival
                    ;;; time
   ) )

   ;; definition of output function         

   ; output the jobname (gensym) to port 'out

   (define (out-genr s)
     (case (state-phase s)
           ('active
             (make-content 'port 'out 'value 
				(list (gensym 'g)
						(list (random 100)(random 100)(random 100)(random 100)(random 100)
							  ;(random 100)(random 100)(random 100)(random 100)(random 100)
							  ;(random 100)(random 100)(random 100)(random 100)(random 100)
						)
				)
			  )
           )
           (else (make-content)
   )))

   ;; connect the definitions of functions to generator

   (send genr set-int-transfn int-genr)
   (send genr set-ext-transfn ext-genr)
   (send genr set-outputfn out-genr)
