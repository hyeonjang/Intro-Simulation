   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Content of the simple processor definition file nep-to.m;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   (make-pair atomic-models 'nep-to)
   (send nep-to def-state
              '(
                  job-id
               )
   )

   (send nep-to set-s
              (make-state 'sigma     5
                          'phase     'setup
                          'job-id    '(g1 g2)
              )
   )

   (define (in-f s)
    	 (case (state-phase s)
       		('setup (hold-in 'busy 2))
      		 ('busy  (passivate))
   	)
    )

   (define (out-f s)
     (case (state-phase s)
      	('setup
		(let ((temp (car (state-job-id s))))
			(set! (state-job-id s)(cdr(state-job-id s)))
			(make-content 'port 'out1 'value temp)
		);let	
      	 )
      	 ('busy
        	   	(let ((temp (car (state-job-id s))))
			(set! (state-job-id s)(cdr(state-job-id s)))
			(make-content 'port 'out2 'value temp)
		);let	
      	 )
    	 (else (make-content))
     )
   )

   (send nep-to set-int-transfn in-f)
   (send nep-to set-outputfn out-f)
