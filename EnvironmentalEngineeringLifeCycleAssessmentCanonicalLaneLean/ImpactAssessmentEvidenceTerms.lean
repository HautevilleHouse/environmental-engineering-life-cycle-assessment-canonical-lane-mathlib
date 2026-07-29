import EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.ImpactAssessmentAnalyticProof

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure ImpactAssessmentEvidenceTerms {I : ImpactAssessmentPackage}
    (C : ImpactAssessmentCertificate I) where
  characterizationFactorsDefined : C.characterizationFactorsDefined
  normalizationFactorsDefined : C.normalizationFactorsDefined
  weightingFactorsDefined : C.weightingFactorsDefined
  impactAssessmentClosed : ImpactAssessmentClosed I

def ImpactAssessmentCertificate.evidenceTerms {I : ImpactAssessmentPackage}
    (C : ImpactAssessmentCertificate I) : ImpactAssessmentEvidenceTerms C :=
  {
    characterizationFactorsDefined := C.characterizationFactorsDefinedClosed
    normalizationFactorsDefined := C.normalizationFactorsDefinedClosed
    weightingFactorsDefined := C.weightingFactorsDefinedClosed
    impactAssessmentClosed := impact_assessment_closed_from_evidence I C.impactAssessmentEvidence
  }

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse
