(declare-datatypes ((Op 0))
((( plus ) ( minus ) (combine))))

(define-fun abs ((x Int)) Int
 (ite (>= x 0) x (- x)))

(define-fun get-op ((kk1 Int) (kk2 Int)) Op
 (ite (> (abs kk1) (abs kk2)) combine  
   (ite (> 0 kk2) minus plus)))

(declare-const op_12 Op)
(declare-const op_23 Op)
(declare-const op_34 Op)
(declare-const op_45 Op)
(declare-const op_56 Op)
(declare-const op_67 Op)
(declare-const op_78 Op)
(declare-const op_89 Op)

(declare-const k1 Int)
(declare-const k2 Int)
(declare-const k3 Int)
(declare-const k4 Int)
(declare-const k5 Int)
(declare-const k6 Int)
(declare-const k7 Int)
(declare-const k8 Int)
(declare-const k9 Int)

(declare-const combine_op_12 Bool)
(declare-const combine_op_23 Bool)
(declare-const combine_op_34 Bool)
(declare-const combine_op_45 Bool)
(declare-const combine_op_56 Bool)
(declare-const combine_op_67 Bool)
(declare-const combine_op_78 Bool)
(declare-const combine_op_89 Bool)

(assert ( = op_12 (get-op k1 k2)))
(assert ( = op_23 (get-op k2 k3)))
(assert ( = op_34 (get-op k3 k4)))
(assert ( = op_45 (get-op k4 k5)))
(assert ( = op_56 (get-op k5 k6)))
(assert ( = op_67 (get-op k6 k7)))
(assert ( = op_78 (get-op k7 k8)))
(assert ( = op_89 (get-op k8 k9)))

; first coefficient is positive
(assert (> k1 0))

; |k1| is a power of 10 between 1 and 10^8
(assert (or (= (abs k1) 1) (= (abs k1) 10) (= (abs k1) 100) (= (abs k1) 1000) (= (abs k1) 10000) 
 (= (abs k1) 100000) (= (abs k1) 1000000) (= (abs k1) 10000000) (= (abs k1) 100000000)))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k2| is a power of 10 between 1 and 10^7
(assert (ite (not (= (abs k1) 1)) (= k2 (div k1 10))
 (or (= (abs k2) 1) (= (abs k2) 10) (= (abs k2) 100) (= (abs k2) 1000) (= (abs k2) 10000) 
 (= (abs k2) 100000) (= (abs k2) 1000000) (= (abs k2) 10000000))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k3| is a power of 10 between 1 and 10^6
(assert (ite (not (= (abs k2) 1)) (= k3 (div k2 10))
 (or (= (abs k3) 1) (= (abs k3) 10) (= (abs k3) 100) (= (abs k3) 1000) (= (abs k3) 10000) 
 (= (abs k3) 100000) (= (abs k3) 1000000))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k4| is a power of 10 between 1 and 10^5
(assert (ite (not (= (abs k3) 1)) (= k4 (div k3 10))
 (or (= (abs k4) 1) (= (abs k4) 10) (= (abs k4) 100) (= (abs k4) 1000) (= (abs k4) 10000) 
 (= (abs k4) 100000))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k5| is a power of 10 between 1 and 10^4
(assert (ite (not (= (abs k4) 1)) (= k5 (div k4 10))
 (or (= (abs k5) 1) (= (abs k5) 10) (= (abs k5) 100) (= (abs k5) 1000) (= (abs k5) 10000))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k6| is a power of 10 between 1 and 10^3
(assert (ite (not (= (abs k5) 1)) (= k6 (div k5 10))
 (or (= (abs k6) 1) (= (abs k6) 10) (= (abs k6) 100) (= (abs k6) 1000))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k7| is a power of 10 between 1 and 10^2
(assert (ite (not (= (abs k6) 1)) (= k7 (div k6 10))
 (or (= (abs k7) 1) (= (abs k7) 10) (= (abs k7) 100))))

; if k_n is part of a combine, k_n = k_{n-1} / 10
; else |k8| is a power of 10 between 1 and 10
(assert (ite (not (= (abs k7) 1)) (= k8 (div k7 10))
 (or (= (abs k8) 1) (= (abs k8) 10))))

; last coefficient is +/- 1, has to have the same sign as previous iff it is part of a combine
(assert (ite (not (= (abs k8) 1)) (= k9 (div k8 10))
 (= (abs k9) 1)))

; 'The' formula
(assert (= 100 (+ (* 1 k1) (* 2 k2) (* 3 k3) (* 4 k4) (* 5 k5) (* 6 k6) (* 7 k7) (* 8 k8) (* 9 k9))))

; Link indicators to the actual operations
(assert (= combine_op_12 (= op_12 combine)))
(assert (= combine_op_23 (= op_23 combine)))
(assert (= combine_op_34 (= op_34 combine)))
(assert (= combine_op_45 (= op_45 combine)))
(assert (= combine_op_56 (= op_56 combine)))
(assert (= combine_op_67 (= op_67 combine)))
(assert (= combine_op_78 (= op_78 combine)))
(assert (= combine_op_89 (= op_89 combine)))

; Maximize the number of `combine` operations
(maximize (+
  (ite combine_op_12 1 0)
  (ite combine_op_23 1 0)
  (ite combine_op_34 1 0)
  (ite combine_op_45 1 0)
  (ite combine_op_56 1 0)
  (ite combine_op_67 1 0)
  (ite combine_op_78 1 0)
  (ite combine_op_89 1 0)))

(check-sat)
(get-objectives)
(get-value (op_12 op_23 op_34 op_45 op_56 op_67 op_78 op_89))