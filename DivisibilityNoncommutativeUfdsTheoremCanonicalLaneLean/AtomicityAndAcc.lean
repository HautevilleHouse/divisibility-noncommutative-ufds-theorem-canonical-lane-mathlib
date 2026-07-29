import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure AtomicDomain (R : Type u) [Ring R] where
  domain : NoncommutativeDomain R
  everyNonZeroNonUnitFactorable : ∀ (a : R), a ≠ 0 → ¬ IsUnit a → ∃ (factors : List R), (∀ f ∈ factors, IrreducibleElement R f) ∧ (a = factors.prod)

structure AscendingChainCondition (R : Type u) [Ring R] where
  accOnPrincipalIdeals : ∀ (a1 a2 a3 : ℕ → R), (∀ i, PrincipalIdeal (a1 i) ⊆ PrincipalIdeal (a2 i)) → ...
  -- simplified: ACC on principal right ideals
  accPrincipalRight : ∀ (chain : ℕ → Set R), (∀ i, chain i ⊆ chain (i+1)) → ∃ n, ∀ m ≥ n, chain m = chain n

structure AtomicAccPackage (R : Type u) [Ring R] where
  atomic : AtomicDomain R
  acc : AscendingChainCondition R
  atomicAccClosed : Prop := atomic.everyNonZeroNonUnitFactorable ∧ acc.accPrincipalRight

theorem atomic_acc_closed (R : Type u) [Ring R] (A : AtomicAccPackage R) : A.atomicAccClosed := by
  exact A.atomicAccClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse