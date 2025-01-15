(declare-const x_0 (_ BitVec 32)) ; initial x
(declare-const x_1 (_ BitVec 32)) ; x at line 2
(declare-const x_2 (_ BitVec 32)) ; x at line 4

(declare-const y_0 (_ BitVec 32)) ; initial y
(declare-const y_1 (_ BitVec 32)) ; y at line 3

(assert (= x_1 (bvadd x_0 y_0))) ; x = x + y
(assert (= y_1 (bvsub x_1 y_0))) ; y = x - y
(assert (= x_2 (bvsub x_1 y_1))) ; x = x - y

; postcondition: x_2 = y_0 and y_1 = x_0
(assert (not (and (= x_2 y_0) (= y_1 x_0))))

(check-sat)