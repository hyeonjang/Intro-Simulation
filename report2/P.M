
         
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


   ;;;;;;;; make a pair for the processor and its simulator

   (make-pair atomic-models 'p)

   ;;;;;;;; set up additional variables job-id and processing-time

   (send p def-state
              '(
               ;;;state-variables:
 
                  job-id          ;name of the processed job
 
               ;;;parameters
 
                 processing-time  ; processing time of this processor
               )
   )


   ;;;;;;;; initialize variables

   (send p set-s
              (make-state 'sigma     'inf
                          'phase     'passive
                          'job-id    '()   
                          'processing-time 10

              )
   )


   ;;;;;;;; define the external transition function

   (define (ex-f s e x)
           (case (content-port  x)
                 ('in (case (state-phase s)
                       ('passive (set! (state-job-id s) (content-value x))
                                 (hold-in 'busy (+ 1 (random 5)))
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
           (make-content 'port 'out 'value (state-job-id s))
       )
     (else (make-content))
     )
   )


   ;;;;;;;; assignment to the model

   (send p set-ext-transfn ex-f)
   (send p set-int-transfn in-f)
   (send p set-outputfn out-f)

