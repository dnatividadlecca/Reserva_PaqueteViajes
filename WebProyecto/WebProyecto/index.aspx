<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebProyecto.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>
    <link href="Content/index.css" rel="stylesheet" />
    <link href="Content/index2.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
            <div class="pre-container">
                <div class="container">
                    <span class="menuTrigger" data-target="#menuWrapper1" data-toggle="dropdown">
                        <span class="menu-icon"></span>
                    </span>
                    <div class="navbar-header">
                        <a href="" class="navbar-brand">
                            <img id="logo" src="Content/logo.png" alt="Vuelos Baratos - Jetcost" style="height: 36px;">
                        </a>
                    </div>
                    <nav role="navigation">
                        <ul class="nav navbar-nav navbar-right language-switcher">
                            <li>
                                <div class="dropdown clearfix">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownLanguage" data-toggle="dropdown" aria-expanded="false">
                                    <i class="flag PE"></i>
                                    <span class="caret"></span>
                                    </button>
                                        <ul class="dropdown-menu clearfix" role="menu" aria-labelledby="dropdownLanguage">
                                          <li class="wrapper">
                                        <ul>
                                          <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://ar.jetcost.com/hoteles/">
                                                            <i class="flag AR"></i>
                                                            <span>
                                                                Argentina
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.au/hotels/">
                                                            <i class="flag AU"></i>
                                                            <span>
                                                                Australia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.bo/hoteles/">
                                                            <i class="flag BO"></i>
                                                            <span>
                                                                Bolivia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.br/hoteis/">
                                                            <i class="flag BR"></i>
                                                            <span>
                                                                Brasil
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://ca.jetcost.com/en/hotels/">
                                                            <i class="flag CA"></i>
                                                            <span>
                                                                Canada (en)
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://ca.jetcost.com/fr/hotels/">
                                                            <i class="flag CA"></i>
                                                            <span>
                                                                Canada (fr)
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.cl/hoteles/">
                                                            <i class="flag CL"></i>
                                                            <span>
                                                                Chile
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.co/hoteles/">
                                                            <i class="flag CO"></i>
                                                            <span>
                                                                Colombia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.dk/hoteller/">
                                                            <i class="flag DK"></i>
                                                            <span>
                                                                Danmark
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.de/hotels/">
                                                            <i class="flag DE"></i>
                                                            <span>
                                                                Deutschland
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.es/hoteles/">
                                                            <i class="flag ES"></i>
                                                            <span>
                                                                España
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://us.jetcost.com/es/hoteles/">
                                                            <i class="flag US"></i>
                                                            <span>
                                                                Estados Unidos (es)
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com/hotels/">
                                                            <i class="flag FR"></i>
                                                            <span>
                                                                France
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.hk/en/hotels/">
                                                            <i class="flag HK"></i>
                                                            <span>
                                                                Hong Kong
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.in/en/hotels/">
                                                            <i class="flag IN"></i>
                                                            <span>
                                                                India
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.id/en/hotels/">
                                                            <i class="flag ID"></i>
                                                            <span>
                                                                Indonesia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.ie/hotels/">
                                                            <i class="flag IE"></i>
                                                            <span>
                                                                Ireland
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.it/hotel/">
                                                            <i class="flag IT"></i>
                                                            <span>
                                                                Italia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.hu/szallas/">
                                                            <i class="flag HU"></i>
                                                            <span>
                                                                Magyarország
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.my/en/hotels/">
                                                            <i class="flag MY"></i>
                                                            <span>
                                                                Malaysia
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                    </ul>
                                    </li>
                                                                    <li class="wrapper">
                                        <ul>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.mx/hoteles/">
                                                            <i class="flag MX"></i>
                                                            <span>
                                                                México
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.nl/hotels/">
                                                            <i class="flag NL"></i>
                                                            <span>
                                                                Nederland
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.nz/hotels/">
                                                            <i class="flag NZ"></i>
                                                            <span>
                                                                New Zealand
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.no/hoteller/">
                                                            <i class="flag NO"></i>
                                                            <span>
                                                                Norge
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.at/hotels/">
                                                            <i class="flag AT"></i>
                                                            <span>
                                                                Österreich
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.pe/hoteles/">
                                                            <i class="flag PE"></i>
                                                            <span>
                                                                Perú
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.ph/en/hotels/">
                                                            <i class="flag PH"></i>
                                                            <span>
                                                                Philippines
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.pl/hotele/">
                                                            <i class="flag PL"></i>
                                                            <span>
                                                                Polska
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.pt/hoteis/">
                                                            <i class="flag PT"></i>
                                                            <span>
                                                                Portugal
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.ro/cazare/">
                                                            <i class="flag RO"></i>
                                                            <span>
                                                                România
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.ru/hotels/">
                                                            <i class="flag RU"></i>
                                                            <span>
                                                                Россия
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.sg/en/hotels/">
                                                            <i class="flag SG"></i>
                                                            <span>
                                                                Singapore
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.za/en/hotels/">
                                                            <i class="flag ZA"></i>
                                                            <span>
                                                                South Africa
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.fi/hotellit/">
                                                            <i class="flag FI"></i>
                                                            <span>
                                                                Suomi
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.se/hotell/">
                                                            <i class="flag SE"></i>
                                                            <span>
                                                                Sverige
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.th/en/hotels/">
                                                            <i class="flag TH"></i>
                                                            <span>
                                                                Thailand
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.uk/hotels/">
                                                            <i class="flag GB"></i>
                                                            <span>
                                                                United Kingdom
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://us.jetcost.com/en/hotels/">
                                                            <i class="flag US"></i>
                                                            <span>
                                                                United States (en)
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.com.uy/hoteles/">
                                                            <i class="flag UY"></i>
                                                            <span>
                                                                Uruguay
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                            <li role="presentation">
                                                    <span role="menuitem" tabindex="-1">
                                                        <a href="http://www.jetcost.co.ve/hoteles/">
                                                            <i class="flag VE"></i>
                                                            <span>
                                                                Venezuela
                                                            </span>
                                                        </a>
                                                    </span>
                                                </li>
                                                                                    </ul>
                                    </li>
                                                            </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div id="menuWrapper1" class="menuWrapper">
                        <nav role="navigation">
                          <ul class="nav navbar-nav mainmenu">
                            <li class="flights">
                              <a class="active" title="Hoteles baratos" id="VerHoteles" style="cursor: pointer;">
                                Hoteles
                              </a>
                            </li>
                            <li class="flights">
                              <a title="Vuelos baratos" id="VerVuelo" style="cursor: pointer;">
                                Vuelos
                              </a>
                            </li>
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
  <div id="clave" style="widows: 100%; height:915px;">
    <iframe id="ifContenido" height="100%" width="100%" src="BuscarHoteles.aspx" frameborder="0" scrolling="no">
  </iframe>

</div>

    </form>
</body>
</html>

<script>
    (function(w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start': new Date().getTime(),
            event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-WCBM');

    $(document).ready(function () {        
        $("#dropdownLanguage").click(function () {
            $(".dropdown-menu").show();    
        });

        $("#VerHoteles").click(function () {
            $("#ifContenido").attr("src", "BuscarHoteles.aspx");
            $("#VerHoteles").addClass('active');
            $("#VerVuelo").removeClass('active');
        });

        $("#VerVuelo").click(function () {
            $("#ifContenido").attr("src", "BuscarVuelo.aspx");
            $("#VerHoteles").removeClass('active');
            $("#VerVuelo").addClass('active');
        });
    });




</script>