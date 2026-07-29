import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure NormalizationReference where
  region : String
  year : Nat
  perCapita : Bool
  totalEmissions : ℝ

structure NormalizationValue where
  impactCategory : String
  normalizedResult : ℝ
  unit : String

structure NormalizationPackage where
  references : List NormalizationReference
  values : List NormalizationValue
  weights : List (String × ℝ)

structure NormalizationEvidence (N : NormalizationPackage) where
  referencesValid : ∀ r ∈ N.references, r.totalEmissions > 0
  valuesDefined : N.values.length = 4
  weightsPositive : ∀ (_, w) ∈ N.weights, w > 0

def NormalizationClosed (N : NormalizationPackage) : Prop :=
  (∀ r ∈ N.references, r.totalEmissions > 0) ∧ N.values.length = 4 ∧ (∀ (_, w) ∈ N.weights, w > 0)

theorem normalization_closed_from_evidence (N : NormalizationPackage) (E : NormalizationEvidence N) :
    NormalizationClosed N := by
  exact ⟨E.referencesValid, E.valuesDefined, E.weightsPositive⟩

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse