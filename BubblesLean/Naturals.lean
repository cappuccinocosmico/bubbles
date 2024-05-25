open Nat

theorem zeroneq (n : Nat) : n+1 ≠ 0 := by 
simp [Nat.add_one_ne_zero]


theorem addneq (n m : Nat) : n + m +1 ≠ m := by 
induction m with
| zero => simp
| succ m ih => simp; exact ih 


theorem succ_inj (n m : Nat) : n=m ↔ n+1 = m+1 := by 
constructor
intro h 
simp
exact h 
intro h 
simp [Nat.add_left_cancel] at h
exact h

theorem zeroneq_two (n : Nat) : 0 ≠ n+1 := by
intro h 
have zeroneg := zeroneq n 
apply zeroneg 
exact h.symm


theorem addative_identity (n : Nat ) : n + 0 = n := by
simp 

theorem add_cancel

theorem any_num_geq_0 (n : Nat):n ≥ 0 := by
simp

theorem two_foil (a b c d : Nat) : (a+b)*(c+d) = a*c+a*d+b*c+b*d := by 
rw [Nat.add_mul]
rw [Nat.mul_add]
rw [Nat.mul_add]
rw [<-Nat.add_assoc]


theorem nsquared_geq_n (n : Nat) : n * n ≥ n := by 
induction n with 
| zero => simp 
| succ m ih => 
    rw [ two_foil m 1 m 1]
    simp
    nth_rw  [<-Nat.add_zero m]

    

    

  




