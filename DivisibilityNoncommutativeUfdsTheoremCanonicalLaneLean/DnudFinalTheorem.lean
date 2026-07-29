import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

def ConstrainedDnudClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dnud_endgame (A : AdmissibleClass) :
    ConstrainedDnudClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse