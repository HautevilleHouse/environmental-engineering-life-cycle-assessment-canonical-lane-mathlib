import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure NormalizationWeighting where
  normalizationFactors : Type u
  weightingFactors : Type v
  referenceRegion : Type w
  normalizationComplete : Prop
  weightingConsistent : Prop
  regionDefined : Prop

structure NormalizationWeightingEvidence (N : NormalizationWeighting) where
  normalizationCompleteClosed : N.normalizationComplete
  weightingConsistentClosed : N.weightingConsistent
  regionDefinedClosed : N.regionDefined

def NormalizationWeightingClosed (N : NormalizationWeighting) : Prop :=
  N.normalizationComplete ∧ N.weightingConsistent ∧ N.regionDefined

theorem normalization_weighting_closed_from_evidence
    (N : NormalizationWeighting) (E : NormalizationWeightingEvidence N) :
    NormalizationWeightingClosed N := by
  exact And.intro E.normalizationCompleteClosed
    (And.intro E.weightingConsistentClosed E.regionDefinedClosed)

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse