import EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.InventoryPackage

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure ImpactAssessmentCertificate (I : ImpactAssessmentPackage) where
  characterizationFactorsDefined : Prop
  normalizationFactorsDefined : Prop
  weightingFactorsDefined : Prop
  characterizationFactorsDefinedClosed : characterizationFactorsDefined
  normalizationFactorsDefinedClosed : normalizationFactorsDefined
  weightingFactorsDefinedClosed : weightingFactorsDefined
  impactAssessmentEvidence : ImpactAssessmentEvidence I

def ImpactAssessmentCertificateClosed {I : ImpactAssessmentPackage}
    (C : ImpactAssessmentCertificate I) : Prop :=
  C.characterizationFactorsDefined ∧ C.normalizationFactorsDefined ∧ C.weightingFactorsDefined ∧
  ImpactAssessmentClosed I

theorem impact_assessment_certificate_closed {I : ImpactAssessmentPackage}
    (C : ImpactAssessmentCertificate I) : ImpactAssessmentCertificateClosed C := by
  exact And.intro C.characterizationFactorsDefinedClosed
    (And.intro C.normalizationFactorsDefinedClosed
      (And.intro C.weightingFactorsDefinedClosed
        (impact_assessment_closed_from_evidence I C.impactAssessmentEvidence)))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse
