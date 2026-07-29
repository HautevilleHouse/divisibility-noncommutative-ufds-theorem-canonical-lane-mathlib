import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.UniqueFactorization

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

def ConstrainedUFDClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ufd_endgame (A : AdmissibleClass) : ConstrainedUFDClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse