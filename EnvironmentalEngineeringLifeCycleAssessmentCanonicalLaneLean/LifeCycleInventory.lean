import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LifeCycleInventoryPackage where
  foregroundSystem : Prop
  backgroundSystem : Prop
  allocationRules : Prop
  dataQuality : Prop

structure LifeCycleInventoryEvidence (L : LifeCycleInventoryPackage) where
  foregroundSystemClosed : L.foregroundSystem
  backgroundSystemClosed : L.backgroundSystem
  allocationRulesClosed : L.allocationRules
  dataQualityClosed : L.dataQuality

def LifeCycleInventoryClosed (L : LifeCycleInventoryPackage) : Prop :=
  L.foregroundSystem ∧ L.backgroundSystem ∧ L.allocationRules ∧ L.dataQuality

theorem life_cycle_inventory_closed_from_evidence (L : LifeCycleInventoryPackage)
    (E : LifeCycleInventoryEvidence L) : LifeCycleInventoryClosed L := by
  exact And.intro E.foregroundSystemClosed
    (And.intro E.backgroundSystemClosed
      (And.intro E.allocationRulesClosed E.dataQualityClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse