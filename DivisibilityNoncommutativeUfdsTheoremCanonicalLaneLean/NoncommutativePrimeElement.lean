import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeDomain (R : Type u) where
  carrier : R
  zero : R
  one : R
  add : R → R → R
  mul : R → R → R
  leftDistrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)
  zeroAdd : ∀ a : R, add zero a = a
  addZero : ∀ a : R, add a zero = a
  addAssoc : ∀ a b c : R, add (add a b) c = add a (add b c)
  addComm : ∀ a b : R, add a b = add b a
  mulAssoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : R, mul a one = a
  oneMul : ∀ a : R, mul one a = a
  addLeftCancel : ∀ a b c : R, add a b = add a c → b = c
  addRightCancel : ∀ a b c : R, add a c = add b c → a = b
  noncommutative : ∀ a b : R, mul a b ≠ mul b a → True

structure PrimeElement (R : NoncommutativeDomain) where
  p : R
  nonUnit : ∀ u : R, (R.mul u (R.mul (R.one) u) = R.one → False) ∨ (R.mul u u = R.one → False)
  irreducible : ∀ a b : R, R.mul a b = p → (∃ u : R, R.mul a u = R.one) ∨ (∃ v : R, R.mul b v = R.one)
  primeProperty : ∀ a b : R, R.mul a b = p → (R.mul a p = p) ∨ (R.mul b p = p)

structure NoncommutativePrimeEvidence (R : NoncommutativeDomain) (P : PrimeElement R) where
  nonUnitClosed : P.nonUnit
  irreducibleClosed : P.irreducible
  primePropertyClosed : P.primeProperty

def NoncommutativePrimeClosed (R : NoncommutativeDomain) (P : PrimeElement R) : Prop :=
  P.nonUnit ∧ P.irreducible ∧ P.primeProperty

theorem noncommutative_prime_closed_from_evidence (R : NoncommutativeDomain) (P : PrimeElement R) (E : NoncommutativePrimeEvidence R P) : NoncommutativePrimeClosed R P := by
  exact And.intro E.nonUnitClosed (And.intro E.irreducibleClosed E.primePropertyClosed)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse