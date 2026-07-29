import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure SystemBoundary where
  boundaryType : Type u
  includedProcesses : Type v
  excludedProcesses : Type w
  cutOffCriteria : Type x
  boundaryDefined : Prop
  inclusionComplete : Prop
  exclusionJustified : Prop
  cutOffRulesSet : Prop

structure SystemBoundaryEvidence (S : SystemBoundary) where
  boundaryDefinedClosed : S.boundaryDefined
  inclusionCompleteClosed : S.inclusionComplete
  exclusionJustifiedClosed : S.exclusionJustified
  cutOffRulesSetClosed : S.cutOffRulesSet

def SystemBoundaryClosed (S : SystemBoundary) : Prop :=
  S.boundaryDefined ∧ S.inclusionComplete ∧ S.exclusionJustified ∧ S.cutOffRulesSet

theorem system_boundary_closed_from_evidence
    (S : SystemBoundary) (E : SystemBoundaryEvidence S) : SystemBoundaryClosed S := by
  exact And.intro E.boundaryDefinedClosed
    (And.intro E.inclusionCompleteClosed
      (And.intro E.exclusionJustifiedClosed E.cutOffRulesSetClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse