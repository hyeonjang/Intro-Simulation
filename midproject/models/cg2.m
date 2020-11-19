
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;  Generator cg2.m;;;;;;;;;;;
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

   (make-pair atomic-models 'cg2)

   ; add another state variable: inter-arrival time

   (send cg2 def-state '(inter-arrival-time1 
		inter-arrival-time2
		index	)
)


   ; initialization

   (send cg2 set-s (make-state 'sigma              5
                                'phase              'active1
                                'inter-arrival-time1 5
		        'inter-arrival-time2 10
		        'index 0
                   )
   )


   ;; Add external transition function to terminate the generator
   ;; when the experiment is over instead of using keyboard interrupt

   (define (ext-cg2 s e x)
     (case (content-port x)
           ('stop       
              (passivate)  ;when receive stop signal passivate
           )
           (else (continue))
     )
   )

   ;; definition of internal transition function

   (define (int-cg2 s)
     (case (state-phase s)
           ('active1
	   (set! (state-index s)(+ 1 (state-index s)))
	   (if (= 0 (remainder (state-index s) 2))
	     (hold-in 'active2 (state-inter-arrival-time2 s))	
                 (set! (state-sigma s) (state-inter-arrival-time1 s))
	   );if
            )
   	('active2
	   (set! (state-index s)(+ 1 (state-index s)))
	   (if (= 0 (remainder (state-index s) 2))
	     (hold-in 'active1 (state-inter-arrival-time1 s))
               (set! (state-sigma s) (state-inter-arrival-time2 s))
            );if
	) 
   ) )

   ;; definition of output function         

   ; output the jobname (gensym) to port 'out

   (define (out-cg2 s)
     (case (state-phase s)
           ('active1
             (make-content 'port 'out1 'value (gensym 'job-))
           )           
	('active2
               (make-content 'port 'out2 'value (gensym 'job-))
           )
           (else (make-content)
   ) )     )

   ;; connect the definitions of functions to generator

   (send cg2 set-int-transfn int-cg2)
   (send cg2 set-ext-transfn ext-cg2)
   (send cg2 set-outputfn out-cg2)
