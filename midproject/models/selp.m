;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Content of the simple processor w/ buffering capability file ps.m ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;========================================================
;This file contains the definition of a simple processor
;with buffering capability.
;========================================================
;It performs following tasks:
;Gets a job from input and sends the job to the output 
;after its processing time.
;========================================================

;;;;;;;;;make a pair for the processor ane its simulator

        (make-pair atomic-models 'selp)

;;;;;;;;;set up additional variables job-id and processing-time

        (send selp def-state
               '(
                     job-id
                     queue
                     processing-time
                )
        )

;;;;;;;;;initialize variables

        (send selp set-s
                    (make-state   'sigma           'inf
                                  'phase           'passive
                                  'job-id          '()
                                  'queue          '()
                                  'processing-time  5
                    )
        )

;;;;;;;;;define the external transition function

        (define (ext-selp s e x)
          (case (content-port x)
            ('in 
              (if ( < 9 (content-value x))
                (case (state-phase s)
                  ('passive
                    (set! (state-job-id s) (content-value x))
                    (hold-in 'busy (state-processing-time s))
                  )
                  ('busy 
                    (set! (state-queue s) 
                     (append  (state-queue s) (list (content-value x)))
                    )
                    (continue)
                  )
                );case
                (continue)
              );if           
            )
          )
        )

;;;;;;;;;define the internal transition function

        (define(int-selp s)
                (case (state-phase s)
                      ('busy (if (null? (state-queue s))
                                 (passivate)
                                 (begin (set! (state-job-id s) (car(state-queue s)))
                                        (set! (state-queue s)  (cdr(state-queue s)))
                                        (hold-in 'busy (state-processing-time s))
                                 )
                             )
                      )
                )
        )

;;;;;;;;;define the output function

        (define (out-selp s)
                (case (state-phase s)
                      ('busy  (make-content  'port 'out 'value (state-job-id s)))
                      (else   (make-content))
                )
        )

;;;;;;;;;assignment to the model

        (send selp set-ext-transfn ext-selp)
        (send selp set-int-transfn int-selp)
        (send selp set-outputfn out-selp)

