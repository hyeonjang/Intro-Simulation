
         
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Content of the simple processor definition file io.m;;;;;;;;;;;;;;;;;
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

   (make-pair atomic-models 'io)

   ;;;;;;;; set up additional variables job-id and processing-time

   (send io def-state
              '(
                 job-id          ;name of the processed job
                 processing-time  ; processing time of this processor
               )
   )


   ;;;;;;;; initialize variables

   (send io set-s
              (make-state 'sigma     'inf
                          'phase     'passive
                          'processing-time 10

              )
   )


   ;;;;;;;; define the external transition function

   (define (ex-f s e x)
           (case (content-port  x)
                 ('in (case (state-phase s)
                       ('passive 
                                 (set! (state-job-id s) (content-value x))
                                 (hold-in 'temporary 0)
                       )
                       ('busy (continue))
                       )
                 )
          )
   )

   ;;;;;;;; define the internal transition function

   (define (in-f s)
     (case (state-phase s)
       ('temporary (hold-in 'busy (state-processing-time s)))
       ('busy (passivate))
   ) )


   ;;;;;;;; define the output function

   (define (out-f s)
     (case (state-phase s)
       ('busy
           (make-content 'port 'out 'value (state-job-id s))
       )
       ('temporary
	(make-content 'port 'out 'value (state-job-id s))
       )
     (else (make-content))
     )
   )


   ;;;;;;;; assignment to the model

   (send io set-ext-transfn ex-f)
   (send io set-int-transfn in-f)
   (send io set-outputfn out-f)

