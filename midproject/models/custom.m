
     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Content of the simple processor definition file custom.m;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;-------------------------------------------------------------
; Pseudo Ray-Intersection-Simulator 
;-------------------------------------------------------------
; It performs following tasks:
; Gets a ray(ray) from input and sends the ray to the output after
; intersection or specific depth
;-------------------------------------------------------------

;-------------------------------------------------------------
;; for checking intersection, but actually this process is not excuteded randomly
(define (rand-isect)
	(let ((isect (random 100)))
		(cond 
		 	((< isect 70) 'miss)
			((and (> isect 69)(< isect 100)) 'hit)
		)
	)	
)


;;;;;;;; make a pair for the processor and its simulator

(make-pair atomic-models 'ris)

;;;;;;;; set up additional variables ray-id and processing-time

(send ris def-state
          '(
             ray-id
             queue
             max-depth
             missed-color          
             processing-time
           )
)


;;;;;;;; initialize variables

(send ris set-s
          (make-state 'sigma     'inf
                      'phase     'passive
                      'ray-id    '()
                      'queue     '()
                      'max-depth  4
                      'missed-color 'black   
                      'processing-time 5

          )
)


;;;;;;;; define the external transition function

(define (ex-f s e x)
       (case (content-port  x)
             ('pixel (case (state-phase s)
                   		('passive (set! (state-ray-id s) (content-value x))
                        	      (hold-in 0 (state-processing-time s))
                   		)
                   		(else 
							(set! (state-queue s) 
                                 (append  (state-queue s) (list (content-value x)))
                            )
                   			(continue)
                   		)
                   )
             )
      )
)

;;;;;;;; define the internal transition function

(define (in-f s)
	(cond
	    ((equal? 'done (state-phase s)) 
	    	(if (null? (state-queue s))
	    		(passivate)
	    		(begin (set! (state-ray-id s) (car(state-queue s)))
                       (set! (state-queue s)  (cdr(state-queue s)))
                       (hold-in 0 (state-processing-time s))
                )
	    	)
	    )
        ((equal? 'miss (state-phase s)) 
        	(if (null? (state-queue s))
	    		(passivate)
	    		(begin (set! (state-ray-id s) (car(state-queue s)))
                       (set! (state-queue s)  (cdr(state-queue s)))
                       (hold-in 0 (state-processing-time s))
                )
	    	)
	    )
	    ((< (state-phase s)(state-max-depth s))
	    	(let ((n (rand-isect)))
    			(case n
 					('miss (if (= (state-phase s) 0)
 						(hold-in 'miss (state-processing-time s))
 						(hold-in 'done (state-processing-time s))
 						)
        			)
    				('hit  (hold-in (+ (state-phase s) 1)(state-processing-time s)))
        		)
        	);let 	
	    )
	)
)


;;;;;;;; define the output function

(define (out-f s)
 	(case (state-phase s)
 		('done (make-content 'port 'pixel-color 'value (state-ray-id s)))
    	('miss (make-content 'port 'missed-color 'value (state-missed-color s)))
 		(else (make-content))
	)
)


;;;;;;;; assignment to the model

(send ris set-ext-transfn ex-f)
(send ris set-int-transfn in-f)
(send ris set-outputfn out-f)

