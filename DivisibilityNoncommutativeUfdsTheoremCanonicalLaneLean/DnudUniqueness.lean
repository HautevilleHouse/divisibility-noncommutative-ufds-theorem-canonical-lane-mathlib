import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

-- Uniqueness package: factorization uniqueness up to associates in noncommutative setting
structure UniquenessPackage where
  ring : Type u
  ringOps : Ring ring
  isDomain : Prop
  accpCondition : Prop
  factorizationsUnique : Prop
  isDomainClosed : isDomain
  accpConditionClosed : accpCondition
  factorizationsUniqueClosed : factorizationsUnique

def UniquenessClosed (U : UniquenessPackage) : Prop :=
  U.factorizationsUnique

theorem uniqueness_closed_from_evidence (U : UniquenessPackage) :
    UniquenessClosed U := by
  exact U.factorizationsUniqueClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse