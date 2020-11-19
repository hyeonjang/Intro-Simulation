
         
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Content of the simple processor definition file tsp.m;;;;;;;;;;;;;;;;;
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

   (make-pair atomic-models 'tsp)

   ;;;;;;;; set up additional variables job-id and processing-time

   (send tsp def-state
              '(
                 job-id
                 processing-time1
	     processing-time2
	     processing-time3
               )
   )


   ;;;;;;;; initialize variables

   (send tsp set-s
              (make-state 'sigma     'inf
                          'phase     'passive
                          'job-id    '()   
                          'processing-time1 2
		  'processing-time2 3
		  'processing-time3 4
              )
   )


   ;;;;;;;; define the external transition function

   (define (ex-f s e x)
           (case (content-port  x)
                 ('in (case (state-phase s)
                       ('passive (set! (state-job-id s) (content-value x))
                                 (hold-in 'busy1 (state-processing-time1 s))
                       )
                       ('busy1 (continue))('busy2 (continue))('busy3 (continue))
                       )
                 )
          )
   )

   ;;;;;;;; define the internal transition function

   (define (in-f s)
     (case (state-phase s)
       ('busy1 (hold-in 'busy2 (state-processing-time2 s)))
       ('busy2 (hold-in 'busy3 (state-processing-time3 s)))
       ('busy3 (passivate))
   ) )


   ;;;;;;;; define the output function

   (define (out-f s)
     (case (state-phase s)
       ('busy1
           (make-content 'port '() 'value ())
       )
       ('busy2
           (make-content 'port 'out1 'value (state-job-id s))
       )
       ('busy3
           (make-content 'port 'out2 'value (state-job-id s))
       )
     (else (make-content))
     )
   )


   ;;;;;;;; assignment to the model

   (send tsp set-ext-transfn ex-f)
   (send tsp set-int-transfn in-f)
   (send tsp set-outputfn out-f)

