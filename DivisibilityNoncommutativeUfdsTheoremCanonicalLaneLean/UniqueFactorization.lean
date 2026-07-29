import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.NoncommutativeUFDSemiring

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure UniqueFactorizationPackage {P : NoncommutativeUFDSemiringPackage} where
  irreducibleFactorizations : ∀ a : P.carrier, a ≠ P.zero → (∃ (n : ℕ) (irrs : Fin n → P.carrier), (∀ i, irreducible P irrs i) ∧ a = product P irrs)
  uniquenessUpToOrderAndAssociates : ∀ a : P.carrier, a ≠ P.zero → ∀ (n m : ℕ) (irrs : Fin n → P.carrier) (jrrs : Fin m → P.carrier),
    (∀ i, irreducible P irrs i) → (∀ j, irreducible P jrrs j) → a = product P irrs → a = product P jrrs →
    n = m ∧ ∃ (σ : Fin n → Fin n), Bijection σ ∧ ∀ i, associate P (irrs i) (jrrs (σ i))

structure UniqueFactorizationEvidence {P : NoncommutativeUFDSemiringPackage} (U : UniqueFactorizationPackage P) where
  irreducibleFactorizationsClosed : U.irreducibleFactorizations
  uniquenessUpToOrderAndAssociatesClosed : U.uniquenessUpToOrderAndAssociates

def UniqueFactorizationClosed {P : NoncommutativeUFDSemiringPackage} (U : UniqueFactorizationPackage P) : Prop :=
  U.irreducibleFactorizations ∧ U.uniquenessUpToOrderAndAssociates

theorem unique_factorization_closed_from_evidence {P : NoncommutativeUFDSemiringPackage}
    (U : UniqueFactorizationPackage P) (E : UniqueFactorizationEvidence U) : UniqueFactorizationClosed U := by
  exact And.intro E.irreducibleFactorizationsClosed E.uniquenessUpToOrderAndAssociatesClosed

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse