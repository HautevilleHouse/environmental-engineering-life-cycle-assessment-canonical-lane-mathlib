import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCIModel where
  flowQuantities : Type
  elementaryFlows : Type
  productFlows : Type
  wasteFlows : Type
  allocationRules : Prop
  completeness : Prop

structure LCIModelEvidence (L : LCIModel) where
  allocationRulesClosed : L.allocationRules
  completenessClosed : L.completeness

def LCIModelClosed (L : LCIModel) : Prop :=
  L.allocationRules ∧ L.completeness

theorem lci_model_closed_from_evidence (L : LCIModel) (E : LCIModelEvidence L) :
    LCIModelClosed L := by
  exact And.intro E.allocationRulesClosed E.completenessClosed

structure LCIACharacterization where
  midPointCategories : Type
  endpointCategories : Type
  characterizationFactors : Type
  normalizationSet : Type
  weightingSet : Type

structure LCIACharacterizationEvidence (C : LCIACharacterization) where
  categoryConsistency : C.midPointCategories ≠ Empty
  factorValidity : C.endpointCategories ≠ Empty
  normalizationAvailable : C.characterizationFactors ≠ Empty
  weightingAvailable : Prop

def LCIACharacterizationClosed (C : LCIACharacterization) : Prop :=
  C.midPointCategories ≠ Empty ∧ C.endpointCategories ≠ Empty ∧ C.characterizationFactors ≠ Empty

theorem lcia_characterization_closed (C : LCIACharacterization) (E : LCIACharacterizationEvidence C) :
    LCIACharacterizationClosed C := by
  refine ⟨E.categoryConsistency, E.factorValidity, E.normalizationAvailable⟩

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse