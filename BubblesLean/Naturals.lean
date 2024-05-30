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


theorem any_num_geq_0 (n : Nat):n ≥ 0 := by
simp

theorem two_foil (a b c d : Nat) : (a+b)*(c+d) = a*c+a*d+b*c+b*d := by 
rw [Nat.add_mul]
rw [Nat.mul_add]
rw [Nat.mul_add]
rw [<-Nat.add_assoc]


theorem abmul (a b : Nat) : b ≥ 1 → a ≤  a *b  := by
intro bgeq1 
induction b with
| zero =>
  exfalso 
  have zerog1 : 1 > 0 := by simp
  have nlem := (Nat.not_le.mpr zerog1)
  exact nlem bgeq1
| succ k  ih =>
  rw [Nat.mul_add, Nat.mul_one,Nat.add_comm]
  apply Nat.le_add_right 


theorem le_trans ( a b c : Nat) : (a ≤ b) ∧ (b ≤ c) → a ≤ c := by
intro h 
have test1 := Nat.le
have p1 := h.left 
have p2 := h.right 
have test := Nat.le_trans p1 p2
assumption




theorem nk_geq_n (n k: Nat) : n ≥ 1 ∧ k ≥ 1 → n ≤ n ^ k := by 
intro hyp
have npos := hyp.left 
have kpos := hyp.right 
induction n with 
| zero => 
  exfalso 
  have zerog1 : 1 > 0 := by simp
  have nlem := (Nat.not_le.mpr zerog1)
  exact nlem npos
| succ m ih =>
  induction k with
  | zero =>
    exfalso 
    have zerog1 : 1 > 0 := by simp
    have nlem := (Nat.not_le.mpr zerog1)
    exact nlem kpos
    


    


    
  



  






    

    

  




