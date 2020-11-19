;;;;;;;;;
;pip-c.m;
;;;;;;;;;
(make-pair atomic-models 'pip-c)

(send pip-c def-state '(
                       out-port
                       job
                       )
)

(send pip-c set-s (make-state 'sigma 'inf
                              'phase 'passive
                              'out-port '()
                              'job   '()
                  )
)

(define (ext-ppc s e x)
        (set! (state-out-port s) '())
        (set! (state-job s) (content-value x))
        (case (content-port x)
          ('in
              (set! (state-out-port s) 'x1)
          )
          ('y1 (set! (state-out-port s) 'x2))
          ('y2 (set! (state-out-port s) 'x3))
          ('y3 (set! (state-out-port s) 'out))
        )
        (hold-in 'busy 0)
)

(define (int-ppc s)
   (case (state-phase s)
      ('busy
          (passivate)
)))

(define (out-ppc s)
  (case (state-phase s)
     ('busy 
        (case (state-out-port s)
          ((x1 x2 x3 out)
              (make-content 'port (state-out-port s)
                            'value (state-job s))
        )
        (else (make-content))
)))   )

(send pip-c set-ext-transfn ext-ppc)
(send pip-c set-int-transfn int-ppc)
(send pip-c set-outputfn out-ppc)

     