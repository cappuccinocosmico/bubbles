import Mathlib.Tactic
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






-- theorem eq_decidable (n m : Nat) : n=m ∨ ¬ (n=m) := by
--   have zeroeq_decidable (n : Nat) :n=0 ∨ ¬ (n=0) := by
--     induction' n with n nh
--     have zeroeq : 0=0 := by rfl;
--     exact Or.inl zeroeq
--     have nplusneqzero : n+1 ≠ 0 := zeroneq n 
--     exact Or.inr nplusneqzero
--   have zeroeq_decidable_flipped (n : Nat) : 0 = n ∨ ¬0 = n := by 
--     have nzero := zeroeq_decidable n
--     cases' nzero with hleft hright 
--     exact Or.inl hleft.symm
--     have fhright := fun x : 0=n => hright x.symm 
--     exact Or.inr fhright
--   induction n with 
--   | zero  => exact zeroeq_decidable_flipped m 
--   | succ k ih => 
--     cases ih with
--     | inl lh => 
--       have khm : k+1 ≠ m := by 
--         simp [lh]
--       exact Or.inr khm
--     | inr rh => 
--       induction m with 
--       | zero => exact Or.inr (zeroneq k)
--       | succ m ih => sorry
    

  




