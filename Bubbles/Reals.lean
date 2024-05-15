import Mathlib.Tactic

import Mathlib.RingTheory.Ideal.QuotientOperations
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.DedekindDomain.Ideal

variable (R : Type) [CommRing R] (ℚ : Subring R)

axiom unique_derivative_at_zero : ∀ (f : R → R), ∃! (y : R), (∀ (d : R), d ^ 2 = 0 → f d = f 0 + y * d)






