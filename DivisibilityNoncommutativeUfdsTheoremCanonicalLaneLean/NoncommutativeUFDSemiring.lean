import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeUFDSemiringPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b : carrier, addition a b = addition b a
  addZero : ∀ a : carrier, addition a zero = a
  zeroAdd : ∀ a : carrier, addition zero a = a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  mulOne : ∀ a : carrier, multiplication a one = a
  oneMul : ∀ a : carrier, multiplication one a = a
  mulAddDistribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  mulAddDistribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  zeroNotOne : zero ≠ one
  noZeroDivisors : ∀ a b : carrier, multiplication a b = zero → a = zero ∨ b = zero

structure NoncommutativeUFDSemiringEvidence (P : NoncommutativeUFDSemiringPackage) where
  addAssocClosed : P.addAssoc
  addCommClosed : P.addComm
  addZeroClosed : P.addZero
  zeroAddClosed : P.zeroAdd
  mulAssocClosed : P.mulAssoc
  mulOneClosed : P.mulOne
  oneMulClosed : P.oneMul
  mulAddDistribLeftClosed : P.mulAddDistribLeft
  mulAddDistribRightClosed : P.mulAddDistribRight
  zeroNotOneClosed : P.zeroNotOne
  noZeroDivisorsClosed : P.noZeroDivisors

def NoncommutativeUFDSemiringClosed (P : NoncommutativeUFDSemiringPackage) : Prop :=
  P.addAssoc ∧ P.addComm ∧ P.addZero ∧ P.zeroAdd ∧ P.mulAssoc ∧ P.mulOne ∧ P.oneMul ∧
  P.mulAddDistribLeft ∧ P.mulAddDistribRight ∧ P.zeroNotOne ∧ P.noZeroDivisors

theorem noncommutative_ufd_semiring_closed_from_evidence (P : NoncommutativeUFDSemiringPackage)
    (E : NoncommutativeUFDSemiringEvidence P) : NoncommutativeUFDSemiringClosed P := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.addZeroClosed
    (And.intro E.zeroAddClosed (And.intro E.mulAssocClosed (And.intro E.mulOneClosed
      (And.intro E.oneMulClosed (And.intro E.mulAddDistribLeftClosed (And.intro E.mulAddDistribRightClosed
        (And.intro E.zeroNotOneClosed E.noZeroDivisorsClosed)))))))))

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse