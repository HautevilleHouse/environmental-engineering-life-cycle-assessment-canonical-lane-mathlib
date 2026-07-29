import EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.ImpactAssessmentPackage

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure InventoryPackage {I : ImpactAssessmentPackage} where
  elementaryFlowsComplete : Prop
  unitProcessDataConsistent : Prop
  allocationRulesApplied : Prop

structure InventoryEvidence {I : ImpactAssessmentPackage} (Inv : InventoryPackage I) where
  elementaryFlowsCompleteClosed : Inv.elementaryFlowsComplete
  unitProcessDataConsistentClosed : Inv.unitProcessDataConsistent
  allocationRulesAppliedClosed : Inv.allocationRulesApplied

def InventoryClosed {I : ImpactAssessmentPackage} (Inv : InventoryPackage I) : Prop :=
  Inv.elementaryFlowsComplete ∧ Inv.unitProcessDataConsistent ∧ Inv.allocationRulesApplied

theorem inventory_closed_from_evidence {I : ImpactAssessmentPackage}
    (Inv : InventoryPackage I) (E : InventoryEvidence Inv) : InventoryClosed Inv := by
  exact And.intro E.elementaryFlowsCompleteClosed
    (And.intro E.unitProcessDataConsistentClosed E.allocationRulesAppliedClosed)

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse
