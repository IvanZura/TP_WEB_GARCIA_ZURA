<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
            <div class="col s12">
                <div  class="card grey lighten-5">
                    <div class="card-content black-text">
                        <span class="card-title">Ingrese su codigo de promoción</span>
                        <div class="row">
                            <div class="input-field col s12">
                                <label for="txtVoucher">Codigo</label>
                                <asp:TextBox runat="server" CssClass="validate" ID="txtVoucher"/>
                              
                            </div>
                        </div>

                    </div>
                    <div class="card-action">
                        <asp:Button Text="text" runat="server" ID="btnEnviar" CssClass="btn" name="Enviar" OnClick="btnEnviar_Click" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
