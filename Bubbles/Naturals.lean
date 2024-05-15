import data.nat.basic


axiom zeroneq (n : Nat) : n+1 ≠ 0

axiom succ_inj (n m : Nat) : n+1 = m+1 ↔ n=m

theorem geq_lem (n m : Nat) :n+1 ≠ n := by
  induction' m with k kh
  intro nkh

theorem zeroneq_two (n : Nat) : 0 ≠ n+1 := by
intro h 
have hs := h.symm
have zeroneg := zeroneq n 
apply zeroneg hs



-- xdrcfvgbhnjmkjnhbgvfcdxsecrfvgtbyhnujmikjnhbgvfcdxsedcfvgbnhjbvgyftcdxszdecfvgbnhjubgvfcdxszaxdcfvgbhnbgvfcdxszasxdcfvgbhnbgvfcdxs
theorem eq_decidable (n m : Nat) : n=m ∨ ¬ (n=m) := by
  have zeroeq_decidable (n : Nat) :n=0 ∨ ¬ (n=0) := by
    induction' n with n nh
    have zeroeq : 0=0 := by rfl;
    exact Or.inl zeroeq
    have nplusneqzero : n+1 ≠ 0 := zeroneq n 
    exact Or.inr nplusneqzero
  have zeroeq_decidable_flipped (n : Nat) : 0 = n ∨ ¬0 = n := by 
    have nzero := zeroeq_decidable n
    cases' nzero with hleft hright 
    exact Or.inl hleft.symm
    have fhright := fun x : n=0 => hright x.symm 
  induction' n with n nh
  exact zeroeq_decidable_flipped m
  cases' nh with m_eq_n m_neq_n

