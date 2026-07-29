import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAAdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAInventoryAnalysis
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAImpactAssessment
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCANormalizationWeighting
import HautevilleHouse.EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean.LCAInterpretation

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LCAWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.systemBoundary ∧ A.object.allocationMethod

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedLCAFeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lca_endgame (A : AdmissibleClass) :
    ConstrainedLCAFeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem final_lca_closed (A : AdmissibleClass) : ConstrainedLCAFeClosure A :=
  constrained_lca_endgame A

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse