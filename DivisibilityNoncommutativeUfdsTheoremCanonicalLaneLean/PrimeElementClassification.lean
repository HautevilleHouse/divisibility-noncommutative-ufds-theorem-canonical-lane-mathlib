import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure PrimeElement (R : Type u) [Ring R] (p : R) where
  notUnit : ¬ IsUnit p
  dividesProduct : ∀ (a b : R), p ∣ a * b → p ∣ a ∨ p ∣ b

structure IrreducibleElement (R : Type u) [Ring R] (p : R) where
  notUnit : ¬ IsUnit p
  noNonTrivialFactors : ∀ (a b : R), p = a * b → IsUnit a ∨ IsUnit b

structure PrimeClassification (R : Type u) [Ring R] where
  primesAreIrreducible : ∀ (p : R), PrimeElement R p → IrreducibleElement R p
  irreduciblesArePrime : ∀ (p : R), IrreducibleElement R p → PrimeElement R p
  classificationClosed : primesAreIrreducible ∧ irreduciblesArePrime

theorem classification_closed_from_evidence (R : Type u) [Ring R] (C : PrimeClassification R) (h1 : C.primesAreIrreducible) (h2 : C.irreduciblesArePrime) : C.classificationClosed := by
  exact And.intro h1 h2

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse