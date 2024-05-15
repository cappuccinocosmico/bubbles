def hello := "world"


theorem not_not_lem (P : Prop) : ¬ ¬ (P ∨ ¬ P) := by
  -- Begin proof by assuming neg_lem : ¬(P ∨ ¬P) and try to show False
  intro neg_lem
  -- Prove not P by using or introduction along with our assumption.
  have notp : P → False := fun p1 : P => neg_lem (Or.intro_left (¬P) p1)
  -- Prove lem using not p
  have pornotp : P ∨ ¬ P := Or.intro_right (P) notp
  -- Derive a contradiction from neg_lem and lem.
  exact neg_lem pornotp

theorem doub_neg (P : Prop) : P  → ¬(¬P ) := by
  intro p
  exact fun np : ¬ P  => np p

theorem decidable_implies_stable (P : Prop) : (P ∨ ¬ P) → (P ↔ ¬ ¬ P):= by
  intro lem_p
  constructor
  exact doub_neg (P) -- Use the theorem above to quickly dispatch one case.
  -- Case 2
  intro nnp
  cases lem_p with
  | inl p => exact p
  | inr np => exfalso; exact nnp np


theorem contrapositive (P Q : Prop): (P → Q ) → ((¬ Q ) → (¬ P)) := by
  intro p_implies_q
  intro notq
  exact fun p1 : P => notq (p_implies_q (p1))


theorem neg_equals_trip_neg (P : Prop) :  ¬ P  ↔ ¬ (¬ (¬ P ))  := by
  constructor
  -- Case 1
  intro np
  intro nnp
  exact nnp np
  -- Case 2
  have h1 := doub_neg (P)
  have contrap := contrapositive (P)  ¬ ¬ P
  exact contrap (h1)

theorem doub_contrapositive (P Q : Prop): ((¬ Q) → (¬ P)) ↔ ((¬ ¬ P) → (¬ ¬ Q)) := by
  constructor
  -- Case 1
  have dc := contrapositive (¬ Q) (¬ P) -- Use existing contrapositive lemma to qucikly dispatch case 1
  exact dc
  -- Case 2
  intro h1 
  intro nq 
  intro p 
  have nnp := doub_neg (P) p 
  have nnq := h1 nnp 
  exact nnq nq

  

theorem doub_neg_and (P Q : Prop): (¬ (¬P)) ∧ (¬ (¬ Q )) ↔
¬ (¬ (P  ∧ Q )):= by
  constructor
  -- Part 1, proving : ¬¬P  ∧ ¬¬P  → ¬¬(P  ∧ P )
  intro nnp_and_nnq
  intro h2
  have nnp := nnp_and_nnq.left
  have nnq := nnp_and_nnq.right
  apply nnp
  intro p1
  apply nnq
  intro q1
  apply h2
  constructor
  repeat assumption
  -- Part 2, proving ¬¬(P ∧ Q) → ¬¬P ∧ ¬¬Q
  intro h1
  constructor
  intro h2
  have notpandq := fun pandq : P ∧ Q => h2 pandq.left
  exact h1 notpandq
  intro h2
  have notpandq := fun pandq : P  ∧ Q => h2 pandq.right
  exact h1 notpandq


theorem doub_neg_or (P Q : Prop): (¬ (¬P)) ∨ (¬ (¬ Q )) →
¬ (¬ (P ∨ Q)):= by
  -- Part 1, proving : ¬¬P ∨ ¬¬P → ¬¬(P ∨ P )
  intro h1
  intro h2
  cases h1 with
  | inl nnp => apply nnp;intro p; exact h2 (Or.inl p)
  | inr nnq => apply nnq;intro q; exact h2 (Or.inr q)

theorem classical_results_negation (P Q : Prop) : (¬ (¬ P ) → ¬ Q) ↔  (P  → ¬ Q) := by
  constructor
  intro h1
  intro p
  have nnp := (doub_neg P ) p
  exact h1 nnp
  -- Part 1 complete, beginning part 2
  intro h1
  intro nnp
  intro q1
  apply nnp
  intro p1
  have nq := h1 p1
  exact nq q1



theorem doub_neg_implies (P Q : Prop): ¬¬(P → Q) ↔
(¬ ¬ P) → ¬ (¬ Q):= by
  constructor
  -- Part 1, proving :
  intro h1
  intro nnp
  intro nq
  apply h1
  intro pimpq
  apply nnp
  intro p
  have q := pimpq p
  exact nq q
  -- Part 2
  intro h1
  intro h2
  apply h1
  intro np 
  apply h2
  intro p 
  exfalso
  exact np p
  intro q 
  apply h2 
  intro 
  exact q


theorem trad_imp_implies_reg_imp(P Q : Prop) : (Q ∨ ¬ P ) →  (P → Q)   := by
  intro h
  intro p
  cases h with
  | inl q => exact q
  | inr np => exfalso; exact np p

theorem half_demorgan (P Q : Prop):  (¬ P) ∧ (¬ Q) ↔ ¬ (P ∨ Q) := by
  constructor
  intro h
  intro h2
  cases h2 with
  | inl p => have np := h.left ; exact np p
  | inr q => have nq := h.right ;exact nq q
  intro h 
  constructor
  intro p 
  exact h (Or.inl p)
  intro q 
  exact h (Or.inr q)


theorem quarter_demorgan_snd (P Q : Prop):  (¬ P) ∨ (¬ Q) → ¬ (P ∧ Q) := by
intro npornq
intro pq
cases npornq with
| inl np => have p := pq.left ; exact np p
| inr nq => have q := pq.right ; exact nq q



theorem exponential_identity (P : Prop) : P ↔ ( True → P) := by
constructor
intro p
exact fun t : True => p 
intro tr_imp_p 
apply tr_imp_p 
trivial
