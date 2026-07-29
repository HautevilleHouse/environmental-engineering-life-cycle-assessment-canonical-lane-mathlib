import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure AllocationMethod where
  type : String
  physicalCausality : Bool
  economicValue : Bool
  systemExpansion : Bool
  allocationFactor : ℝ

structure AllocationEvidence (A : AllocationMethod) where
  methodValid : A.allocationFactor > 0
  consistency : Prop

def AllocationClosed (A : AllocationMethod) : Prop :=
  A.allocationFactor > 0 ∧ A.consistency

theorem allocation_closed_from_evidence (A : AllocationMethod) (E : AllocationEvidence A) :
    AllocationClosed A := by
  exact ⟨E.methodValid, E.consistency⟩

lemma physical_allocation_consistent : AllocationClosed { type := "physical", physicalCausality := true, economicValue := false, systemExpansion := false, allocationFactor := 0.5 } := by
  refine ⟨by norm_num, ?_⟩
  exact True.intro

lemma economic_allocation_consistent : AllocationClosed { type := "economic", physicalCausality := false, economicValue := true, systemExpansion := false, allocationFactor := 0.3 } := by
  refine ⟨by norm_num, ?_⟩
  exact True.intro

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse