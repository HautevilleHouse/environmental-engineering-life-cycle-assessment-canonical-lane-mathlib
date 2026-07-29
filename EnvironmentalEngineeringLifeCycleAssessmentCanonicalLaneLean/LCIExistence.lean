import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean

structure LCIExistence where
  inventoryDatabase : Type u
  unitProcesses : Type v
  elementaryFlows : Type w
  productSystems : Type x
  databaseComplete : Prop
  unitProcessesDefined : Prop
  elementaryFlowsSpecified : Prop
  productSystemsModeled : Prop

structure LCIExistenceEvidence (L : LCIExistence) where
  databaseCompleteClosed : L.databaseComplete
  unitProcessesDefinedClosed : L.unitProcessesDefined
  elementaryFlowsSpecifiedClosed : L.elementaryFlowsSpecified
  productSystemsModeledClosed : L.productSystemsModeled

def LCIExistenceClosed (L : LCIExistence) : Prop :=
  L.databaseComplete ∧ L.unitProcessesDefined ∧ L.elementaryFlowsSpecified ∧ L.productSystemsModeled

theorem lci_existence_closed_from_evidence
    (L : LCIExistence) (E : LCIExistenceEvidence L) : LCIExistenceClosed L := by
  exact And.intro E.databaseCompleteClosed
    (And.intro E.unitProcessesDefinedClosed
      (And.intro E.elementaryFlowsSpecifiedClosed E.productSystemsModeledClosed))

end EnvironmentalEngineeringLifeCycleAssessmentCanonicalLaneLean
end HautevilleHouse