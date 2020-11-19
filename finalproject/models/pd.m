
         
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Content of the simple processor definition file p.m;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;-------------------------------------------------------------
   ; This file contains the definition of a simple processor without
   ; buffering capability
   ;-------------------------------------------------------------
   ; It performs following tasks:
   ; Gets a job from input and sends the job to the output after
   ; its processing time.
   ;-------------------------------------------------------------

	(load "mbase/func.m")

   ;;;;;;;; make a pair for the processor and its simulator

   (make-pair atomic-models 'pd)

   ;;;;;;;; set up additional variables job-id and processing-time

   (send pd def-state
              '(
                 job-id 
                 processing-time  ; processing time of this processor
               )
   )


   ;;;;;;;; initialize variables

   (send pd set-s
              (make-state 'sigma     'inf
                          'phase     'passive
                          'job-id    '()   
                          'processing-time rnd-seed-tri

              )
   )


   ;;;;;;;; define the external transition function

   (define (ex-f s e x)
           (case (content-port  x)
                 ('in (case (state-phase s)
                       ('passive (set! (state-job-id s) (content-value x))
                                 (hold-in 'busy (state-processing-time s))
                       )
                       ('busy (continue))
                       )
                 )
          )
   )

   ;;;;;;;; define the internal transition function

   (define (in-f s)
     (case (state-phase s)
       ('busy (passivate))
   ) )


   ;;;;;;;; define the output function

   (define (out-f s)
     (case (state-phase s)
       ('busy
			(set! (state-job-id s)(append (list (car (state-job-id s)))(split (car (cdr(state-job-id s))))))
            (make-content 'port 'out 'value (state-job-id s))
       )
     (else (make-content))
     )
   )


   ;;;;;;;; assignment to the model

   (send pd set-ext-transfn ex-f)
   (send pd set-int-transfn in-f)
   (send pd set-outputfn out-f)

