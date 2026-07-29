import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LcaSystem where
  carrier : Type
  topology : TopologicalSpace carrier

structure LcaAdmittedObject where
  system : LcaSystem
  functionalUnitDefined : Prop
  systemBoundaryDefined : Prop
  impactCategoriesDefined : Prop
  conclusion : impactCategoriesDefined

def LcaWitnessClosed (O : LcaAdmittedObject) : Prop :=
  O.impactCategoriesDefined

structure AdmissibleClass where
  object : LcaAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LcaWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse
