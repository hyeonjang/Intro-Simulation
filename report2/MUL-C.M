;Multi-sever Co-ordinator

(make-pair atomic-models 'mul-c)

(send mul-c def-state '(
                       spfour1-s
                       spfour2-s
                       spfour3-s
                       out-port
                       job
                       )
)

(send mul-c set-s    (make-state   'sigma 'inf
                                   'phase 'passive
                                   'spfour1-s 'passive
                                   'spfour2-s 'passive
                                   'spfour3-s 'passive
                                   'out-port  '()
                                   'job       '()
                      )
)

;external transition function

(define (ext-mc s e x)
    (set! (state-out-port s) '())  ;default , no port to be sent to
    (set! (state-job s)  (content-value x))
    (case  (content-port x)
           ('in
              (cond
                ( (equal? (state-spfour1-s s) 'passive)
                         (set! (state-out-port s) 'x1)
                         (set! (state-spfour1-s s) 'busy))
                ( (equal? (state-spfour2-s s) 'passive)
                         (set! (state-out-port s) 'x2)
                         (set! (state-spfour2-s s) 'busy))                
                ( (equal? (state-spfour3-s s) 'passive)
                         (set! (state-out-port s) 'x3)
                         (set! (state-spfour3-s s) 'busy))
            ))
           ('y1 (set! (state-spfour1-s s) 'passive)
                (set! (state-out-port s) 'out)
           )
           ('y2 (set! (state-spfour2-s s) 'passive)
                (set! (state-out-port s) 'out)
           )
           ('y3 (set! (state-spfour3-s s) 'passive)
                (set! (state-out-port s) 'out)
           )
      )
      (hold-in 'busy 0)
)

(define (int-mc s)
   (case (state-phase s)
      ('busy
          (passivate)
)))

(define (out-mc s)
   (case (state-phase s)
      ('busy
          (case (state-out-port s)
              ((x1 x2 x3 out)
                   (make-content 'port  (state-out-port s)
                                 'value (state-job s))
              )
          (else (make-content))
))))


(send mul-c set-ext-transfn ext-mc)
(send mul-c set-int-transfn int-mc)
(send mul-c set-outputfn out-mc)
