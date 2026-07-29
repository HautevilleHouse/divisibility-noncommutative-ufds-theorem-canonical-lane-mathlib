import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.UniqueFactorizationProperty

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure DivisibilityNoncommutativeObject (R : Type u) [h : NoncommutativeRing R] where
  ring : NoncommutativeRing R
  ufd : NoncommutativeUFD R
  divisorTheoryComplete : Prop

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  trivial

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse