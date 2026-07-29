import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure AllocationModel where
  allocationMethod : Type u
  allocationFactors : Type v
  multiOutputProcesses : Type w
  closedLoopAllocation : Type x
  methodDefined : Prop
  factorsCalculated : Prop
  processesCovered : Prop
  loopClosureEstablished : Prop

structure AllocationModelEvidence (A : AllocationModel) where
  methodDefinedClosed : A.methodDefined
  factorsCalculatedClosed : A.factorsCalculated
  processesCoveredClosed : A.processesCovered
  loopClosureEstablishedClosed : A.loopClosureEstablished

def AllocationModelClosed (A : AllocationModel) : Prop :=
  A.methodDefined ∧ A.factorsCalculated ∧ A.processesCovered ∧ A.loopClosureEstablished

theorem allocation_model_closed_from_evidence
    (A : AllocationModel) (E : AllocationModelEvidence A) : AllocationModelClosed A := by
  exact And.intro E.methodDefinedClosed
    (And.intro E.factorsCalculatedClosed
      (And.intro E.processesCoveredClosed E.loopClosureEstablishedClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse