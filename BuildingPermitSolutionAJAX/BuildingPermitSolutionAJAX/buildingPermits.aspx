<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buildingPermits.aspx.cs"
    Inherits="buildingPermits" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="Styles/reset.css"/>
    <style type="text/css">
        #cancelBtn, #saveBtn
        {
            display: none;
        }

        [type="submit"]:disabled
        {
            background: none repeat scroll 0 0 #808080;
            border-width: 0;
        }

        #pageTitle
        {
            font-size: 27px;
            margin: 40px auto 80px;
            text-align: center;
            width: 450px;
        }

        input[type="submit"], #submitBtn
        {
            background-color: #0ca439;
            border-color: black;
            border-radius: 5px;
            color: white;
            font-size: 20px;
            height: 40px;
            width: 150px;
        }

        #submitBtn
        {
            display: block;
            margin: 40px auto 0;
        }

        #container
        {
            margin: 0 auto;
            width: 650px;
        }

        .inputLabel
        {
            float: left;
            width: 250px;
        }

        #insertFeedback
        {
            margin-left: 50px;
        }

        .inputFeedback
        {
            color: red;
        }

        #SubmissionForm
        {
            margin: 0 auto;
            width: 380px;
        }

        #SubmissionForm, #SearchForm
        {
            margin-top: 75px;
        }

        h2
        {
            font-size: 20px;
            margin: 0 auto 35px;
            text-align: center;
            text-decoration: underline;
            width: 380px;
        }

        #SubmissionFormDivInner input[type="text"], #SubmissionFormDivInner select
        {
            font-size: 15px;
            color: #1F1F1F;
        }

        #searchInputs, #searchFeedback
        {
            margin: 0 auto;
            width: 380px;
        }

        #searchFeedback, #insertFeedback
        {
            height: 16px;
        }

        #SubmissionFormDivInner > div, #searchInputs > div
        {
            margin-bottom: 15px;
        }

        #SubmissionFormDivInner span, #searchInputs span
        {
            display: block;
            float: left;
            width: 200px;
        }

        #SubmissionFormDivInner input[type="text"], #SubmissionFormDivInner input[type="number"], #searchInputs input[type="text"], #SubmissionFormDivInner select
        {
            border-color: black;
            border-radius: 5px;
            height: 30px;
            width: 170px;
        }

        #existingPermitDiv
        {
            margin: 30px auto 0 80px;
        }

        .existingPermitBtnsDiv > input
        {
            margin: 15px;
        }

        .existingPermitBtnsDiv
        {
            margin: 0 auto;
            width: 400px;
        }

        #existingPermitDiv
        {
            margin: 0 auto;
            margin-top: 30px;
        }

        #existingPermitTable
        {
            display: none;
        }

        #valSum
        {
            color: red;
        }

        h1, label, span, div, td
        {
            font-family: Arial, sans-serif;
        }

        th
        {
            padding-bottom: 10px;
            vertical-align: bottom;
            line-height: 133%;
        }

        input[type="checkbox"]:disabled
        {
            background: #F0F0F0;
        }

        input[type="checkbox"]:enabled
        {
            background: white;
        }

        #existingPermitDiv input
        {
            border-color: rgba(0, 0, 0, 0);
        }

        #existingPermitDiv input[type="text"]
        {
            height: 25px;
            text-align: center;
            border-color: #CFCFCF;
        }

        #existingPermitDiv input[type="checkbox"]
        {
            border-color: #cfcfcf;
            height: 14px;
            margin: 8px;
            text-align: center;
            vertical-align: middle;
            width: 14px;
        }

        #existingPermitDiv td, input[type="text"]
        {
            width: 140px;
        }

        .cbxTd
        {
            width: 40px !important;
        }
    </style>
    <style type="text/css">
                @-webkit-keyframes fadeOut {
            0%   { opacity: 0; }
            15%   { opacity: 1; }
            70%   { opacity: 1; }
            100% { opacity: 0; }
        }
        @-moz-keyframes fadeOut {
            0%   { opacity: 0; }
            15%   { opacity: 1; }
            70%   { opacity: 1; }
            100% { opacity: 0; }
        }
        @-o-keyframes fadeOut {
            0%   { opacity: 0; }
            15%   { opacity: 1; }
            70%   { opacity: 1; }
            100% { opacity: 0; }
        }
        @keyframes fadeOut {
            0%   { opacity: 0; }
            15%   { opacity: 1; }
            70%   { opacity: 1; }
            100% { opacity: 0; }
        }

        .feedbackMsg
        {
            -webkit-animation: fadeOut 3s forwards;
            -moz-animation: fadeOut 3s forwards;
            -o-animation: fadeOut 3s forwards;
            animation: fadeOut 3s forwards;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
</head>
<body>
    <div id="SubmissionFormDiv">
        <h1 id="pageTitle">
            Building Permit Application</h1>
        <form id="SubmissionForm">
        <h2>
            Application Submission</h2>
        <div id="SubmissionFormDivInner">
            <div>
                <span>
                    <label>
                        First Name</label></span><input type="text" maxlength="40" id="applicantFirstNameTbx" /></div>
            <div>
                <span>
                    <label>
                        Last Name</label></span><input type="text" maxlength="40" id="applicantLastNameTbx" /></div>
            <div>
                <span>
                    <label>
                        Square Footage</label></span><input type="number" step="1" value="500" min="500"
                            max="40000" id="plannedSquareFootage" /></div>
            <div>
                <span>
                    <label>
                        Height Ft</label></span><input type="number" value="10" step="1" id="plannedHeightInFeet"
                            min="10" max="95" /></div>
            <div>
                <span>
                    <label>
                        Start Date</label></span><input type="text" class="date" placeholder="yyyy-mm-dd"
                            id="constructionStartDate" /></div>
            <div>
                <span>
                    <label>
                        Estimated Completion</label></span><input type="text" class="date" placeholder="yyyy-mm-dd"
                            id="estimatedCompletionDate" /></div>
            <div>
                <span>
                    <label>
                        Site Address</label></span><input type="text" max="49" id="siteAddress" /></div>
            <div>
                <span>
                    <label>
                        Site City</label></span><input type="text" maxlength="49" id="siteCity" /></div>
            <div>
                <span>
                    <label>
                        Site ZIP</label></span>
                <input type="text" maxlength="10" id="siteZIP"/>
            </div>
            <div>
                <span>
                    <label>
                        Remodel or New</label></span>
                <select id="remodelOrNewConstruction">
                    <option value="r">Remodel</option>
                    <option value="n">New</option>
                </select>
            </div>
            <div id="submitFeedbackDiv">
            </div>
            <input type="submit" value="Submit" id="submitBtn" onclick=" submitNewApplication(event) "/>
        </div>
        </form>
        <form id="SearchForm">
        <h2>
            Application Search</h2>
        <div>
            <div>
                <div id="searchInputs">
                    <div>
                        <span>
                            <label>
                                First Name</label></span><input type="text" maxlength="40" id="applicantFirstNameTbxSearch" /></div>
                    <div>
                        <span>
                            <label>
                                Last Name</label></span><input type="text" maxlength="40" id="applicantLastNameTbxSearch" /></div>
                </div>
                <div class="existingPermitBtnsOuterDiv">
                    <div id="searchFeedback">
                    </div>
                    <div class="existingPermitBtnsDiv">
                        <input type="submit" value="Search" id="searchBtn" onclick=" searchForLinkedPermits(event) "/>
                        <input type="submit" value="Cancel" id="cancelBtn" onclick=" searchForLinkedPermits(event) "/>
                        <input type="submit" value="Edit" id="editBtn" disabled="disabled" onclick=" editLinkedPermits(event) "/>
                    </div>
                    <div class="existingPermitBtnsDiv">
                        <input type="submit" value="Delete" id="deleteBtn" disabled="disabled" onclick=" deleteLinkedPermits(event) "/>
                        <input type="submit" value="Save" id="saveBtn" onclick=" saveChangesToLinkedPermits(event) "/>
                    </div>
                </div>
            </div>
            <div id="existingPermitDiv">
                <table id="existingPermitTable">
                    <thead>
                        <th class="masterCbx">
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Square Footage
                        </th>
                        <th>
                            Height Ft
                        </th>
                        <th>
                            Construction Start
                        </th>
                        <th>
                            Estimated Completion
                        </th>
                        <th>
                            Site Address
                        </th>
                        <th>
                            Site City
                        </th>
                        <th>
                            Site Zip
                        </th>
                        <th>
                            Remodel or New
                        </th>
                    </thead>
                    <tbody id="existingPermitTbody" data-table-state='{"isEmpty":true, "isBeingEdited":false, "hasCheckedRow":false,"editWasClicked":false}'>
                    </tbody>
                </table>
            </div>
        </div>
        </form>
    </div>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    <script type="text/javascript">

        /////
        //GLOBAL VARIABLES
        /////

        //Submission Elements
        var applicantFirstNameTbx;
        var applicantLastNameTbx;
        var plannedBldgSqFtTbx;
        var plannedBldgHtFtTbx;
        var constructionStartDateTbx;
        var estimatedCompletionDateTbx;
        var siteAddressTbx;
        var siteCityTbx;
        var siteZIPTbx;
        var remodelOrNewConstructionDdl;

        //Search Elements
        var applicantFirstNameSearchTbx;
        var applicantLastNameSearchTbx;

        //Delete or Edit Element
        var cbxDeleteOrEdit;
        var trDeleteOrEdit;

        //Delete or Edit Permit Id Value;
        var deleteOrEditPermitIdVal;

        //Submission Element Values
        var applicantFirstNameVal;
        var applicantLastNameVal;
        var plannedBldgSqFtVal;
        var plannedBldgHtFtVal;
        var constructionStartDateVal;
        var estimatedCompletionDateVal;
        var siteAddressVal;
        var siteCityVal;
        var siteZIPVal;
        var remodelOrNewConstructionVal;
        var permitIdVal; //Search Element Values
        var applicantFirstNameSearchVal;
        var applicantLastNameSearchVal;

        //JSON for inserts for building permit applications
        var dataForInsertOrUpdate;

        //JSON for search
        var dataForSearch;

        //JSON for delete
        var dataForDelete;

        //Was data just deleted
        var wasSearchButtonJustClicked = false;

        /////
        //FUNCTIONS
        /////
        $(document).ready(function () {

            $(".date").datepicker({ dateFormat: "yy-mm-dd" });

            //Clicking "Search" button will attempt to retrieve existing building
            //permit applications from local database.
            searchForLinkedPermits = function (event) {
                event.preventDefault();

                //Instantiate input elements
                applicantFirstNameSearchTbx = $("#applicantFirstNameTbxSearch")[0];
                applicantLastNameSearchTbx = $("#applicantLastNameTbxSearch")[0];

                //Instantiate input element values
                applicantFirstNameSearchVal = $(applicantFirstNameSearchTbx).val();
                applicantLastNameSearchVal = $(applicantLastNameSearchTbx).val();

                //Build JSON for Search
                buildJSONforSearch();

                wasSearchButtonJustClicked = true;

                //Search for Permits via AJAX
                searchForPermitsViaAJAX();
                toggleButtons();
            };

            searchForLinkedPermitsAfterDeleteOrSave = function () {

                //Instantiate input elements
                applicantFirstNameSearchTbx = $("#applicantFirstNameTbxSearch")[0];
                applicantLastNameSearchTbx = $("#applicantLastNameTbxSearch")[0];

                //Instantiate input element values
                applicantFirstNameSearchVal = $(applicantFirstNameSearchTbx).val();
                applicantLastNameSearchVal = $(applicantLastNameSearchTbx).val();

                //Build JSON for Search
                buildJSONforSearch();

                wasSearchButtonJustClicked = false;

                //Search for Permits via AJAX
                searchForPermitsViaAJAX();
                toggleButtons();
            };

            cancelLinkedPermitsTable = function (event) {
                //                event.preventDefault();
            };

            editLinkedPermits = function (event) {
                event.preventDefault();

                wasSearchButtonJustClicked = false;

                $("#existingPermitTbody input:checked").each(function () {
                    var cbxChecked = $(this);
                    var permitIdVal = $(cbxChecked).data("permitid");

                    //var inputsToEnable = $("input").attr("data-permitid", permitIdVal);
                    var inputsToEnableOrDisable = $("#existingPermitTbody").find("input[type='text'][data-permitid='" + permitIdVal + "']");

                    $(inputsToEnableOrDisable).each(function () {
                        var inpt = $(this);
                        $(inpt).removeAttr("disabled");
                    });
                });
                toggleButtons();
            };

            deleteLinkedPermits = function (event) {
                event.preventDefault();

                wasSearchButtonJustClicked = false;

                cbxDeleteOrEdit = $("#existingPermitTbody input:checked")[0];
                trDeleteOrEdit = $(cbxDeleteOrEdit).closest("tr");

                deleteOrEditPermitIdVal = $(cbxDeleteOrEdit).data("permitid");

                buildJSONforDelete();

                deleteLinkedPermitsAJAX();
                toggleButtons();
            };

            buildJSONforDelete = function () {
                dataForDelete = [
                    {
                        PermitId: deleteOrEditPermitIdVal
                    }
                ];
            };

            deleteLinkedPermitsAJAX = function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "buildingPermits.aspx/DeleteLinkedBuildingPermits",
                    data: JSON.stringify({ deleteParams: dataForDelete }),
                    dataType: "json",
                    async: false,
                    success: ajaxSuccessForDelete,
                    error: ajaxErrorForDelete
                });
            };

            ajaxSuccessForDelete = function (response) {
                searchForLinkedPermitsAfterDeleteOrSave();
                if (response.d == "1") {
                    $("#searchFeedback").html("<span style='color:green;' class='feedbackMsg'>Deleted</span>");
                } else if (response.d == "serverError") {
                    $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Server error</span>");
                } else {
                    $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Deletion failed.</span>");
                }
            };

            ajaxErrorForDelete = function (response) {
                $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Error. Please try again.</span>");
            };

            saveChangesToLinkedPermits = function (event) {
                event.preventDefault();

                wasSearchButtonJustClicked = focus;

                cbxDeleteOrEdit = $("#existingPermitTbody input:checked")[0];
                trDeleteOrEdit = $(cbxDeleteOrEdit).closest("tr");

                deleteOrEditPermitIdVal = $(cbxDeleteOrEdit).data("permitid");

                //Instantiate input elements
                applicantFirstNameTbx = $(trDeleteOrEdit).find(".firstName")[0];
                applicantLastNameTbx = $(trDeleteOrEdit).find(".lastName")[0];
                plannedBldgSqFtTbx = $(trDeleteOrEdit).find(".squareFeet")[0];
                plannedBldgHtFtTbx = $(trDeleteOrEdit).find(".height")[0];
                constructionStartDateTbx = $(trDeleteOrEdit).find(".startDate")[0];
                estimatedCompletionDateTbx = $(trDeleteOrEdit).find(".endDate")[0];
                siteAddressTbx = $(trDeleteOrEdit).find(".address")[0];
                siteCityTbx = $(trDeleteOrEdit).find(".city")[0];
                siteZIPTbx = $(trDeleteOrEdit).find(".zip")[0];
                remodelOrNewConstructionDdl = $(trDeleteOrEdit).find(".remodelOrNew")[0];

                //Instantiate input element values
                applicantFirstNameVal = $(applicantFirstNameTbx).val();
                applicantLastNameVal = $(applicantLastNameTbx).val();
                plannedBldgSqFtVal = $(plannedBldgSqFtTbx).val();
                plannedBldgHtFtVal = $(plannedBldgHtFtTbx).val();
                constructionStartDateVal = $(constructionStartDateTbx).val();
                estimatedCompletionDateVal = $(estimatedCompletionDateTbx).val();
                siteAddressVal = $(siteAddressTbx).val();
                siteCityVal = $(siteCityTbx).val();
                siteZIPVal = $(siteZIPTbx).val();
                remodelOrNewConstructionVal = $(remodelOrNewConstructionDdl).val();

                buildJSONforInsertOrUpdate();

                wasSearchButtonJustClicked = false;

                updatePermitsViaAJAX();
                toggleButtons();

            };

            buildJSONforSearch = function () {
                dataForSearch = [
                    {
                        ApplicantFirstName: applicantFirstNameSearchVal,
                        ApplicantLastName: applicantLastNameSearchVal
                    }
                ];
            };

            updatePermitsViaAJAX = function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "buildingPermits.aspx/UpdateLinkedBuildingPermits",
                    data: JSON.stringify({ updateParams: dataForInsertOrUpdate }),
                    dataType: "json",
                    async: false,
                    success: ajaxSuccessForUpdate,
                    error: ajaxErrorForUpdate
                });
            };

            ajaxSuccessForUpdate = function (response) {
                searchForLinkedPermitsAfterDeleteOrSave();
                if (response.d == "1") {
                    $("#searchFeedback").html("<span style='color:green;' class='feedbackMsg'>Saved</span>");
                } else if (response.d == "serverError") {
                    $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Server error</span>");
                } else {
                    $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Save failed. Please try again.</span>");
                }
            };

            ajaxErrorForUpdate = function (response) {
                searchForLinkedPermitsAfterDeleteOrSave();
                $("#searchFeedback").html("<span style='color:red;' class='feedbackMsg'>Update failed. Please try again.</span>");
            };

            searchForPermitsViaAJAX = function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "buildingPermits.aspx/SearchLinkedBuildingPermits",
                    data: JSON.stringify({ searchParams: dataForSearch }),
                    dataType: "json",
                    async: false,
                    success: ajaxSuccessForSearch,
                    error: ajaxErrorForSearch
                });
            };

            ajaxErrorForSearch = function (response) {

            };

            //If AJAX succeeds, parse AJAX response.
            //Report Server or Database Errors
            //If records are returned, parse those records and build table rows,
            //which can be used for editing and deleting records.
            ajaxSuccessForSearch = function (response) {
                var existingPermitTbody = $("#existingPermitTbody")[0];
                $(existingPermitTbody).empty();
                if (response.d == "serverError") {
                    //Display server error message
                    $("#existingPermitTable").hide();
                    $("#existingPermitTable").html("<span style='color:red;' class='feedbackMsg'>Server Error</span>");
                } else if (response.d == "0") {
                    $("#existingPermitTable").hide();
                    $("#searchFeedback").html("<span style='color:blue;' class='feedbackMsg'>Not matches</span>");
                } else {

                    var rowsReturned = 0;

                    var existingPermitTbody = $("#existingPermitTbody");
                    //BEGIN PARSING RESPONSE
                    $.each(response.d, function (i, item) {
                        $.each(item, function (k, v) {
                            var tr = '';

                            tr += '<tr data-PermitId="' + v.PermitId + '">';

                            tr += '<td class="cbxTd"><span class="cbxSpan"><input type="checkbox" ' + ' data-PermitId="' + v.PermitId + '" /></span>';

                            tr += '<td><input type="text" class="firstName" maxlength="40" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.ApplicantFirstName + '" data-originalvalue="' + v.ApplicantFirstName + '" /></td>';
                            tr += '<td><input type="text" class="lastName" maxlength="40" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.ApplicantLastName + '" data-originalvalue="' + v.ApplicantLastName + '" /></td>';
                            tr += '<td><input type="text" class="squareFeet" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.SquareFeet + '" data-originalvalue="' + v.SquareFeet + '" /></td>';
                            tr += '<td><input type="text" class="height" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.Height + '" data-originalvalue="' + v.Height + '" /></td>';
                            tr += '<td><input class="date startDate" type="text" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + convertDate(v.ConstructionStartDate) + '" data-originalvalue="' + convertDate(v.ConstructionStartDate) + '" /></td>';
                            tr += '<td><input class="date endDate" type="text" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + convertDate(v.EstimatedCompletionDate) + '" data-originalvalue="' + convertDate(v.EstimatedCompletionDate) + '" /></td>';
                            tr += '<td><input type="text" class="address" maxlength="49" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.Address + '" data-originalvalue="' + v.Address + '" /></td>';
                            tr += '<td><input type="text" class="city" maxlength="49" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.City + '" data-originalvalue="' + v.City + '" /></td>';
                            tr += '<td><input type="text" class="zip" maxlength="10" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.Zip + '" data-originalvalue="' + v.Zip + '" /></td>';
                            tr += '<td><input type="text" class="remodelOrNew" disabled="disabled" ' + ' data-PermitId="' + v.PermitId + '" value="' + v.RemodelOrNewConstruction + '" data-originalvalue="' + v.RemodelOrNewConstruction + '" /></td>';

                            tr += '</tr>';
                            $(existingPermitTbody).append(tr);
                            //$(".date").datepicker("option", "dateFormat", "yy-mm-dd");
                            rowsReturned++;
                        });
                    });

                    setFunctionsCbxs(existingPermitTbody);
                    $(".date").datepicker({ dateFormat: "yy-mm-dd" });

                    $("#existingPermitTable").show();

                    if (wasSearchButtonJustClicked) {
                        $("#searchFeedback").html("<span style='color:green;' class='feedbackMsg'>" + rowsReturned + " Result(s)</span>");
                    }
                }

                var MoveUpPixels = 250;
                var ScrollToVertical = $("#existingPermitDiv").offset().top - MoveUpPixels;
                $('#s4-workspace').delay(700).animate({
                    scrollTop: ScrollToVertical
                }, {
                    duration: 900
                }
            );

            };

            //Checking a permit's checkbox will enable the "Edit" and "Delete" buttons.
            //If a permit's checkbox is unchecked, and there are no checked boxes,
            //then the "Edit" and "Delete" buttons will be disabled.
            setFunctionsCbxs = function (existingPermitTbody) {
                var allCurrentCbxs = $(existingPermitTbody).find("input[type='checkbox']");

                //Remove previously bound toggling events
                $(allCurrentCbxs).off("change");

                //Set toggling events for checkboxes.
                $(allCurrentCbxs).on("change", function () {
                    //Get the checkbox just clicked.
                    var clickedCbx = $(this);
                    var otherCbxs = $("#existingPermitTbody input").not(clickedCbx);
                    $(otherCbxs).each(function () {
                        var ocbx = $(this);
                        $(ocbx).removeAttr("checked");
                    });

                    var permitIdVal = $(clickedCbx).data("permitid");

                    //var inputsToEnable = $("input").attr("data-permitid", permitIdVal);
                    var inputsToEnableOrDisable = $("#existingPermitTbody").find("input[type='text'][data-permitid='" + permitIdVal + "']");

                    $(inputsToEnableOrDisable).each(function () {

                        var inptToEnableOrDisable = $(this);

                        if ($(inptToEnableOrDisable).is("disabled")) {
                            $(inptToEnableOrDisable).removeAttr("disabled");
                        } else {
                            $(inptToEnableOrDisable).attr("disabled", "disabled");
                        }

                    });

                    toggleButtons();
                });
            };

            convertDate = function (dateValue) {

                var datestring = "";

                if (dateValue != "" && dateValue != undefined) {
                    var date = new Date(dateValue);
                    // GET YYYY, MM AND DD FROM THE DATE OBJECT
                    var yyyy = date.getFullYear().toString();
                    var mm = (date.getMonth() + 1).toString();
                    var dd = date.getDate().toString();

                    // CONVERT mm AND dd INTO chars
                    var mmChars = mm.split('');
                    var ddChars = dd.split('');

                    // CONCAT THE STRINGS IN YYYY-MM-DD FORMAT
                    datestring = yyyy + '-' + (mmChars[1] ? mm : "0" + mmChars[0]) + '-' + (ddChars[1] ? dd : "0" + ddChars[0]);
                }
                return datestring;
            };

            ajaxErrorForInsert = function (response) {
                $("#existingPermitTable").hide();
                $("#existingPermitTbody").empty();
                $("#submitFeedbackDiv").html("<span style='color:red;' class='feedbackMsg'>Error. Please Try Again.</span>");
            };

            //Clicking "Submit" button will attempt to write a new building
            //permit application to local database.
            submitNewApplication = function (event) {

                event.preventDefault();
                //Instantiate input elements
                applicantFirstNameTbx = $("#applicantFirstNameTbx")[0];
                applicantLastNameTbx = $("#applicantLastNameTbx")[0];
                plannedBldgSqFtTbx = $("#plannedSquareFootage")[0];
                plannedBldgHtFtTbx = $("#plannedHeightInFeet")[0];
                constructionStartDateTbx = $("#constructionStartDate")[0];
                estimatedCompletionDateTbx = $("#estimatedCompletionDate")[0];
                siteAddressTbx = $("#siteAddress")[0];
                siteCityTbx = $("#siteCity")[0];
                siteZIPTbx = $("#siteZIP")[0];
                remodelOrNewConstructionDdl = $("#remodelOrNewConstruction")[0];

                //Instantiate input element values
                applicantFirstNameVal = $(applicantFirstNameTbx).val();
                applicantLastNameVal = $(applicantLastNameTbx).val();
                plannedBldgSqFtVal = $(plannedBldgSqFtTbx).val();
                plannedBldgHtFtVal = $(plannedBldgHtFtTbx).val();
                constructionStartDateVal = $(constructionStartDateTbx).val();
                estimatedCompletionDateVal = $(estimatedCompletionDateTbx).val();
                siteAddressVal = $(siteAddressTbx).val();
                siteCityVal = $(siteCityTbx).val();
                siteZIPVal = $(siteZIPTbx).val();
                remodelOrNewConstructionVal = $(remodelOrNewConstructionDdl).val();

                //VALIDATE INPUTS
                //Validate Here

                //Build JSON to be submitted for insert.
                buildJSONforInsertOrUpdate();

                //Make AJAX call to WebService to insert new building permit application.
                insertPermitViaAJAX();

                toggleButtons();
            };

            //Build JSON for inserting new building permit application
            buildJSONforInsertOrUpdate = function () {
                dataForInsertOrUpdate = [
                    {
                        ApplicantFirstName: applicantFirstNameVal,
                        ApplicantLastName: applicantLastNameVal,
                        SquareFeet: plannedBldgSqFtVal,
                        Height: plannedBldgHtFtVal,
                        ConstructionStartDate: constructionStartDateVal,
                        EstimatedCompletionDate: estimatedCompletionDateVal,
                        Address: siteAddressVal,
                        City: siteCityVal,
                        Zip: siteZIPVal,
                        RemodelOrNewConstruction: remodelOrNewConstructionVal,
                        PermitId: deleteOrEditPermitIdVal
                    }
                ];
            };

            //AJAX call to insert new building permit application
            insertPermitViaAJAX = function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "buildingPermits.aspx/InsertBuildingPermit",
                    data: JSON.stringify({ insertParams: dataForInsertOrUpdate }),
                    dataType: "json",
                    async: false,
                    success: ajaxSuccessForInsert,
                    error: ajaxErrorForInsert
                });
            };

            ajaxSuccessForInsert = function (response) {
                if (response.d == "1") {
                    $("#submitFeedbackDiv").html("<span style='color:green;' class='feedbackMsg'>Success!</span>");
                } else if (response.d == "serverError") {
                    $("#submitFeedbackDiv").html("<span style='color:red;' class='feedbackMsg'>Server Error</span>");
                } else if (response.d == "inputsInvalid") {
                    $("#submitFeedbackDiv").html("<span style='color:red;' class='feedbackMsg'>Input(s) Invalid</span>");
                } else {
                    $("#submitFeedbackDiv").html("<span style='color:red;' class='feedbackMsg'>Submission Failed</span>");
                }
            };

            ajaxErrorForInsert = function (response) {
                //save error alert message.
                $("#submitFeedbackDiv").innerHTML("<span style='color:red;' class='feedbackMsg'>Error: Submit again.</span>");
            };

            toggleButtons = function () {

                if ($("#existingPermitTbody input:checked").length) {
                    if ($("#existingPermitTbody input[type='text']:enabled").length) {
                        $("#editBtn").hide();
                        $("#deleteBtn").prop("disabled", false).show();
                        $("#cancelBtn").prop("disabled", false).show();
                        $("#saveBtn").prop("disabled", false).show();
                    } else {
                        $("#editBtn").prop("disabled", false).show();
                        $("#deleteBtn").prop("disabled", false).show();
                        $("#cancelBtn").hide();
                        $("#saveBtn").hide();
                    }
                } else {
                    if (!$("#existingPermitTbody input[type='text']:enabled").length) {
                        $("#editBtn").prop("disabled", true).show();
                        $("#deleteBtn").prop("disabled", true).show();
                        $("#cancelBtn").hide();
                        $("#saveBtn").hide();
                    } else {

                    }
                }
            };

        });
    </script>
</body>
</html>