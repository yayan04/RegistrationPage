<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AppRegistrationPage.Registration" %>

<asp:Content ID="Registration" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary runat="server" DisplayMode="BulletList" CssClass="alert alert-danger" />

    <h2><strong><%: Title %></strong></h2>

    <style>
        .customform {
            width: 100%;
            min-width: 100%;
            display: block;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

            .customform:focus {
                border-color: #66afe9;
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
            }

            .customform[disabled],
            .customform[readonly],
            fieldset[disabled] .customform {
                cursor: not-allowed;
                background-color: #eeeeee;
            }

        .customradio input[type="radio"] {
            width: 25px;
            height: 25px;
            float: left;
        }

        .customradio label {
            width: 150px;
            display: block;
            margin-left: 40px;
            margin-top: 5px;
            line-height: 25px;
            text-align: left;
            font-style: normal;
        }

        .customradio td {
            height: 20px;
            padding: 5px;
            width: 33%;
        }
    </style>
    <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
    <script>
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
    </script>
    <script>
        $(function () {
            $("#MainContent_Register").click(function () {
                var mobile = $("#MainContent_MobileNumber").val();
                //var pattern = /[-+]?[\d\.]*,?[\d\.]+/;    //Pattern indonesian phone number
                var pattern = /^(^\+62\s?|^0)(\d{3,4}-?){2}\d{3,4}$/;    //Pattern indonesian phone number

                if (!pattern.test(mobile)) {
                    $('#MainContent_MobileNumber').popover('show');
                } else {
                    $('#MainContent_MobileNumber').popover('destroy');
                }
                
            });
        });
    </script>
    <script>
        $(function () {
            $("#MainContent_MobileNumber").keyup(function () {
                var mobile = $("#MainContent_MobileNumber").val();
                //var pattern = /[-+]?[\d\.]*,?[\d\.]+/;    //Pattern indonesian phone number
                var pattern = /^(^\+62\s?|^0)(\d{3,4}-?){2}\d{3,4}$/;    //Pattern indonesian phone number

                if (!pattern.test(mobile)) {
                    $('#MainContent_MobileNumber').popover('show');
                } else {
                    $('#MainContent_MobileNumber').popover('destroy');
                }
                
            });
        });
    </script>
    <script type="text/javascript">
        function allowOnlyNumber(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            console.log(charCode);
            if (charCode > 32 && (charCode < 48 || charCode > 57) && charCode != 43 && charCode != 45)
                return false;
            return true;
        }
    </script>

    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <asp:TextBox ID="MobileNumber" runat="server" placeholder="Mobile Number" TextMode="Phone" CssClass="customform" onkeypress="return allowOnlyNumber(event)"
            data-template='<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content" style="color:#b94a48"></div></div>'
            data-delay="100" data-trigger="hover" data-toggle="popover" data-placement="top" data-content="Please enter valid Indonesian phone number" OnTextChanged="MobileNumber_TextChanged"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="MobileNumber" ErrorMessage="The Mobile Number field is required." Display="None" />
    </div>
    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <asp:TextBox ID="FirstName" runat="server" placeholder="First Name" CssClass="customform" ToolTip="The First Name field is required."></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" ErrorMessage="The First Name field is required." Display="None" />
    </div>
    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <asp:TextBox ID="LastName" runat="server" placeholder="Last Name" CssClass="customform" ToolTip="The Last Name field is required."></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" ErrorMessage="The Last Name field is required." Display="None" />
    </div>
    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <asp:Label Text="Date of Birth" runat="server"></asp:Label>
    </div>
    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <div class="col-md-2" style="margin-left: -15px">
            <asp:DropDownList ID="MonthList" runat="server" CssClass="form-control" AutoPostBack="false">
            </asp:DropDownList>
        </div>
        <div class="col-md-2" style="margin-left: -15px">
            <asp:DropDownList ID="DateList" runat="server" CssClass="form-control" AutoPostBack="false">
            </asp:DropDownList>
        </div>
        <div class="col-md-2" style="margin-left: -15px">
            <asp:DropDownList ID="YearList" runat="server" CssClass="form-control" AutoPostBack="false">
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-12" style="margin: 15px 0px 0px 0px;">
        <div class="form-group">
            <asp:RadioButtonList ID="Gender" runat="server" RepeatLayout="Table" Width="300" CssClass="customradio" AutoPostBack="false" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="form-group" style="margin: 0px 0px 25px 0px">
        <asp:TextBox ID="Email" runat="server" placeholder="Email" TextMode="Email" CssClass="customform" ToolTip="The email field is required."></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="The email field is required." Display="None" />
    </div>
    <asp:Button ID="Register" runat="server" Text="Register" BackColor="Purple" ForeColor="White" Width="100%" CssClass="btn btn-lg" OnClick="Register_Click" />

    <br />
    <br />
    <br />
    <div id="divlogin" runat="server" style="border-color: #D3D3D3; border-style: Solid; border-width: 30px" visible="false">
        <a class="btn btn-lg" id="btnlogin" href="/Account/Login" style="background-color: purple; color: white; width: 100%">Login</a>
    </div>
</asp:Content>
