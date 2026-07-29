import EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.GateLemmas

/-!
# Life Cycle Inventory Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCIInventoryPackage where
  unitProcessesCollected : Prop
  elementaryFlowsQuantified : Prop
  allocationPerformed : Prop
  dataQualityChecked : Prop

structure LCIInventoryEvidence (I : LCIInventoryPackage) where
  unitProcessesCollectedClosed : I.unitProcessesCollected
  elementaryFlowsQuantifiedClosed : I.elementaryFlowsQuantified
  allocationPerformedClosed : I.allocationPerformed
  dataQualityCheckedClosed : I.dataQualityChecked

def LCIInventoryClosed (I : LCIInventoryPackage) : Prop :=
  I.unitProcessesCollected ∧ I.elementaryFlowsQuantified ∧
  I.allocationPerformed ∧ I.dataQualityChecked

theorem lci_inventory_closed_from_evidence (I : LCIInventoryPackage)
    (E : LCIInventoryEvidence I) : LCIInventoryClosed I := by
  exact And.intro E.unitProcessesCollectedClosed
    (And.intro E.elementaryFlowsQuantifiedClosed
      (And.intro E.allocationPerformedClosed E.dataQualityCheckedClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse