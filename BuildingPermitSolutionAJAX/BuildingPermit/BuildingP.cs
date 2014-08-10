namespace BuildingPermit
{
    #region

    using System;

    #endregion

    public class BuildingP
    {
        #region Constructors and Destructors

        public BuildingP(BuildingPDirty buildingPDirtyC)
        {
            if (buildingPDirtyC.PassedValidation)
            {
                if (buildingPDirtyC.PermitId != "")
                {
                    PermitId = int.Parse(buildingPDirtyC.PermitId);
                }

                ApplicantFirstName = buildingPDirtyC.ApplicantFirstName;
                ApplicantLastName = buildingPDirtyC.ApplicantLastName;
                SquareFeet = float.Parse(buildingPDirtyC.SquareFeet);
                Height = float.Parse(buildingPDirtyC.Height);
                ConstructionStartDate = DateTime.Parse(buildingPDirtyC.ConstructionStartDate);

                if (buildingPDirtyC.EstimatedCompletionDate != "")
                {
                    EstimatedCompletionDate = DateTime.Parse(buildingPDirtyC.EstimatedCompletionDate);
                }
                else
                {
                    EstimatedCompletionDate = DateTime.MaxValue;
                }

                Address = buildingPDirtyC.Address;
                City = buildingPDirtyC.City;
                Zip = buildingPDirtyC.Zip;
                RemodelOrNewConstruction = buildingPDirtyC.RemodelOrNewConstruction;
            }
        }

        #endregion

        #region Public Properties

        public string Address { get; set; }

        public string ApplicantFirstName { get; set; }

        public string ApplicantLastName { get; set; }

        public string City { get; set; }

        public DateTime ConstructionStartDate { get; set; }

        public DateTime EstimatedCompletionDate { get; set; }

        public float Height { get; set; }

        public int PermitId { get; set; }

        public string RemodelOrNewConstruction { get; set; }

        public float SquareFeet { get; set; }

        public string Zip { get; set; }

        #endregion
    }
}