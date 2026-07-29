import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean.NoncommutativeRingStructure

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure AssociateRelation (R : Type u) [h : NoncommutativeRing R] where
  associate : R → R → Prop
  reflexive : ∀ (a : R), associate a a
  symmetric : ∀ (a b : R), associate a b → associate b a
  transitive : ∀ (a b c : R), associate a b → associate b c → associate a c

structure IrreducibleElement (R : Type u) [h : NoncommutativeRing R] (a : R) where
  notUnit : ¬ (∃ (u : R), h.mul a u = h.one ∧ h.mul u a = h.one)
  divisorProperty : ∀ (b c : R), h.mul b c = a →
    (h.mul b (h.one) = b ∧ h.mul (h.one) b = b) →
    (∃ (u : R), h.mul b u = h.one ∧ h.mul u b = h.one) ∨
    (∃ (u : R), h.mul c u = h.one ∧ h.mul u c = h.one)

structure Factorization (R : Type u) [h : NoncommutativeRing R] (a : R) where
  factors : List (R × ℕ)
  productEquals : List.foldr (fun (p : R × ℕ) acc => h.mul (List.foldr (fun _ acc => h.mul p.1 acc) h.one (List.replicate p.2 ()))) a factors = h.one
  eachIrreducible : ∀ (p : R × ℕ), p ∈ factors → IrreducibleElement R p.1

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse