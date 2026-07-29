import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure SensitivityAnalysisPackage where
  uncertaintyQuantification : Prop
  scenarioAnalysis : Prop
  monteCarloResults : Prop

structure SensitivityAnalysisEvidence (S : SensitivityAnalysisPackage) where
  uncertaintyQuantificationClosed : S.uncertaintyQuantification
  scenarioAnalysisClosed : S.scenarioAnalysis
  monteCarloResultsClosed : S.monteCarloResults

def SensitivityAnalysisClosed (S : SensitivityAnalysisPackage) : Prop :=
  S.uncertaintyQuantification ∧ S.scenarioAnalysis ∧ S.monteCarloResults

theorem sensitivity_analysis_closed_from_evidence (S : SensitivityAnalysisPackage)
    (E : SensitivityAnalysisEvidence S) : SensitivityAnalysisClosed S := by
  exact And.intro E.uncertaintyQuantificationClosed
    (And.intro E.scenarioAnalysisClosed E.monteCarloResultsClosed)

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse