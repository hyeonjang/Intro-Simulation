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

        (make-pair atomic-models 'ps)

;;;;;;;;;set up additional variables job-id and processing-time

        (send ps def-state
               '(
                     job-id
                     stack
                     processing-time
                )
        )

;;;;;;;;;initialize variables

        (send ps set-s
                    (make-state   'sigma           'inf
                                  'phase           'passive
                                  'job-id          '()
                                  'stack          '()
                                  'processing-time  10
                    )
        )

;;;;;;;;;define the external transition function

        (define (ext-ps s e x)
                (case (content-port x)
                      ('in (case (state-phase s)
                                 ('passive
                                        (set! (state-job-id s) (content-value x))
                                        (hold-in 'busy (state-processing-time s))
                                 )
                                 ('busy 
                                        (set! (state-stack s) 
                                             (append (list (content-value x))(state-stack s))
                                        )
                                        (continue)
                                 )
                           )
                      )
                )
        )

;;;;;;;;;define the internal transition function

        (define(int-ps s)
                (case (state-phase s)
                      ('busy (if (null? (state-stack s))
                                 (passivate)
                                 (begin (set! (state-job-id s) (car(state-stack s)))
                                        (set! (state-stack s)  (cdr(state-stack s)))
                                        (hold-in 'busy (state-processing-time s))
                                 )
                             )
                      )
                )
        )

;;;;;;;;;define the output function

        (define (out-ps s)
                (case (state-phase s)
                      ('busy  (make-content  'port 'out 'value (state-job-id s)))
                      (else   (make-content))
                )
        )

;;;;;;;;;assignment to the model

        (send ps set-ext-transfn ext-ps)
        (send ps set-int-transfn int-ps)
        (send ps set-outputfn out-ps)

