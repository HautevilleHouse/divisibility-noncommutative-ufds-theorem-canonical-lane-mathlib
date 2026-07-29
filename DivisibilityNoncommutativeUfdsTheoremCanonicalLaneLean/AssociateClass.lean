import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.DivisibilityTheory

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure AssociateClass (R : NoncommutativeDomain) (D : DivisibilityRelation R) where
  a : R.carrier
  associates : Set (R.carrier)
  associateCondition : ∀ b : R.carrier, b ∈ associates ↔ D.leftDiv a b ∧ D.rightDiv a b
  unitFactor : ∃ u : R.carrier, R.mul a u = a ∧ D.leftDiv u a ∧ D.rightDiv u a

structure AssociateClassEvidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AssociateClass R D) where
  associateConditionClosed : ∀ b : R.carrier, b ∈ A.associates ↔ D.leftDiv A.a b ∧ D.rightDiv A.a b
  unitFactorClosed : A.unitFactor

def AssociateClassClosed (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AssociateClass R D) : Prop :=
  (∀ b : R.carrier, b ∈ A.associates ↔ D.leftDiv A.a b ∧ D.rightDiv A.a b) ∧ A.unitFactor

theorem associate_class_closed_from_evidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AssociateClass R D) (E : AssociateClassEvidence R D A) : AssociateClassClosed R D A := by
  exact And.intro E.associateConditionClosed E.unitFactorClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse