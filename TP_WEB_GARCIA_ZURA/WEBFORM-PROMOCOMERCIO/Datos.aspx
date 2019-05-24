<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO.Datos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
    <div class="col s12 m9 l9offset-m3 ">
      <div class="card grey lighten-5">
        <div class=" black-text">
          <div class="card-title white lighten-5" style="padding: 2px"><h3 class="center-align">DATOS</h3></div>
          <div class="card-content">
            <div class="row">
                <div class="input-field col s6">
               
                <asp:Textbox runat="server" id="DNI" Cssclass="validate"/>
                <label for="DNI">DNI</label>
              </div>
            </div>
            
            <div class="row hide" id="datos">
                <div class="divider"></div>
              <div class="input-field col s6">
                <asp:Textbox runat="server" id="txtNombre"  CssClass="validate" />
                <label for="nombre">nombre</label>
              </div>
              <div class="input-field col s6">
                  <asp:Textbox runat="server" id="txtApellido" Cssclass="validate" />
                  <label for="apellido">apellido</label>
                </div>
              <div class="input-field col s6">
                <asp:Textbox runat="server" id="txtEmail" Cssclass="validate" />
                <label for="email">Email</label>
              </div>
              <div class="input-field col s6">
                <asp:Textbox runat="server" id="txtDireccion" Cssclass="validate"/>
                <label for="direccion">Direccion</label>
              </div>
              <div class="input-field col s6">
                <asp:Textbox runat="server" id="txtCiudad" Cssclass="validate"/>
                <label for="ciudad">Ciudad</label>
              </div>
              <div class="input-field col s6">
                <asp:Textbox runat="server" id="txtCP"  Cssclass="validate" />
                <label for="CP">Codigo Postal</label>
              </div>
            </div>
          </div>
        </div>
        <div class="card-action">
            <asp:Button Text="!!Participar!!" runat="server" Cssclass="btn"  id="btnParticipar" />

        </div>
      </div>
    </div>
  </div>
  <script >
      document.getElementById("MainContent_DNI").addEventListener("change", function (e) {
          var datos = document.getElementById("datos");
          datos.classList.remove("hide");
          /*fetch("Datos.aspx/datosCliente", {
              method: "POST",
              data: '{dni:"' + this.value + '"}',
              contentType: "application/json; charset=utf-8",
              dataType: "json",
          }).then(function (response) {
              return response.json;
          }).then(function (data) {
              console.log(data);
          });*/
          $.ajax({
              type: "POST",
              url: '<%= ResolveUrl("Datos.aspx/datosCliente") %>',
              data: "{dni:'" + this.value + "'}",
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: response => {
                  if (response.d) {
                      $('#<%=txtNombre.ClientID%>').val(response.d.nombre).change();
                      $('#<%=txtApellido.ClientID%>').val(response.d.apellido).change();
                      $('#<%=txtEmail.ClientID%>').val(response.d.email).change();
                      $('#<%=txtCiudad.ClientID%>').val(response.d.ciudad).change();
                      $('#<%=txtDireccion.ClientID%>').val(response.d.direccion).change();
                      $('#<%=txtCP.ClientID%>').val(response.d.CP).change();
                      $('#<%=txtDireccion.ClientID%>').click();
                      $('#datos').find("label").addClass("active");
                  }
              },
              failure: function (response) {
                  alert("fail");
              },
              error: function (response) {
                  alert(response.responseText);
              }
          });
      });
  </script>

</asp:Content>