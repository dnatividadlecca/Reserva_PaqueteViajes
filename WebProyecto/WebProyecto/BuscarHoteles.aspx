<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="BuscarHoteles.aspx.cs" Inherits="WebProyecto.BuscarHoteles" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://d312mbhej9xjay.cloudfront.net/CSS/jetcost/bootstrap/global.min.css?v_2182001231">
    <link rel="stylesheet" href="https://d312mbhej9xjay.cloudfront.net/CSS/l53/app.min.css?v_487531102">
    <script src="Scripts/jquery-1.7.2.js"></script>
    <script src="Scripts/JqueryUI/jquery.ui.widget.js"></script>
    <script src="Scripts/JqueryUI/jquery.ui.autocomplete.js" type="text/javascript"></script>  
    <script src="Scripts/jqGrid/JsonXml.js" type="text/javascript"></script>
    <script src="Scripts/JqueryUI/jquery-ui.js" type="text/javascript"></script>    
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
        <div id="main" class="container">
        <div class="hotel-container-layout">
        <div class="hotel-container-layout__center hotel-container-layout__center--form">
        <h1 class="lead">Buscador de hoteles al mejor precio</h1>
        <div class="search" style="background-color: #12305a;">
        <div id="hotel-form-5a03b1b94532f" style="padding: 10px 10px 10px 10px !important; height: 200px !important;">
            <%--<form method="POST" name="Search" action="http://www.jetcost.com.pe/hoteles/search-bridge/" class="search__form search__form--hotel"><input autocomplete="off" type="hidden" name="dateFrom" value="2017-11-16"> <input autocomplete="off" type="hidden" name="dateTo" value="2017-11-17"> <input autocomplete="off" type="hidden" name="rooms" value="1"> <span><input type="hidden" name="adults[0]" value="2"> <input type="hidden" name="children[0]" value="0"></span> --%>
            <section style="margin: 0px !important;"><input autocomplete="off" type="hidden" name="placeId">                 
              <div data-bind-click="" class="col-xs-12 search__form__trip col-xs-12">
                <div style="display: block; white-space: nowrap;box-sizing: border-box;font-weight: 700;font-size: 1em;line-height: 20px;min-height: 10px;margin-top: 5px;color: #FFF;">Ciudad</div> 
                  <div class="search__form__group">
                    <span class="search__form__text-group">
                        <%--<input type="text" autocomplete="off" class="search__form__text">--%>
                        <asp:TextBox ID="txtDestino" runat="server" CssClass="search__form__text"></asp:TextBox>
                        <asp:HiddenField ID="hdf_IdDepartamento" runat="server" />
                        <asp:HiddenField ID="hdf_IdProvincia" runat="server" />
                        <asp:HiddenField ID="hdf_IdDistrito" runat="server" />
                    </span>
                  </div>
                </div>

                <div class="form-search-clear"></div>
                <div class="form-search-calendar col-xs-12 col-sm-8 col-no--xs col-no-padding-right-sm col-no-padding-right-md col-no-padding-right-lg">
                    <div class="col-xs-12 col-no-padding-left-sm col-no-padding-left-md col-no-padding-left-lg col-sm-6">
                        <div style="display: block; white-space: nowrap;box-sizing: border-box;font-weight: 700;font-size: 1em;line-height: 20px;min-height: 10px;margin-top: 5px;color: #FFF;">Ida</div>
                        <input type="date" class="form-control" id="txtFechaIni" runat="server">
                        <div class="datepicker-wrapper" style="display: none;">
                            <div class="months">
                                <div class="previous">
                                    &lt;
                                </div>
                                <div class="successive">
                                    &gt;
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-no-padding-left-sm col-no-padding-left-md col-no-padding-left-lg" style="">
                        <div style="display: block; white-space: nowrap;box-sizing: border-box;font-weight: 700;font-size: 1em;line-height: 20px;min-height: 10px;margin-top: 5px;color: #FFF;">Vuelta</div>
                        <input type="date" class="form-control" id="txtFechaFin" runat="server">
                        <div class="datepicker-wrapper" style="display: none;">
                            <div class="months">
                                <div class="previous disabled">
                                    &lt;
	
                                </div>
                                <div class="successive">
                                    &gt;
	
                                </div>
                                <div class="list">
                                    <div class="month">
                                        <div class="header">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>         
                
              <div class="search__form__rooms col-xs-12 col-sm-4">            
                <div style="display: block; white-space: nowrap;box-sizing: border-box;font-weight: 700;font-size: 1em;line-height: 20px;min-height: 10px;margin-top: 5px;color: #FFF;">Habitaciones</div> 
                  <select class="form-control search__form__select">
                    <option value="1_1">1 adulto</option> 
                    <option value="2_1">2 adulto (1 habitación)</option> 
                    <option value="3_1">3 adulto (1 habitación)</option> 
                    <option value="4_1">4 adulto (1 habitación)</option> 
                    <option value="2_2">2 adulto (2 habitación)</option> 
                    <option value="0">¿Necesitas más habitaciones o tienes niños?</option>
                  </select>
                </div>
                
              <div class="search__form__add-room col-xs-12 col-sm-8">
                  <div class="col-xs-12" style="display: none;">
                      <div class="search__form__label">&nbsp;</div> 
                      <a href="#" class="search__form__label">Añadir otra habitación</a>
                  </div>
              </div> 

              <div class="search__form__submit col-xs-12 col-sm-4 col-no-padding-left-md col-no-padding-left-lg col-no-padding-left-sm">
                    <div class="search__form__label">&nbsp;</div> 
                    <button type="button" id="btnBuscarHoteles" class="btn btn-primary col-xs-12">Buscar</button>
                </div>  
              </section>
            <%--</form>--%>
            
           <div class="search__form__errors col-xs-12"><div><span></span></div></div></div>                
        </div>
        </div>

        <div class="hotel-container-layout__center">
          <div class="last-searches">
            <h2 class="last-searches__title">
            Últimas búsquedas de hoteles
            </h2>
            <div class="last-searches__list row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                  <div class="last-searches__info-city">
                  Hotel en Marrakech (Marruecos)
                  </div>
                  <div class="last-searches__info-date">De 26/01/18 A 27/01/18</div>
                </div>
                <div class="last-searches__right-trigger">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                </div>                  
                <div class="last-searches__price">
                  <div class="last-searches__price-price">S/. 79</div>
                </div>
                </a>
                </div>
              </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Xalapa-Enriquez (México)
                </div>
                <div class="last-searches__info-date">
                De 11/11/17
                A 12/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 91
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en París (Francia)
                </div>
                <div class="last-searches__info-date">
                De 31/12/17
                A 02/01/18
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 590
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Melbourne (Australia)
                </div>
                <div class="last-searches__info-date">
                De 16/11/17
                A 17/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 508
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Las Palmas de Gran Canaria (España)
                </div>
                <div class="last-searches__info-date">
                De 31/03/18
                A 07/04/18
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 339
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Ijuí (Brasil)
                </div>
                <div class="last-searches__info-date">
                De 15/11/17
                A 16/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 92
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Mont Tremblant (Canadá)
                </div>
                <div class="last-searches__info-date">
                De 25/12/17
                A 03/01/18
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 1.120
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Guarujá (Brasil)
                </div>
                <div class="last-searches__info-date">
                De 16/01/18
                A 30/01/18
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 627
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Río de Janeiro (Brasil)
                </div>
                <div class="last-searches__info-date">
                De 05/12/17
                A 10/12/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 145
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Newark (Estados Unidos)
                </div>
                <div class="last-searches__info-date">
                De 09/11/17
                A 10/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 256
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Cancún (México)
                </div>
                <div class="last-searches__info-date">
                De 15/11/17
                A 16/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 573
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Los Cristianos (España)
                </div>
                <div class="last-searches__info-date">
                De 16/11/17
                A 17/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 359
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Ámsterdam (Países Bajos)
                </div>
                <div class="last-searches__info-date">
                De 25/11/17
                A 26/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 387
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Lima (Perú)
                </div>
                <div class="last-searches__info-date">
                De 16/11/17
                A 17/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 584
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Las Vegas (Estados Unidos)
                </div>
                <div class="last-searches__info-date">
                De 10/11/17
                A 12/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 298
                </div>
                </div>
                                        


                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Dallas (Estados Unidos)
                </div>
                <div class="last-searches__info-date">
                De 06/04/18
                A 07/04/18
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price 
               ">
                <div class="last-searches__price-price">
                S/. 561
                </div>
                </div>
                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">
                Hotel en Hammamet (Túnez)
                </div>
                <div class="last-searches__info-date">
                De 11/11/17
                A 13/11/17
                </div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price">
                <div class="last-searches__price-price">
                S/. 169
                </div>
                </div>
                </a>
                </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="last-searches__list-item">
                <a href="">
                <div class="last-searches__infos">
                <div class="last-searches__info-city">Hotel en Cuenca (España)</div>
                <div class="last-searches__info-date">De 05/02/18 A 08/02/18</div>
                </div>
                <div class="last-searches__right-trigger">
                <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
                                    
                                        
                <div class="last-searches__price">
                <div class="last-searches__price-price">S/. 132</div>
                </div>
                </a>
                </div>
                </div>
            </div>
          </div>
        </div>

        </div>
        </div>

        <div class="hotel-container-layout__cyan">
            <div class="container">
                <h2>Ofertas de hoteles</h2>
                <p>El <strong>buscador de hoteles</strong> de Jetcost te permite comparar al instante miles de <strong>ofertas de hoteles</strong> y encontrar, al mejor precio, la habitación de hotel en la ciudad y en las fechas que tú elijas.</p>
            
            
                <div class="seotext-2">
                <br>
                <strong>Hoteles al mejor precio</strong>: Jetcost compara precios de hoteles y encuentra las mejores tarifas de alojamientos. Ya sea que busques un hotel económico o uno de lujo, el motor de búsqueda de hoteles de Jetcost compara los precios de 500.000 hoteles en todo el mundo en más de 125 sitios web y te ofrece las mejores ofertas de hoteles. Ahorrarás tiempo y dinero en tu reserva de <strong>hoteles baratos</strong> con el <strong>buscador de hoteles</strong> de Jetcost.<br>Búsqueda de hoteles al mejor precio en Perú (<a href="" title="Hoteles baratos en Lima">Hoteles en Lima</a>, <a href="" title="Hoteles baratos en Arequipa">Hoteles baratos en Arequipa</a>, <a href="" title="Hoteles baratos en Trujillo">Hoteles baratos en Trujillo</a>, ...) y en todo el mundo  (<a href="" title="Hoteles en Buenos Aires">Hoteles en Buenos Aires</a>, <a href="" title="Hoteles en Madrid">Buscador de  hoteles en Madrid</a>, <a href="" title="Hoteles en Miami">Hoteles en Miami</a>,...)
                <br>
                <br>
                </div>
            </div>
        </div>
  </div>

  <footer class="footer1">
      <div class="container">
          <div class="row">
              <div class="col-xs-12 col-sm-12 newsletter">
                              </div>
          </div>
      </div>
  </footer>
  </form>
</body>
</html>

<script type="text/javascript">
    var Selecciono;
    $(document).ready(function () {
        function setInputDate(_id) {
            var _dat = document.querySelector(_id);
            var hoy = new Date(),
                d = hoy.getDate(),
                m = hoy.getMonth() + 1,
                y = hoy.getFullYear(),
                data;

            if (d < 10) {
                d = "0" + d;
            };
            if (m < 10) {
                m = "0" + m;
            };

            data = y + "-" + m + "-" + d;
            console.log(data);
            _dat.value = data;
        };
        setInputDate("#txtFechaIni");
        setInputDate("#txtFechaFin");

        //var hoy = new Date();
        //var dd = hoy.getDate() + 1;
        //var mm = hoy.getMonth() + 1;
        //var yyyy = hoy.getFullYear();
        //alert(dd + "/" + mm + "/" + yyyy);
        //$("#txtFechaIni").val("0" + dd + "/" + mm + "/" + yyyy);
        //$("#txtFechaFin").val("0" + dd + "/" + mm + "/" + yyyy);

        $("#btnBuscarHoteles").click(function () {
            var IdDepartamento = $("#hdf_IdDepartamento").val();
            var IdProvincia = $("#hdf_IdProvincia").val();
            var IdDistrito = $("#hdf_IdDistrito").val();
            var fechaIni = $("#txtFechaIni").val();
            var fechaFin = $("#txtFechaFin").val();

            window.parent.$("#ifContenido").attr("src", "ResultadosHoteles.aspx?IdDepartamento=" + IdDepartamento + "&IdProvincia=" + IdProvincia + "&IdDistrito=" + IdDistrito + "&daFechaIni=" + fechaIni + "&daFechaFin=" + fechaFin);
        });
        
        $("#txtDestino").autocomplete({
            minLength: 0,
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    url: "BuscarHoteles.aspx/ListarDestinoXFiltro",
                    data: "{'vcNomDestino': '" + $("#txtDestino").val().replace(/'/g, "&#39").replace(/"/g, "&#34").replace(/\\/g, "&#92") + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        response($.map(result.d, function (item) {
                            return {                                
                                label: item.NombreDestino.replace(/&#39/g, "'").replace(/&#92/g, "\\").replace(/&#34/g, '"'),
                                idDepartamento: item.IdDepartamaneto,
                                idDistrito: item.IdDistrito,
                                idProvincia: item.IdProvincia
                            };
                        }));
                    },
                    error: function (xhr, err, thrErr) {
                        alert(thrErr);
                    }
                });
            },
            focus: function (event, ui) {
                $("#txtDestino").val(ui.item.label);
                return false;
            },
            select: function (event, ui) {
                Selecciono = true;
                $("#txtDestino").val(ui.item.label);
                $("#hdf_IdDepartamento").val(ui.item.idDepartamento);
                $("#hdf_IdProvincia").val(ui.item.idProvincia);
                $("#hdf_IdDistrito").val(ui.item.idDistrito);
                return false;
            },
            change: function (event, ui) {
                if (!ui.item) {
                    $("#hdf_IdDepartamento").val(0);
                    $("#hdf_IdProvincia").val(0);
                    $("#hdf_IdDistrito").val(0);
                } else {
                    if ($("#txtDestino").val() == "") {
                        $("#hdf_IdDepartamento").val(0);
                        $("#hdf_IdProvincia").val(0);
                        $("#hdf_IdDistrito").val(0);
                    };
                }
            }

        });


    });
</script>
