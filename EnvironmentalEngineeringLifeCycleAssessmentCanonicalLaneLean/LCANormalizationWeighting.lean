import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAImpactAssessment

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure NormalizationWeightingPackage {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I} where
  normalizationSet : Prop
  weightingFactors : Prop
  singleScore : Prop
  uncertainty : Prop

structure NormalizationWeightingEvidence {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    (P : NormalizationWeightingPackage Im) where
  normalizationSetClosed : P.normalizationSet
  weightingFactorsClosed : P.weightingFactors
  singleScoreClosed : P.singleScore
  uncertaintyClosed : P.uncertainty

def NormalizationWeightingClosed {A : AdmissibleClass}
    {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    (P : NormalizationWeightingPackage Im) : Prop :=
  P.normalizationSet ∧ P.weightingFactors ∧ P.singleScore ∧ P.uncertainty

theorem normalization_weighting_closed_from_evidence
    {A : AdmissibleClass} {I : InventoryAnalysisPackage A} {Im : ImpactAssessmentPackage I}
    (P : NormalizationWeightingPackage Im) (E : NormalizationWeightingEvidence P) :
    NormalizationWeightingClosed P := by
  exact And.intro E.normalizationSetClosed
    (And.intro E.weightingFactorsClosed
      (And.intro E.singleScoreClosed E.uncertaintyClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse