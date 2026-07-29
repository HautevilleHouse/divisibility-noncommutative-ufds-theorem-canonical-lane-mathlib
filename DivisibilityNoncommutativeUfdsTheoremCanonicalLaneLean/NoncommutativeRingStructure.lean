import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeRing (R : Type u) where
  zero : R
  one : R
  add : R → R → R
  mul : R → R → R
  addAssoc : ∀ (a b c : R), add (add a b) c = add a (add b c)
  addComm : ∀ (a b : R), add a b = add b a
  zeroAdd : ∀ (a : R), add zero a = a
  addZero : ∀ (a : R), add a zero = a
  addLeftNeg : ∀ (a : R), ∃ b, add a b = zero
  mulAssoc : ∀ (a b c : R), mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ (a : R), mul a one = a
  oneMul : ∀ (a : R), mul one a = a
  leftDistrib : ∀ (a b c : R), mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ (a b c : R), mul (add a b) c = add (mul a c) (mul b c)
  noncommutative : ∀ (a b : R), mul a b = mul b a → a = b → mul a b = mul a b

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse