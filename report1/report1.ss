#lang scheme

;;;;PROBLEM1-1;;;;
(define stack '())
(define (push x)
  (set! stack(cons x stack))
  stack
)
(define (pop)
  (cond
    ((null? stack) '())
    (else
      (let ((x (car stack)))
        (set! stack(cdr stack))
       x
      );let
    )
  );cond
);define

;;;;PROBLEM1-2;;;;
(define queue '())
(define (insert x)
  (set! queue (append queue (list x)))
  queue
)
(define (extract)
  (cond
    ((null? queue) '())
    (else
      (let ((x (car queue)))
        (set! queue (cdr queue))
        x
      );let
    );else
  );cond
);define

;;;;PROBLEM2-1;;;;
(define (sequential-search-1 x lst)
  (let loop ((temp-lst lst))
    (cond 
      ((null? temp-lst) '())
      ((equal? x (car temp-lst)) x)
      (else (loop(cdr temp-lst)))
    );cond
  );let
);;define

;;;;PROBLEM2-2;;;;
(define (sequential-search-2 x lst)
  (cond
    ((null? lst) lst)
    ((equal? x (car lst)) x)
    (else (sequential-search-2 x (cdr lst)))
  );cond
);define

;;;;PROBLEM3-1;;;;
(define (custom-min-1 lst)
  (let ((min-x 100))
    (let loop ((temp-lst lst))
     (cond
        ((null? temp-lst) min-x)
        ((> min-x (car temp-lst))(set! min-x (car temp-lst))(loop(cdr temp-lst)))
        (else (loop(cdr temp-lst)))
      );cond
     );let loop
  );let
);define

;;;;PROBLEM3-2;;;;
(define min-x 100)
(define (custom-min-2 lst)
    (cond
      ((null? lst) min-x)
      ((> min-x (car lst))(set! min-x (car lst))(custom-min-2 (cdr lst)))
      (else (custom-min-2 (cdr lst)))
    );cond
);define

;;;;PROBLEM4;;;;
(define (last-ele lst)
  (let loop ((temp-lst lst))
    (cond
      ((null? temp-lst) '())
      ((equal? 2 (length temp-lst)) (car temp-lst))
      (else (loop (cdr temp-lst)))
      );cond
    );let
);define

;;;;PROBLEM5;;;;
(define-struct record (id grade))
(define obj-lst '())

(define (insert-obj id grade lst)
  (let loop ((temp-lst lst))
     (cond     
       ((null? temp-lst)(set! obj-lst (cons (make-record id grade) lst)))
       ((equal? id (record-id (car temp-lst)))(display "You cannot insert. There is already same id"))
       (else (loop (cdr temp-lst)))
     );cond
  );let loop
  obj-lst
);define

(define (print-obj lst)
  (for-each 
    (lambda (n)
      (display (record-id n))
      (display " ")
      (display (record-grade n))
      (display "; ")
    )
    lst
  )
);define

(define (delete-obj id lst)
  (cond
   ((equal? id (record-id (car lst)))(set! obj-lst (remove (car lst) lst)))
   (else '())
  );cond
);define