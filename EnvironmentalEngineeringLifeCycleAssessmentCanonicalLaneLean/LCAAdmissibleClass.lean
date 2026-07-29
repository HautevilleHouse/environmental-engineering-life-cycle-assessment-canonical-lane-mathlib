import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCAObject where
  productSystem : Type u
  functionalUnit : Type v
  systemBoundary : Prop
  allocationMethod : Prop
  impactCategories : List String

structure AdmissibleClass where
  object : LCAObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LCAWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def LCAWitnessClosed (O : LCAObject) : Prop :=
  O.systemBoundary ∧ O.allocationMethod

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse