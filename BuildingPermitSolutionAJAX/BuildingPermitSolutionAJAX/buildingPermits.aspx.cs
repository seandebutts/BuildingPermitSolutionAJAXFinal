#region

using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using System.Web.UI;

using BuildingPermit;

using BusinessLogic;

using DataAccess;

#endregion

public partial class buildingPermits : Page
{
    //////

    #region Public Methods and Operators

    [WebMethod(EnableSession = true)]
    public static object DeleteLinkedBuildingPermits(List<BuildingPDirty> deleteParams)
    {
        string permitId = deleteParams[0].PermitId;
        try
        {
            DataA dataA = new DataA();
            int rowsDeleted = dataA.DeleteBuildingPermits(permitId);

            return rowsDeleted;
        }
        catch (Exception)
        {
            return "serverError";
        }
    }

    /// WebMethods (and static functions and classes used by them)
    //////
    [WebMethod(EnableSession = true)]
    public static object InsertBuildingPermit(List<BuildingPDirty> insertParams)
    {
        try
        {
            int rowsInserted = 0;

            Validator validator = new Validator(insertParams[0]);

            if (validator.AllAreValid)
            {
                BuildingPDirty buildingPDirty = insertParams[0];
                buildingPDirty.PassedValidation = true;

                BuildingP buildingP = new BuildingP(insertParams[0]);
                BuildingPCollection buildingPCollection = new BuildingPCollection();
                buildingPCollection.BuildingPList.Add(buildingP);

                DataA dataA = new DataA();
                rowsInserted = dataA.InsertPermitData(buildingPCollection);
            }
            else
            {
                return "inputsInvalid";
            }

            return rowsInserted;
        }
        catch (Exception)
        {
            return "serverError";
        }
    }

    [WebMethod(EnableSession = true)]
    public static object SearchLinkedBuildingPermits(List<BuildingPDirty> searchParams)
    {
        string firstName = searchParams[0].ApplicantFirstName;
        string lastName = searchParams[0].ApplicantLastName;

        try
        {
            //BuildingPCollection linkedBuildingPermitsCollection = new BuildingPCollection();
            BuildingPDirtyCollection linkedBuildingPermitsCollection = new BuildingPDirtyCollection();

            if (firstName.Length < 41 && lastName.Length < 41)
            {
                DataA dataA = new DataA();
                DataTable linkedBuildingPermits = dataA.SearchBuildingPermits(firstName, lastName);

                if (linkedBuildingPermits.Rows.Count > 0)
                {
                    foreach (DataRow r in linkedBuildingPermits.Rows)
                    {
                        BuildingPDirty buildingPDirty = new BuildingPDirty();
                        buildingPDirty.ApplicantFirstName = r["ApplicantFirstName"].ToString();
                        buildingPDirty.ApplicantLastName = r["ApplicantLastName"].ToString();
                        buildingPDirty.SquareFeet = r["SquareFeet"].ToString();
                        buildingPDirty.Height = r["Height"].ToString();
                        buildingPDirty.ConstructionStartDate = r["StartDate"].ToString();
                        if (r["EndDate"].ToString() == DateTime.MaxValue.ToString())
                        {
                            buildingPDirty.EstimatedCompletionDate = "";
                        }
                        else
                        {
                            //DateTime endDateLong = DateTime.Parse(r["EndDate"].ToString());
                            buildingPDirty.EstimatedCompletionDate = r["EndDate"].ToString();
                        }
                        buildingPDirty.Address = r["Address"].ToString();
                        buildingPDirty.City = r["City"].ToString();
                        buildingPDirty.Zip = r["Zip"].ToString();
                        buildingPDirty.RemodelOrNewConstruction = r["RemodelOrNewConstruction"].ToString();
                        buildingPDirty.PermitId = r["PermitID"].ToString();
                        //buildingPDirty.PassedValidation = true;
                        //BuildingP buildingP = new BuildingP(buildingPDirty);
                        linkedBuildingPermitsCollection.BuildingPDirtyList.Add(buildingPDirty);
                    }
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return "firstNameOrLastNameTooLong";
            }

            return linkedBuildingPermitsCollection;
        }
        catch (Exception)
        {
            return "serverError";
        }
    }

    [WebMethod(EnableSession = true)]
    public static object UpdateLinkedBuildingPermits(List<BuildingPDirty> updateParams)
    {
        try
        {
            int rowsInserted = 0;

            Validator validator = new Validator(updateParams[0]);

            if (validator.AllAreValid)
            {
                BuildingPDirty buildingPDirty = updateParams[0];
                buildingPDirty.PassedValidation = true;

                BuildingP buildingP = new BuildingP(updateParams[0]);
                BuildingPCollection buildingPCollection = new BuildingPCollection();
                buildingPCollection.BuildingPList.Add(buildingP);

                DataA dataA = new DataA();
                rowsInserted = dataA.UpdatePermitData(buildingPCollection);
            }
            else
            {
                return "inputsInvalid";
            }

            return rowsInserted;
        }
        catch (Exception)
        {
            return "serverError";
        }
    }

    #endregion

    #region Methods

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    #endregion
}