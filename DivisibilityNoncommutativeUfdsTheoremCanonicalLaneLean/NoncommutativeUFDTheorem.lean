import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.UniqueFactorizationProperty

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

theorem noncommutative_ufd_theorem_statement (R : Type u) [h : NoncommutativeRing R] (U : NoncommutativeUFD R) :
    NoncommutativeUFDClosed R U := by
  exact And.intro U.factorizationExists U.uniquenessUpToAssociates

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse