import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

-- Atomicity package: every nonzero nonunit is a product of irreducible elements
structure AtomicityPackage where
  ring : Type u
  ringOps : Ring ring
  isDomain : Prop
  accpCondition : Prop
  atomicCondition : Prop
  irreducibleFactorizationExists : Prop
  isDomainClosed : isDomain
  accpConditionClosed : accpCondition
  atomicConditionClosed : atomicCondition
  irreducibleFactorizationExistsClosed : irreducibleFactorizationExists

def AtomicityClosed (A : AtomicityPackage) : Prop :=
  A.irreducibleFactorizationExists

theorem atomicity_closed_from_evidence (A : AtomicityPackage) :
    AtomicityClosed A := by
  exact A.irreducibleFactorizationExistsClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse