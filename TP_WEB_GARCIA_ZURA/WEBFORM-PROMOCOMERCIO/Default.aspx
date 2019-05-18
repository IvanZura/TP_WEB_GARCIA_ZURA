<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card grey lighten-5">
                    <div class="card-content black-text">
                        <span class="card-title">Ingrese su codigo de promoción</span>
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="last_name" type="text" class="validate">
                              <label for="last_name">Codigo</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
