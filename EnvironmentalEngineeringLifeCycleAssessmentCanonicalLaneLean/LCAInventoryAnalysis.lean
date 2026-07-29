import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAAdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure InventoryAnalysisPackage (A : AdmissibleClass) where
  unitProcessFlows : Prop
  elementaryFlows : Prop
  dataQuality : Prop
  completeness : Prop

structure InventoryAnalysisEvidence {A : AdmissibleClass} (P : InventoryAnalysisPackage A) where
  unitProcessFlowsClosed : P.unitProcessFlows
  elementaryFlowsClosed : P.elementaryFlows
  dataQualityClosed : P.dataQuality
  completenessClosed : P.completeness

def InventoryAnalysisClosed {A : AdmissibleClass} (P : InventoryAnalysisPackage A) : Prop :=
  P.unitProcessFlows ∧ P.elementaryFlows ∧ P.dataQuality ∧ P.completeness

theorem inventory_analysis_closed_from_evidence
    {A : AdmissibleClass} (P : InventoryAnalysisPackage A)
    (E : InventoryAnalysisEvidence P) : InventoryAnalysisClosed P := by
  exact And.intro E.unitProcessFlowsClosed
    (And.intro E.elementaryFlowsClosed
      (And.intro E.dataQualityClosed E.completenessClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse