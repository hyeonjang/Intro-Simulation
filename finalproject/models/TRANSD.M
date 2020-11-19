

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;  Transducer transd.m;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                     
   ;-------------------------------------------------------------
   ; This file contains the definition of transducer
   ;-------------------------------------------------------------
   ;
   ; Transducer designed for the measurement of
   ;
   ;           1. average turnaround time of processed jobs
   ;           2. thoughput
   ;


   (define observation-interval 100)
                     



   ; now start model definition proper

   (make-pair atomic-models 'transd)


   (send transd def-state '(arrived-list  ;; all jobs which have arrived
                           solved-list    ;; all jobs which have been processed
                           clock          ;; local clock
                           total-ta)      ;; total turnaround time of processed 
                                          ;; jobs
   )

   (send transd set-s (make-state
                          'sigma         observation-interval
                          'phase         'active
                          'arrived-list  '()
                          'solved-list   '()
                          'clock         0
                          'total-ta      0
   )                 )

  ;; external transition function takes care of recording arriving 
  ;; and departing jobs and of accumulating total turnaround time

   (define (ext-t s e x)
         (let (
              (problem-id (car (content-value x)))
			  (problem-content (content-value x))
              )
           (set! (state-clock s) (+ (state-clock s) e))
           (case (content-port x)
             ('ariv (set! (state-arrived-list s)
                         (cons (append problem-content (list (state-clock s)))
                               (state-arrived-list s)))
             )
             ('solved (let* (
                          (pair  (assoc problem-id (state-arrived-list s)))
			              (prob-arrival-time  (caddr pair))

                          (turn-around-time
                                (when prob-arrival-time
                                (- (state-clock s) prob-arrival-time))
                                )
                          )
                       (when  prob-arrival-time
                           (set! (state-total-ta s)
                              (+ (state-total-ta s) turn-around-time))
                          (set! (state-solved-list s)
                             (cons problem-content (state-solved-list s)))
                       )
                    )
               )
             (else (bkpt "error: invalid input port name --> " (content-port x)))
          )
         )
         (continue)
   )

   ;; internal transition function is called only at end of run

   (define (int-t s)
   (case (state-phase s)
     ('active (passivate))
   ))

   ;; output function serves to compute summary indexes: throughput and
   ;; average turnaround time

   (define (out-t s)
     (case (state-phase s)
       ('active
          (let* (

   ; a port log-file is opened to record transducer output in file "log"

               (log-file (open-output-file "log"))

   ; average turn-around time: total-ta divided by number of processed jobs

                (avg-ta-time
                  (if (NULL? (state-solved-list s))
                    '()
                    (/ (state-total-ta s) (length (state-solved-list s)))
                  )
                )

   ; thruput: number of processed jobs divided by observation interval

                (thruput
                 (if (= (state-clock s) 0)
                    '()
                    (/ (- (length (state-solved-list s)) 1) 
                       (- (state-clock s) avg-ta-time))
                 )
                )
              )

          (newline log-file)
          (display "The arrived list: " log-file)
          (display (state-arrived-list s) log-file)
          (newline log-file)
          (display "The solved list:  " log-file)
          (display (state-solved-list s) log-file)
               (newline log-file)
          (display "Avg. turnaround time: " log-file)
              (display avg-ta-time  log-file)
          (newline log-file)
          (display "ThruPut: " log-file)
              (display thruput log-file)
          (newline log-file)
          (close-output-port log-file)
          (make-content 'port 'out 'value (list avg-ta-time thruput))
        ) ;;let
       ) ;;active
       (else (make-content))
   ))
        

   (send transd set-ext-transfn ext-t)
   (send transd set-int-transfn int-t)
   (send transd set-outputfn out-t)
                    

