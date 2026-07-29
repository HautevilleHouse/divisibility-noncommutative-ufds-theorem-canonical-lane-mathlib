import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean

structure NoncommutativeUfdObject where
  ring : Type u
  ringOps : Ring ring
  isDomain : Prop
  accp : Prop
  irreducibleFactorizationsExist : Prop
  factorizationsUniqueUpToAssociates : Prop
  conclusion : factorizationsUniqueUpToAssociates

def DnudWitnessClosed (O : NoncommutativeUfdObject) : Prop :=
  O.factorizationsUniqueUpToAssociates

structure AdmissibleClass where
  object : NoncommutativeUfdObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DnudWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisibilityNoncommutativeUfdsTheoremCanonicalLaneLean
end HautevilleHouse