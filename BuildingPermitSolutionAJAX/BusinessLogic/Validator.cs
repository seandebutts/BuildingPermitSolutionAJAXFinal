namespace BusinessLogic
{
    #region

    using System;

    using BuildingPermit;

    #endregion

    public class Validator
    {
        #region Fields

        private bool allAreValid = true;

        private bool areSquareFeetValid = true;

        private bool isAddressValid = true;

        private bool isApplicantFirstNameValid = true;

        private bool isApplicantLastNameValid = true;

        private bool isCityValid = true;

        private bool isEstimatedEndDateValid = true;

        private bool isHeightValid = true;

        private bool isPermitIdValid = true;

        private bool isRemodelOrNewConstructionValid = true;

        private bool isStartDateValid = true;

        private bool isZipValid = true;

        #endregion

        #region Constructors and Destructors

        public Validator(BuildingPDirty buildingPDirty)
        {
            GenericValidator genericValidator = new GenericValidator();

            int permitIdInt = 0;

            if (buildingPDirty.PermitId == "")
            {
                isPermitIdValid = true;
            }
            else if (int.TryParse(buildingPDirty.PermitId, out permitIdInt) && permitIdInt > 0
                     && permitIdInt < int.MaxValue)
            {
                isPermitIdValid = true;
            }
            else
            {
                isPermitIdValid = false;
            }

            isApplicantFirstNameValid = genericValidator.MinMaxStringLengthValidation(
                1,
                true,
                40,
                true,
                buildingPDirty.ApplicantFirstName);

            isApplicantLastNameValid = genericValidator.MinMaxStringLengthValidation(
                1,
                true,
                40,
                true,
                buildingPDirty.ApplicantLastName);

            areSquareFeetValid = genericValidator.MinMaxRangeValidationFloat(
                500,
                true,
                40000,
                false,
                buildingPDirty.SquareFeet);

            isHeightValid = genericValidator.MinMaxRangeValidationFloat(10, true, 95, false, buildingPDirty.Height);

            DateTime startDate = new DateTime();
            if (DateTime.TryParse(buildingPDirty.ConstructionStartDate, out startDate))
            {
                if (startDate < DateTime.Today.Date)
                {
                    isStartDateValid = false;
                }
            }
            else
            {
                isStartDateValid = false;
            }

            if (buildingPDirty.EstimatedCompletionDate != "")
            {
                DateTime estimatedEndDate = new DateTime();
                if (DateTime.TryParse(buildingPDirty.EstimatedCompletionDate, out estimatedEndDate))
                {
                    if (!(isStartDateValid && (estimatedEndDate > startDate)))
                    {
                        isEstimatedEndDateValid = false;
                    }
                }
                else
                {
                    isEstimatedEndDateValid = false;
                }
            }

            isAddressValid = genericValidator.MinMaxStringLengthValidation(1, true, 49, true, buildingPDirty.Address);

            isCityValid = genericValidator.MinMaxStringLengthValidation(1, true, 49, true, buildingPDirty.City);

            isZipValid = genericValidator.ZipCodeRegexValidation(buildingPDirty.Zip);

            if (buildingPDirty.RemodelOrNewConstruction.ToLower() != "r"
                && buildingPDirty.RemodelOrNewConstruction.ToLower() != "n")
            {
                isZipValid = false;
            }

            if (
                !(isPermitIdValid && isApplicantFirstNameValid && isApplicantLastNameValid && areSquareFeetValid
                  && isHeightValid && isStartDateValid && isEstimatedEndDateValid && isAddressValid && isCityValid
                  && isZipValid && isRemodelOrNewConstructionValid))
            {
                allAreValid = false;
            }
        }

        #endregion

        #region Public Properties

        public bool AllAreValid
        {
            get
            {
                return this.allAreValid;
            }
            set
            {
                this.allAreValid = value;
            }
        }

        public bool IsAddressValid
        {
            get
            {
                return this.isAddressValid;
            }
            set
            {
                this.isAddressValid = value;
            }
        }

        public bool IsApplicantFirstNameValid
        {
            get
            {
                return this.isApplicantFirstNameValid;
            }
            set
            {
                this.isApplicantFirstNameValid = value;
            }
        }

        public bool IsApplicantLastNameValid
        {
            get
            {
                return this.isApplicantLastNameValid;
            }
            set
            {
                this.isApplicantLastNameValid = value;
            }
        }

        public bool IsCityValid
        {
            get
            {
                return this.isCityValid;
            }
            set
            {
                this.isCityValid = value;
            }
        }

        public bool IsEstimatedEndDateValid
        {
            get
            {
                return this.isEstimatedEndDateValid;
            }
            set
            {
                this.isEstimatedEndDateValid = value;
            }
        }

        public bool IsHeightValid
        {
            get
            {
                return this.isHeightValid;
            }
            set
            {
                this.isHeightValid = value;
            }
        }

        public bool IsRemodelOrNewConstructionValid
        {
            get
            {
                return this.isRemodelOrNewConstructionValid;
            }
            set
            {
                this.isRemodelOrNewConstructionValid = value;
            }
        }

        public bool IsSquareFeetValid
        {
            get
            {
                return this.areSquareFeetValid;
            }
            set
            {
                this.areSquareFeetValid = value;
            }
        }

        public bool IsStartDateValid
        {
            get
            {
                return this.isStartDateValid;
            }
            set
            {
                this.isStartDateValid = value;
            }
        }

        public bool IsZipValid
        {
            get
            {
                return this.isZipValid;
            }
            set
            {
                this.isZipValid = value;
            }
        }

        #endregion
    }
}