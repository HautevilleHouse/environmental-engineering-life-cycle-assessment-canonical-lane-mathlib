import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure ImpactAssessmentMethod where
  methodName : Type u
  categoryIndicators : Type v
  characterizationFactors : Type w
  normalizationSet : Type x
  weightingSet : Type y
  methodDefined : Prop
  indicatorsComplete : Prop
  factorsConsistent : Prop
  normalizationSetDefined : Prop
  weightingSetDefined : Prop

structure ImpactAssessmentMethodEvidence (I : ImpactAssessmentMethod) where
  methodDefinedClosed : I.methodDefined
  indicatorsCompleteClosed : I.indicatorsComplete
  factorsConsistentClosed : I.factorsConsistent
  normalizationSetDefinedClosed : I.normalizationSetDefined
  weightingSetDefinedClosed : I.weightingSetDefined

def ImpactAssessmentMethodClosed (I : ImpactAssessmentMethod) : Prop :=
  I.methodDefined ∧ I.indicatorsComplete ∧ I.factorsConsistent ∧ I.normalizationSetDefined ∧ I.weightingSetDefined

theorem impact_assessment_method_closed_from_evidence
    (I : ImpactAssessmentMethod) (E : ImpactAssessmentMethodEvidence I) :
    ImpactAssessmentMethodClosed I := by
  exact And.intro E.methodDefinedClosed
    (And.intro E.indicatorsCompleteClosed
      (And.intro E.factorsConsistentClosed
        (And.intro E.normalizationSetDefinedClosed E.weightingSetDefinedClosed)))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse