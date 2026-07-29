import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.NoncommutativePrimeElement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure DivisibilityRelation (R : NoncommutativeDomain) where
  leftDiv : R.carrier → R.carrier → Prop
  rightDiv : R.carrier → R.carrier → Prop
  leftDivReflexive : ∀ a : R.carrier, leftDiv a a
  leftDivTransitive : ∀ a b c : R.carrier, leftDiv a b → leftDiv b c → leftDiv a c
  rightDivReflexive : ∀ a : R.carrier, rightDiv a a
  rightDivTransitive : ∀ a b c : R.carrier, rightDiv a b → rightDiv b c → rightDiv a c
  leftDivAntisymmetric : ∀ a b : R.carrier, leftDiv a b → leftDiv b a → a = b
  rightDivAntisymmetric : ∀ a b : R.carrier, rightDiv a b → rightDiv b a → a = b

structure DivisibilityEvidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) where
  leftDivClosed : ∀ a b : R.carrier, D.leftDiv a b ↔ ∃ c : R.carrier, R.mul a c = b
  rightDivClosed : ∀ a b : R.carrier, D.rightDiv a b ↔ ∃ c : R.carrier, R.mul c a = b

def DivisibilityClosed (R : NoncommutativeDomain) (D : DivisibilityRelation R) : Prop :=
  ∀ a b : R.carrier, D.leftDiv a b ↔ ∃ c : R.carrier, R.mul a c = b ∧
  D.rightDiv a b ↔ ∃ c : R.carrier, R.mul c a = b

theorem divisibility_closed_from_evidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) (E : DivisibilityEvidence R D) : DivisibilityClosed R D := by
  intro a b
  exact And.intro (E.leftDivClosed a b) (E.rightDivClosed a b)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse