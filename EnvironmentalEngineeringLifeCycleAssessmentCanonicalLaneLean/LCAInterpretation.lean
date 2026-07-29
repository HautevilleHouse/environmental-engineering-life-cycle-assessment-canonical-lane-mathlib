import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCANormalizationWeighting

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure InterpretationPackage {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    {N : NormalizationWeightingPackage Im} where
  hotspotAnalysis : Prop
  sensitivityAnalysis : Prop
  contributionAnalysis : Prop
  consistencyCheck : Prop

structure InterpretationEvidence {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    {N : NormalizationWeightingPackage Im}
    (P : InterpretationPackage N) where
  hotspotAnalysisClosed : P.hotspotAnalysis
  sensitivityAnalysisClosed : P.sensitivityAnalysis
  contributionAnalysisClosed : P.contributionAnalysis
  consistencyCheckClosed : P.consistencyCheck

def InterpretationClosed {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    {N : NormalizationWeightingPackage Im}
    (P : InterpretationPackage N) : Prop :=
  P.hotspotAnalysis ∧ P.sensitivityAnalysis ∧ P.contributionAnalysis ∧ P.consistencyCheck

theorem interpretation_closed_from_evidence
    {A : AdmissibleClass} {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    {N : NormalizationWeightingPackage Im}
    (P : InterpretationPackage N) (E : InterpretationEvidence P) :
    InterpretationClosed P := by
  exact And.intro E.hotspotAnalysisClosed
    (And.intro E.sensitivityAnalysisClosed
      (And.intro E.contributionAnalysisClosed E.consistencyCheckClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse