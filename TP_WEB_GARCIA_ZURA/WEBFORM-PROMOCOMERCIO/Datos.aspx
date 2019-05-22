<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"CodeBehind="Datos.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO.Datos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
            <div class="col s12">
                <div  class="card grey lighten-5">
                    <div class="card-content black-text">
                        <span class="card-title">Datos</span>
                        <div class="row">
                            <div class="input-field col s12">
                                <label for="txtDNI">DNI</label>
                                <asp:TextBox runat="server" CssClass="validate" ID="txtDNI"/>
                            </div>
                        </div>

                    </div>
                    <div class="card-action">
                        <asp:Button Text="text" runat="server" ID="btnEnviar" CssClass="btn" name="Enviar" />
                    </div>
                </div>
            </div>
        </div>


</asp:Content>