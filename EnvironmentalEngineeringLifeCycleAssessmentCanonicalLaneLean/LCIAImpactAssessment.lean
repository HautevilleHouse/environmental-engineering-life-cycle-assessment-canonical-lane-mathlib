import EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCIInventory

/-!
# Life Cycle Impact Assessment Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCIAImpactAssessmentPackage (I : LCIInventoryPackage) where
  characterizationFactorsApplied : Prop
  midpointCategoriesComputed : Prop
  endpointCategoriesComputed : Prop
  normalizationSetChosen : Prop

structure LCIAImpactAssessmentEvidence {I : LCIInventoryPackage}
    (A : LCIAImpactAssessmentPackage I) where
  characterizationFactorsAppliedClosed : A.characterizationFactorsApplied
  midpointCategoriesComputedClosed : A.midpointCategoriesComputed
  endpointCategoriesComputedClosed : A.endpointCategoriesComputed
  normalizationSetChosenClosed : A.normalizationSetChosen

def LCIAImpactAssessmentClosed {I : LCIInventoryPackage}
    (A : LCIAImpactAssessmentPackage I) : Prop :=
  A.characterizationFactorsApplied ∧ A.midpointCategoriesComputed ∧
  A.endpointCategoriesComputed ∧ A.normalizationSetChosen

theorem lcia_impact_assessment_closed_from_evidence
    {I : LCIInventoryPackage} (A : LCIAImpactAssessmentPackage I)
    (E : LCIAImpactAssessmentEvidence A) : LCIAImpactAssessmentClosed A := by
  exact And.intro E.characterizationFactorsAppliedClosed
    (And.intro E.midpointCategoriesComputedClosed
      (And.intro E.endpointCategoriesComputedClosed E.normalizationSetChosenClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse