import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.DivisibilityTheory

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure AtomElement (R : NoncommutativeDomain) (D : DivisibilityRelation R) where
  a : R.carrier
  nonUnit : ∀ u : R.carrier, (R.mul a u = R.one → False) ∧ (R.mul u a = R.one → False)
  irreducible : ∀ b c : R.carrier, R.mul b c = a → D.leftDiv b a ∨ D.rightDiv b a
  atomProperty : ∀ b : R.carrier, D.leftDiv b a → (D.leftDiv a b) ∨ (D.rightDiv b R.one)

structure AtomIrreducibleEvidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AtomElement R D) where
  nonUnitClosed : ∀ u : R.carrier, (R.mul A.a u = R.one → False) ∧ (R.mul u A.a = R.one → False)
  irreducibleClosed : ∀ b c : R.carrier, R.mul b c = A.a → D.leftDiv b A.a ∨ D.rightDiv b A.a
  atomPropertyClosed : ∀ b : R.carrier, D.leftDiv b A.a → (D.leftDiv A.a b) ∨ (D.rightDiv b R.one)

def AtomIrreducibleClosed (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AtomElement R D) : Prop :=
  (∀ u : R.carrier, (R.mul A.a u = R.one → False) ∧ (R.mul u A.a = R.one → False)) ∧
  (∀ b c : R.carrier, R.mul b c = A.a → D.leftDiv b A.a ∨ D.rightDiv b A.a) ∧
  (∀ b : R.carrier, D.leftDiv b A.a → (D.leftDiv A.a b) ∨ (D.rightDiv b R.one))

theorem atom_irreducible_closed_from_evidence (R : NoncommutativeDomain) (D : DivisibilityRelation R) (A : AtomElement R D) (E : AtomIrreducibleEvidence R D A) : AtomIrreducibleClosed R D A := by
  exact And.intro E.nonUnitClosed (And.intro E.irreducibleClosed E.atomPropertyClosed)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse