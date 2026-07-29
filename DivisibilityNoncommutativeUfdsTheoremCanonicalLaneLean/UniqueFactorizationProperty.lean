import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.AssociateIrreducibleFactorization

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeUFD (R : Type u) [h : NoncommutativeRing R] where
  factorizationExists : ∀ (a : R), a ≠ h.zero → ∃ (f : Factorization R a), True
  uniquenessUpToAssociates : ∀ (a : R), ∀ (f g : Factorization R a),
    (∃ (φ : List (R × ℕ) → List (R × ℕ)),
      (∀ (p : R × ℕ), p ∈ f.factors →
        let p' := (φ [p]).head? in
        (∃ (q : R × ℕ), q ∈ g.factors ∧ AssociateRelation.associate R p.1 q.1 ∧ p.2 = q.2)) ∧
      (∀ (q : R × ℕ), q ∈ g.factors →
        let q' := (φ [q]).head? in
        (∃ (p : R × ℕ), p ∈ f.factors ∧ AssociateRelation.associate R q.1 p.1 ∧ q.2 = p.2)))

def NoncommutativeUFDClosed (R : Type u) [h : NoncommutativeRing R] (U : NoncommutativeUFD R) : Prop :=
  U.factorizationExists ∧ U.uniquenessUpToAssociates

theorem noncommutative_ufd_closed_from_properties (R : Type u) [h : NoncommutativeRing R] (U : NoncommutativeUFD R)
  (h1 : U.factorizationExists) (h2 : U.uniquenessUpToAssociates) : NoncommutativeUFDClosed R U := by
  exact And.intro h1 h2

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse