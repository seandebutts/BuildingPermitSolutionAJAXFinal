﻿namespace DataAccess
{
    #region

    using System;
    using System.Data;
    using System.Data.SqlClient;

    using BuildingPermit;

    #endregion

    public class DataA
    {
        #region Constants

        private const string connectionStr =
            "Data Source=OWNER-PC\\SQL2012EXP;Initial Catalog=BuildingPermits;Integrated Security=True";

        #endregion

        #region Fields

        private string deleteStr = @"
DELETE FROM PERMITS WHERE PermitId = @PermitId
";

        private string insertStr = @"
INSERT INTO PERMITS (
	ApplicantFirstName
	,ApplicantLastName
	,RemodelOrNewConstruction
	,Address
	,City
	,Zip
	,SquareFeet
	,Height
	,StartDate
	,EndDate
	)
VALUES (
	@ApplicantFirstName
	,@ApplicantLastName
	,@RemodelOrNewConstruction
	,@Address
	,@City
	,@Zip
	,@SquareFeet
	,@Height
	,@StartDate
	,@EndDate
	)
            ";

        private int rowsDeleted;

        private int rowsInserted;

        private int rowsUpdated;

        private string selectStr = @"
SELECT
     PermitID
    ,ApplicantFirstName
	,ApplicantLastName
	,RemodelOrNewConstruction
	,Address
	,City
	,Zip
	,SquareFeet
	,Height
	,StartDate
	,EndDate
FROM PERMITS WITH (NOLOCK)
";

        private string updateStr = @"
UPDATE PERMITS
SET ApplicantFirstName = @ApplicantFirstName
	,ApplicantLastName = @ApplicantLastName
	,RemodelOrNewConstruction = @RemodelOrNewConstruction
	,[Address] = @Address
	,City = @City
	,Zip = @Zip
	,SquareFeet = @SquareFeet
	,Height = @Height
	,StartDate = @StartDate
	,EndDate = @EndDate
WHERE PERMITID = @PERMITID
";

        #endregion

        #region Public Methods and Operators

        public int DeleteBuildingPermits(string permitId)
        {
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(deleteStr, connection))
                {
                    command.Parameters.Add(new SqlParameter("@PermitId", SqlDbType.Int) { Value = permitId });

                    //SqlDataAdapter adapter = new SqlDataAdapter(command);
                    rowsDeleted = command.ExecuteNonQuery();

                    command.Dispose();
                }
                connection.Close();
            }

            return rowsDeleted;
        }

        public int InsertPermitData(BuildingPCollection buildingPCollection)
        {
            BuildingP buildingP = buildingPCollection.BuildingPList[0];

            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(insertStr, connection))
                {
                    command.Parameters.Add(
                        new SqlParameter("@ApplicantFirstName", SqlDbType.NVarChar)
                        {
                            Value =
                                buildingP.ApplicantFirstName
                        });

                    command.Parameters.Add(
                        new SqlParameter("@ApplicantLastName", SqlDbType.NVarChar)
                        {
                            Value = buildingP.ApplicantLastName
                        });

                    command.Parameters.Add(
                        new SqlParameter("@RemodelOrNewConstruction", SqlDbType.NVarChar)
                        {
                            Value =
                                buildingP
                                .RemodelOrNewConstruction
                        });

                    command.Parameters.Add(
                        new SqlParameter("@Address", SqlDbType.NVarChar) { Value = buildingP.Address });

                    command.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar) { Value = buildingP.City });

                    command.Parameters.Add(new SqlParameter("@Zip", SqlDbType.NVarChar) { Value = buildingP.Zip });

                    command.Parameters.Add(
                        new SqlParameter("@SquareFeet", SqlDbType.Float) { Value = buildingP.SquareFeet });

                    command.Parameters.Add(new SqlParameter("@Height", SqlDbType.Float) { Value = buildingP.Height });

                    command.Parameters.Add(
                        new SqlParameter("@StartDate", SqlDbType.DateTime) { Value = buildingP.ConstructionStartDate });

                    command.Parameters.Add(
                        new SqlParameter("@EndDate", SqlDbType.DateTime) { Value = buildingP.EstimatedCompletionDate });

                    rowsInserted = command.ExecuteNonQuery();

                    command.Dispose();
                }

                connection.Dispose();
            }

            return rowsInserted;
        }

        public DataTable SearchBuildingPermits(string firstNameWhereStr, string lastNameWhereStr)
        {
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();

                if (firstNameWhereStr != "" || lastNameWhereStr != "")
                {
                    selectStr += @"
WHERE ApplicantFirstName = @ApplicantFirstName
	AND ApplicantLastName = @ApplicantLastName
";
                }

                selectStr += " ORDER BY PermitID; ";

                using (SqlCommand command = new SqlCommand(selectStr, connection))
                {
                    if (firstNameWhereStr != "" || lastNameWhereStr != "")
                    {
                        command.Parameters.Add(
                            new SqlParameter("@ApplicantFirstName", SqlDbType.NVarChar) { Value = firstNameWhereStr });

                        command.Parameters.Add(
                            new SqlParameter("@ApplicantLastName", SqlDbType.NVarChar) { Value = lastNameWhereStr });
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);

                    command.Dispose();
                }
                connection.Close();
            }

            return dt;
        }

        public int UpdatePermitData(BuildingPCollection buildingPCollection)
        {
            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                SqlTransaction transaction = null;

                try
                {
                    connection.Open();
                    transaction = connection.BeginTransaction();

                    foreach (BuildingP buildingP in buildingPCollection.BuildingPList)
                    {
                        using (SqlCommand command = new SqlCommand(updateStr, connection, transaction))
                        {
                            command.Parameters.Add(
                                new SqlParameter("@PermitID", SqlDbType.Int) { Value = buildingP.PermitId });

                            command.Parameters.Add(
                                new SqlParameter("@ApplicantFirstName", SqlDbType.NVarChar)
                                {
                                    Value =
                                        buildingP
                                        .ApplicantFirstName
                                });

                            command.Parameters.Add(
                                new SqlParameter("@ApplicantLastName", SqlDbType.NVarChar)
                                {
                                    Value =
                                        buildingP
                                        .ApplicantLastName
                                });

                            command.Parameters.Add(
                                new SqlParameter("@RemodelOrNewConstruction", SqlDbType.NVarChar)
                                {
                                    Value =
                                        buildingP
                                        .RemodelOrNewConstruction
                                });

                            command.Parameters.Add(
                                new SqlParameter("@Address", SqlDbType.NVarChar) { Value = buildingP.Address });

                            command.Parameters.Add(
                                new SqlParameter("@City", SqlDbType.NVarChar) { Value = buildingP.City });

                            command.Parameters.Add(
                                new SqlParameter("@Zip", SqlDbType.NVarChar) { Value = buildingP.Zip });

                            command.Parameters.Add(
                                new SqlParameter("@SquareFeet", SqlDbType.Float) { Value = buildingP.SquareFeet });

                            command.Parameters.Add(
                                new SqlParameter("@Height", SqlDbType.Float) { Value = buildingP.Height });

                            command.Parameters.Add(
                                new SqlParameter("@StartDate", SqlDbType.DateTime)
                                {
                                    Value =
                                        buildingP
                                        .ConstructionStartDate
                                });

                            command.Parameters.Add(
                                new SqlParameter("@EndDate", SqlDbType.DateTime)
                                {
                                    Value =
                                        buildingP
                                        .EstimatedCompletionDate
                                });

                            rowsUpdated = command.ExecuteNonQuery();

                            command.Dispose();
                        }
                    }
                    transaction.Commit();
                }
                catch (Exception Ex)
                {
                    if (transaction != null)
                    {
                        transaction.Rollback();
                    }
                    return -1;
                }

                connection.Dispose();
            }

            return rowsUpdated;
        }

        #endregion
    }
}