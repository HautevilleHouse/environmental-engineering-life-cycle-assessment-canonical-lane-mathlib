import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCAObject where
  productSystem : Type
  functionalUnit : String
  systemBoundary : String
  declaredUnit : String
  lciDataSet : Type
  lciaMethod : Type

structure LCAAdmittedObject where
  object : LCAObject
  inventoryComplete : Prop
  impactAssessmentApplied : Prop
  conclusion : inventoryComplete ∧ impactAssessmentApplied

structure AdmissibleClass where
  object : LCAAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LCAWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def LCAWitnessClosed (O : LCAAdmittedObject) : Prop :=
  O.inventoryComplete ∧ O.impactAssessmentApplied

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse