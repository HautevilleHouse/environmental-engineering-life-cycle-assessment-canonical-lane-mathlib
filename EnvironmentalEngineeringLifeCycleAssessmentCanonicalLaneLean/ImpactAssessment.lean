import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure ImpactAssessmentPackage where
  impactCategories : Prop
  characterizationFactors : Prop
  normalization : Prop
  weighting : Prop

structure ImpactAssessmentEvidence (I : ImpactAssessmentPackage) where
  impactCategoriesClosed : I.impactCategories
  characterizationFactorsClosed : I.characterizationFactors
  normalizationClosed : I.normalization
  weightingClosed : I.weighting

def ImpactAssessmentClosed (I : ImpactAssessmentPackage) : Prop :=
  I.impactCategories ∧ I.characterizationFactors ∧ I.normalization ∧ I.weighting

theorem impact_assessment_closed_from_evidence (I : ImpactAssessmentPackage)
    (E : ImpactAssessmentEvidence I) : ImpactAssessmentClosed I := by
  exact And.intro E.impactCategoriesClosed
    (And.intro E.characterizationFactorsClosed
      (And.intro E.normalizationClosed E.weightingClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse