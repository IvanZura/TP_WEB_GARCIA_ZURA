<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="premios.aspx.cs" Inherits="WEBFORM_PROMOCOMERCIO.premios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
    </div>
    <script>
        $("document").ready(function () {
            $.ajax({
                type: "POST",
                url: '<%= ResolveUrl("Premios.aspx/listaPremios") %>',
             data: "{}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: show,
             failure: function (response) {
                 alert("fail");
             },
             error: function (response) {
                 alert(response.responseText);
             }
         });
         function show(response) {
             var fila = $(".row");
             var datos = response.d;
             $(datos).each(function () {
                 let contenedor = document.createElement("div");
                 let card = document.createElement("div");
                 let cardImage = document.createElement("div");
                 let image = document.createElement("img");
                 let button = document.createElement("a");
                 let icon = document.createElement("i");
                 let title = document.createElement("span");
                 let cardContent = document.createElement("div");
                 let content = document.createElement("p");
                 $(contenedor).addClass("col s6 m4");
                 $(card).addClass("card");
                 $(cardImage).addClass("card-image");
                 $(image).attr("src", this.url);
                 $(button).addClass("btn-floating halfway-fab waves-effect waves-light red");
                 $(icon).addClass("material-icons");
                 $(icon).text("+");
                 $(title).addClass("card-title");
                 $(title).text(this.titulo);
                 $(cardContent).addClass("card-content");
                 $(content).text(this.descripcion);
                 $(title).append(content);
                 $(button).append(icon);
                 $(cardImage).append(image, button);
                 $(card).append(cardImage, title, cardContent);
                 $(contenedor).append(card);
                 $(fila).append(contenedor);
                 let id = this.id;
                 $(icon).click(function () {
                     $.ajax({
                         type: "POST",
                         url: '<%= ResolveUrl("Premios.aspx/siguiente") %>',
                            data: "{premio:'" + id + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: location.replace("Datos.aspx"),
                            failure: function (response) {
                                alert("fail");
                            },
                            error: function (response) {
                                alert(response.responseText);
                            }
                        });

                    })
                });
            }
        });


    </script>

</asp:Content>
