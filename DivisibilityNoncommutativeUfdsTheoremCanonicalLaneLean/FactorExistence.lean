import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.DomainStructure

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure FactorExistencePackage (R : NoncommutativeRing) where
  existsFactor : ∀ a : R.carrier, (a ≠ R.zero) → (∃ b : R.carrier, ∃ c : R.carrier, R.multiplication b c = a ∧ (R.isUfd → True))
  atomicCondition : ∀ a : R.carrier, (a ≠ R.zero) → (a ≠ R.one) → (∃ p : R.carrier, R.multiplication p (someUnit a) = a)
  someUnit : R.carrier → R.carrier

structure FactorExistenceEvidence (R : NoncommutativeRing) (F : FactorExistencePackage R) where
  existsFactorClosed : F.existsFactor
  atomicConditionClosed : F.atomicCondition

def FactorExistenceClosed (R : NoncommutativeRing) (F : FactorExistencePackage R) : Prop :=
  F.existsFactor ∧ F.atomicCondition

theorem factor_existence_closed_from_evidence
    (R : NoncommutativeRing) (F : FactorExistencePackage R) (E : FactorExistenceEvidence R F) :
    FactorExistenceClosed R F := by
  exact And.intro E.existsFactorClosed E.atomicConditionClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse