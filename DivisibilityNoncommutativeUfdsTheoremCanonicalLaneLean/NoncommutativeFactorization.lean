import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure FactorizationPair (R : Type u) [Ring R] (a : R) where
  factors : List R
  productCondition : a = factors.prod
  irreducibleCondition : ∀ f ∈ factors, IrreducibleElement R f

structure FactorizationExistence (R : Type u) [Ring R] where
  existsFactorization : ∀ (a : R), a ≠ 0 → ¬ IsUnit a → ∃ (fp : FactorizationPair R a), True

structure FactorizationUniqueness (R : Type u) [Ring R] where
  uniqueFactorization : ∀ (a : R), ∀ (fp1 fp2 : FactorizationPair R a), (List.length fp1.factors = List.length fp2.factors) ∧
    (∀ f ∈ fp1.factors, ∃ g ∈ fp2.factors, Associated R f g) ∧ (∀ g ∈ fp2.factors, ∃ f ∈ fp1.factors, Associated R g f)

structure NoncommutativeFactorizationPackage (R : Type u) [Ring R] where
  existence : FactorizationExistence R
  uniqueness : FactorizationUniqueness R
  closure : Prop := existence.existsFactorization ∧ uniqueness.uniqueFactorization

theorem factorization_closed_from_evidence (R : Type u) [Ring R] (P : NoncommutativeFactorizationPackage R) (hE : P.existence.existsFactorization) (hU : P.uniqueness.uniqueFactorization) : P.closure := by
  exact And.intro hE hU

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse