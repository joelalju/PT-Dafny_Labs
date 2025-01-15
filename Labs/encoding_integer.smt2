(declare-const x_0 Int) ; initial x
(declare-const x_1 Int) ; x at line 2
(declare-const x_2 Int) ; x at line 4

(declare-const y_0 Int) ; initial y
(declare-const y_1 Int) ; y at line 3

(assert (= x_1 (+ x_0 y_0))) ; x = x + y
(assert (= y_1 (- x_1 y_0))) ; y = x - y
(assert (= x_2 (- x_1 y_1))) ; x = x - y

; postcondition: x_2 = y_0 and y_1 = x_0
(assert (not (and (= x_2 y_0) (= y_1 x_0))))

(check-sat)