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

                                <asp:TextBox runat="server" ID="DNI" CssClass="validate" autofocus="true" />
                                <label for="DNI">DNI</label>
                            </div>
                        </div>

                        <div class="row hide" id="datos">
                            
                                <div class="divider"></div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="txtNombre" CssClass="validate" required="true" />
                                    <label for="nombre">Nombre</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="txtApellido" CssClass="validate" required="true" />
                                    <label for="apellido">Apellido</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="validate" required="true" />
                                    <label for="direccion">Direccion</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="validate" required="true" />
                                    <label for="ciudad">Ciudad</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" ID="txtCP" CssClass="validate" required="true" />
                                    <label for="CP">Codigo Postal</label>
                                </div>
                                <div class="input-field col s6">
                                    <asp:TextBox runat="server" type="email" ID="txtEmail" CssClass="validate" required="true" />
                                    <label for="email">Email</label>
                                    <span class="helper-text" data-error="E-mail inválido" data-success="Correcto"></span>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="card-action ">
                    <asp:Button Text="!!Participar!!" type="submit" runat="server" CssClass="btn hide" ID="btnParticipar" />

                </div>
            </div>
        </div>
    </div>
    <script>
        let Nombre = document.querySelector('#MainContent_txtNombre')
        let Apellido = document.querySelector('#MainContent_txtApellido')
        let Email = document.querySelector('#MainContent_txtEmail')
        let Ciudad = document.querySelector('#MainContent_txtCiudad')
        let Direccion = document.querySelector('#MainContent_txtDireccion')
        let CP = document.querySelector('#MainContent_txtCP')
        let DNI = document.querySelector('#MainContent_DNI')
        let botonParticipa = document.querySelector('#MainContent_btnParticipar')

        function ValidaCampos() {
            if (Nombre.value == "" || Apellido.value == "" || Email.value == "" || Ciudad.value == "" || Direccion.value == ""
                || CP.value == "" || DNI.value == "") {
                return true;
            } else {
                return false;
            }
        }
        function validaMail() {
            let arroba = Email.value.indexOf("@");
            if (arroba != -1) {
                if (Email.value.length - 1 != arroba) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }
        
        function EnviarInfo(e) {
            e.preventDefault()
            let Val = ValidaCampos();
            if (Val) {
                M.toast({ html: 'Algún campo esta vacío !' })
            } else {
                let valMail = validaMail()
                if (valMail) {
                    M.toast({ html: 'Formato de e-mail inválido' })
                } else {
                    botonParticipa.setAttribute('disabled', 'true')
                    fetch('<%= ResolveUrl("Datos.aspx/CompletaParticipante") %>', {
                        method: 'POST',
                        body: `{nombre:'${Nombre.value}', apellido:'${Apellido.value}', email:'${Email.value}',
                                ciudad:'${Ciudad.value}', direccion:'${Direccion.value}', CP:'${CP.value}', DNI:'${DNI.value}'}`,
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                        .then(response => {
                            return response.json()
                        })
                        .then(response => {
                            if (response.d) {
                                M.toast({ html: 'Ya te ganaste tu premio !' })
                                setTimeout(function () {
                                    window.location.replace("<%= ResolveUrl("Default.aspx") %>");
                                }, 1000)

                            }
                        })
                }
            }
        }
        
        function LimpiarCampos() {
            Nombre.value = ''
            Apellido.value = ''
            Email.value = ''
            Ciudad.value = ''
            Direccion.value = ''
            CP.value = ''
        }
        DNI.addEventListener("keypress", function (e) {
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
                            botonParticipa.classList.remove("hide")
                            response.d = JSON.parse(response.d)
                            if (response.d.length != 0) {
                                Nombre.value = response.d.nombre
                                Apellido.value = response.d.apellido
                                Email.value = response.d.email
                                Ciudad.value = response.d.ciudad
                                Direccion.value = response.d.direccion
                                CP.value = response.d.CP
                                Nombre.focus()
                                Apellido.focus()
                                Email.focus()
                                Ciudad.focus()
                                Direccion.focus()
                                CP.focus()
                            } else {
                                LimpiarCampos()
                                M.toast({ html: 'Registrese por favor' })
                            }
                        });
                }
            }
        })
        botonParticipa.addEventListener('click', e => {
            EnviarInfo(e)
        })
        let form = document.querySelector('form')
        form.addEventListener('submit', e => {
            EnviarInfo(e)
        })
    </script>

</asp:Content>
