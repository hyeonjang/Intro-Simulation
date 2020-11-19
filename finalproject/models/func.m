	;;;;;;; the function to change value to odd number
	
	(define (odding lst)
		(map (lambda (x)(+ x (remainder (+ x 1) 2))) lst)
	)

	(define (split lst)	
		(define result '())
		(define total '())
			(let loop ((i 1)(temp-lst lst))
				(set! result (append result (list(car temp-lst))))
				(cond
					((equal? i 16) total)
					((= 0 (remainder i 5))
						(set! total (append total (list result)))
						(set! result '())
						(loop (+ i 1)(cdr temp-lst))
					)
					(else (loop (+ i 1)(cdr temp-lst)))
				);cond
			);letloop
	)
	

	(define (merge lst)
		(define merge-lst '())
		(let loop ((i 1)(temp-lst lst))
			(set! merge-lst (append merge-lst (car temp-lst)))
			(cond
				((equal? i 3) merge-lst)
				(else (loop (+ i 1)(cdr temp-lst)))
			);cond
		);let loop
	)
	
	(define rnd-seed (truncate (unifrm 6 10 5)))
	(define rnd-seed-tri (truncate (unifrm 2 4 5)))