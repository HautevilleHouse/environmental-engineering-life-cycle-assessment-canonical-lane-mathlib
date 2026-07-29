import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LCAWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse