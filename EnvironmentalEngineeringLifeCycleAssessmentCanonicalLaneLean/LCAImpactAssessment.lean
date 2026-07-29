import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAInventoryAnalysis

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure ImpactAssessmentPackage {A : AdmissibleClass}
    (I : InventoryAnalysisPackage A) where
  midpointIndicators : Prop
  characterizationFactors : Prop
  endpointIndicators : Prop
  normalizationFactors : Prop

structure ImpactAssessmentEvidence {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} (P : ImpactAssessmentPackage I) where
  midpointIndicatorsClosed : P.midpointIndicators
  characterizationFactorsClosed : P.characterizationFactors
  endpointIndicatorsClosed : P.endpointIndicators
  normalizationFactorsClosed : P.normalizationFactors

def ImpactAssessmentClosed {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} (P : ImpactAssessmentPackage I) : Prop :=
  P.midpointIndicators ∧ P.characterizationFactors ∧ P.endpointIndicators ∧ P.normalizationFactors

theorem impact_assessment_closed_from_evidence
    {A : AdmissibleClass} {I : InventoryAnalysisPackage A}
    (P : ImpactAssessmentPackage I) (E : ImpactAssessmentEvidence P) :
    ImpactAssessmentClosed P := by
  exact And.intro E.midpointIndicatorsClosed
    (And.intro E.characterizationFactorsClosed
      (And.intro E.endpointIndicatorsClosed E.normalizationFactorsClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse