import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.NoncommutativePrimeElement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure UfdDecompositionPackage (R : NoncommutativeDomain) where
  factors : List (PrimeElement R)
  productRepresentation : R.carrier → List R.carrier
  uniqueFactorization : ∀ a : R.carrier, ∃ (l : List (PrimeElement R)), productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l
  uniquenessUpToOrder : ∀ a : R.carrier, ∀ (l1 l2 : List (PrimeElement R)),
    productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l1 →
    productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l2 →
    List.length l1 = List.length l2 ∧ ∃ (σ : Nat → Nat), List.map (λ (i : Nat) => (l1.get? i).get) (List.range (List.length l1)) = List.map (λ (i : Nat) => (l2.get? (σ i)).get) (List.range (List.length l2))

structure UfdDecompositionEvidence (R : NoncommutativeDomain) (U : UfdDecompositionPackage R) where
  productRepresentationClosed : ∀ a : R.carrier, U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) (U.factors)
  uniqueFactorizationClosed : ∀ a : R.carrier, ∃ (l : List (PrimeElement R)), U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l
  uniquenessUpToOrderClosed : ∀ a : R.carrier, ∀ (l1 l2 : List (PrimeElement R)),
    U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l1 →
    U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l2 →
    List.length l1 = List.length l2 ∧ ∃ (σ : Nat → Nat), List.map (λ (i : Nat) => (l1.get? i).get) (List.range (List.length l1)) = List.map (λ (i : Nat) => (l2.get? (σ i)).get) (List.range (List.length l2))

def UfdDecompositionClosed (R : NoncommutativeDomain) (U : UfdDecompositionPackage R) : Prop :=
  ∀ a : R.carrier, U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) (U.factors) ∧
  ∃ (l : List (PrimeElement R)), U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l ∧
  ∀ (l1 l2 : List (PrimeElement R)),
    U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l1 →
    U.productRepresentation a = List.map (λ (p : PrimeElement R) => p.p) l2 →
    List.length l1 = List.length l2 ∧ ∃ (σ : Nat → Nat), List.map (λ (i : Nat) => (l1.get? i).get) (List.range (List.length l1)) = List.map (λ (i : Nat) => (l2.get? (σ i)).get) (List.range (List.length l2))

theorem ufd_decomposition_closed_from_evidence (R : NoncommutativeDomain) (U : UfdDecompositionPackage R) (E : UfdDecompositionEvidence R U) : UfdDecompositionClosed R U := by
  intro a
  exact And.intro (E.productRepresentationClosed a) (And.intro (E.uniqueFactorizationClosed a) (E.uniquenessUpToOrderClosed a))

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse