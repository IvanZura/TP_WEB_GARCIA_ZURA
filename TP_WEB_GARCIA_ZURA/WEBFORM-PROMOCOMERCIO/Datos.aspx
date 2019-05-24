<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO.Datos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col s12 m12">
            <div class="card grey lighten-5">
                <div class="black-text">
                    <div class="card-title white lighten-5" style="padding: 2px">
                        <h4 class="center-align">Ingrese sus datos</h4>
                    </div>
                    <div class="card-content">
                        <div class="row">
                            <h6>Una vez ingresado su DNI, presione ENTER para validarlo.</h6>
                            <div class="input-field col s6">

                                <asp:TextBox runat="server" ID="DNI" CssClass="validate" autofocus="true"/>
                                <label for="DNI">DNI</label>
                            </div>
                        </div>

                        <div class="row hide" id="datos">
                            <div class="divider"></div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="validate" required="true"/>
                                <label for="nombre">Nombre</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" ID="txtApellido" CssClass="validate" required="true"/>
                                <label for="apellido">Apellido</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" ID="txtDireccion" CssClass="validate" required="true"/>
                                <label for="direccion">Direccion</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" ID="txtCiudad" CssClass="validate" required="true"/>
                                <label for="ciudad">Ciudad</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" ID="txtCP" CssClass="validate" required="true"/>
                                <label for="CP">Codigo Postal</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox runat="server" type="email" ID="txtEmail" CssClass="validate" required="true"/>
                                <label for="email">Email</label>
                                <span class="helper-text" data-error="E-mail inválido" data-success="Correcto"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-action hide">
                    <asp:Button Text="!!Participar!!" runat="server" CssClass="btn" ID="btnParticipar" />

                </div>
            </div>
        </div>
    </div>
    <script>
        function LimpiarCampos() {
            document.querySelector('#MainContent_txtNombre').value = ''
            document.querySelector('#MainContent_txtApellido').value = ''
            document.querySelector('#MainContent_txtEmail').value = ''
            document.querySelector('#MainContent_txtCiudad').value = ''
            document.querySelector('#MainContent_txtDireccion').value = ''
            document.querySelector('#MainContent_txtCP').value = ''
        }
        document.getElementById("MainContent_DNI").addEventListener("keypress", function (e) {
            if (e.key == 'Enter') {
                e.preventDefault()
                if (this.value == '') {
                    M.toast({ html: 'DNI vacío' })
                } else {
                    fetch('<%= ResolveUrl("Datos.aspx/DatosCliente") %>', {
                        method: 'POST',
                        body: "{dni:'" + this.value + "'}",
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                        .then(function (response) {
                            return response.json();
                        })
                        .then(function (response) {
                            let datos = document.getElementById("datos");
                            datos.classList.remove("hide");
                            response.d = JSON.parse(response.d)
                            if (response.d.length != 0) {
                                document.querySelector('#MainContent_txtNombre').value = response.d.nombre
                                document.querySelector('#MainContent_txtApellido').value = response.d.apellido
                                document.querySelector('#MainContent_txtEmail').value = response.d.email
                                document.querySelector('#MainContent_txtCiudad').value = response.d.ciudad
                                document.querySelector('#MainContent_txtDireccion').value = response.d.direccion
                                document.querySelector('#MainContent_txtCP').value = response.d.CP
                                document.querySelector('#MainContent_txtNombre').focus()
                                document.querySelector('#MainContent_txtApellido').focus()
                                document.querySelector('#MainContent_txtEmail').focus()
                                document.querySelector('#MainContent_txtCiudad').focus()
                                document.querySelector('#MainContent_txtDireccion').focus()
                                document.querySelector('#MainContent_txtCP').focus()
                            } else {
                                LimpiarCampos()
                                M.toast({ html: 'Registrese por favor' })
                            }
                        });
                }
            }
        });
    </script>

</asp:Content>
