namespace BuildingPermit
{
    public class BuildingPDirty
    {
        #region Fields

        private string permitId = "";

        #endregion

        #region Constructors and Destructors

        public BuildingPDirty()
        {
            PassedValidation = false;
        }

        //Does not set permitIdStr
        public BuildingPDirty(
            string applicantFirstNameC,
            string applicantLastNameC,
            string plannedBldgSqFtC,
            string plannedBldgHtFtC,
            string constructionStartDateC,
            string estimatedCompletionDateC,
            string siteAddressC,
            string siteCityC,
            string siteZipC,
            string remodelOrNewConstructionC)
        {
            PassedValidation = false;
            ApplicantFirstName = applicantFirstNameC;
            ApplicantLastName = applicantLastNameC;
            SquareFeet = plannedBldgSqFtC;
            Height = plannedBldgHtFtC;
            ConstructionStartDate = constructionStartDateC;
            EstimatedCompletionDate = estimatedCompletionDateC;
            Address = siteAddressC;
            City = siteCityC;
            Zip = siteZipC;
            RemodelOrNewConstruction = remodelOrNewConstructionC;
        }

        //Sets permitIdStr
        public BuildingPDirty(
            string applicantFirstNameC,
            string applicantLastNameC,
            string plannedBldgSqFtC,
            string plannedBldgHtFtC,
            string constructionStartDateC,
            string estimatedCompletionDateC,
            string siteAddressC,
            string siteCityC,
            string siteZipC,
            string remodelOrNewConstructionC,
            string permitIdStrC)
        {
            PassedValidation = false;
            ApplicantFirstName = applicantFirstNameC;
            ApplicantLastName = applicantLastNameC;
            SquareFeet = plannedBldgSqFtC;
            Height = plannedBldgHtFtC;
            ConstructionStartDate = constructionStartDateC;
            EstimatedCompletionDate = estimatedCompletionDateC;
            Address = siteAddressC;
            City = siteCityC;
            Zip = siteZipC;
            RemodelOrNewConstruction = remodelOrNewConstructionC;
            PermitId = permitIdStrC;
        }

        #endregion

        #region Public Properties

        public string Address { get; set; }

        public string ApplicantFirstName { get; set; }

        public string ApplicantLastName { get; set; }

        public string City { get; set; }

        public string ConstructionStartDate { get; set; }

        public string EstimatedCompletionDate { get; set; }

        public string Height { get; set; }

        public bool PassedValidation { get; set; }

        public string PermitId
        {
            get
            {
                return permitId;
            }
            set
            {
                permitId = value;
            }
        }

        public string RemodelOrNewConstruction { get; set; }

        public string SquareFeet { get; set; }

        public string Zip { get; set; }

        #endregion
    }
}