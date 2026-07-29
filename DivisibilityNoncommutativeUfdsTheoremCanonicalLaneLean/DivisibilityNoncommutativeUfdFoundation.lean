import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeDomain (R : Type u) [Ring R] where
  noZeroDivisors : ∀ (a b : R), a * b = 0 → a = 0 ∨ b = 0
  notCommSemiring : ¬ (∀ (a b : R), a * b = b * a)

structure FactorElement (R : Type u) [Ring R] where
  element : R
  isPrime : Prop
  isIrreducible : Prop

structure Factorization (R : Type u) [Ring R] where
  factors : List (FactorElement R)
  productEquals : R → Prop
  uniquenessUpToOrderAndAssociates : Prop

structure NoncommutativeUFD (R : Type u) [Ring R] where
  domain : NoncommutativeDomain R
  factorizationExists : ∀ (a : R), a ≠ 0 → ¬ IsUnit a → ∃ (f : Factorization R), f.productEquals a
  factorizationUnique : ∀ (a : R), ∀ (f g : Factorization R), f.productEquals a → g.productEquals a → f.uniquenessUpToOrderAndAssociates = g.uniquenessUpToOrderAndAssociates
  divisorChainCondition : Prop

def NcUfdClosed (R : Type u) [Ring R] (U : NoncommutativeUFD R) : Prop :=
  U.factorizationExists ∧ U.factorizationUnique ∧ U.divisorChainCondition

theorem nc_ufd_closed_from_properties (R : Type u) [Ring R] (U : NoncommutativeUFD R) (h1 : U.factorizationExists) (h2 : U.factorizationUnique) (h3 : U.divisorChainCondition) :
  NcUfdClosed U := by
  exact And.intro h1 (And.intro h2 h3)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse