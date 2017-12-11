<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultadosHoteles.aspx.cs" Inherits="WebProyecto.ResultadosHoteles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        if (window.location.hash && window.location.hash === '#_=_') {
            window.location.hash = '';
        }
	    </script>
    <script type="text/javascript">
        (function () {
            var hash = location.hash.substring(1);

            if (!hash) return;

            var params = hash.split("&");

            if (params.length == 0) return;

            //Stop unstyled html showing up under Chrome
            try {
                document.execCommand('Stop');
                window.stop();
            } catch (e) { }

            location.replace("/Hotels/Search?" + hash);
        })();
    </script>  
    <link href="https://cdn.datahc.com/Styles/Style.ashx?affiliateId=20139&branding=502039&key=MainWhitelabel&v=636426608259500000-215646208&cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa" rel="stylesheet" type="text/css" inspectlet-ignore /><link href="https://cdn.datahc.com/Styles/Style.ashx?affiliateId=20139&branding=502039&key=HotelListingsWhitelabel&v=636426608259500000-215646208&cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa" rel="stylesheet" type="text/css" inspectlet-ignore />
    <link rel="stylesheet" href="https://d312mbhej9xjay.cloudfront.net/CSS/l53/hc-styles.css?v_3892021715">
    <link rel="stylesheet" href="https://d312mbhej9xjay.cloudfront.net/CSS/l53/hotels-combined.css?v_2468442810">    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <script type="text/javascript" src="https://cdn.datahc.com/Script/Bundles/Master?v=Fxh40fIVnu0AQjYl-YN2RWLqJm1BYOJGzPxWAoKYd-s1&cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa">
    </script>
    <link href="Content/ui.jqgrid.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.7.2.js"></script>
    <script src="Scripts/JqueryUI/jquery.ui.widget.js"></script>
    <script src="Scripts/JqueryUI/jquery.ui.autocomplete.js" type="text/javascript"></script>  
    <script src="Scripts/jqGrid/JsonXml.js" type="text/javascript"></script>
    <script src="Scripts/JqueryUI/jquery-ui.js" type="text/javascript"></script>  
    <script type="text/javascript">
        HC.gLanguageCode = 'ES';
        HC.gCountryCode = 'PE';
        HC.gCurrencyCode = 'PEN';
        HC.requestBase = 'http://hotel.jetcost.com.pe';
        HC.Common.isRightToLeft = false;

        $.extend(
            true,
            HC,
            {
                Translations: {
                    searchPageSortingResults: 'Ordenando resultados...',
                    pageFilteringResults: 'Filtrando resultados...',
                    searchPageLoadingPage: 'Cargando página...',
                    searchPageLoadingResults: 'Buscando en las mejores páginas web de viajes...',
                    searchPageLoadingHotel: 'Cargando hotel...'
                }
            });

        var gLanguageCode = HC.gLanguageCode;
        var gCountryCode = HC.gCountryCode;
        var gCurrencyCode = HC.gCurrencyCode;

        HC.setPlatform(0);
        HC.Common.Init({ "backendconfirmationtest": 0, "assistedbookingostrovok": 0, "koreanpromobanner": 1, "crazyegg": 1, "algolia": 0, "searchboxoptimisation": 1, "propertypagedesktopnewheader": 1, "desktopsortbarredesign": 1, "mobileapponboarding": 1, "allinclusivetaxpreference": 1, "desktopsearchresultitem": 1, "bobsortmena": 1, "mobilephotogalleryroomcategory": 1, "providernamesinkorean": 1, "disableprovidersinkorea": 0, "algolianofallback": 1, "bookbyphonesaudi": 0, "lowavailabilityincreasequotas": 0, "raterounding": 0 }, 'PEN', false, '20139', false, 'ES', false, false, 'PE', 'AIzaSyC7mPnG7rRY4LavDW9DVgH9GsiBkHCexR8', 'https://cdn.datahc.com', '1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa', 'PrivateBranding', { "DisableProviderRedirectRedirection": false, "DisableClickTripz": false }, 'SearchResults');
        HC.SpriteGallery.setImageConfiguration('https://edge.media.datahc.com', 'HI');
        HC.Common.StarRating.setTemplate('<p class="hc-hotelrating hc-hotelrating--{1}" title="{2}"><span class="hc-hotelrating__value hc-hotelrating__value--{0}"></span></p>');

        HC.Common.setDevice({
            webBrowserType: 2,
            webBrowserMajorVersion: 62,
            os: 5
        });
    </script>
    <script>
        (function () {
            var experiments = [];
            var experimentSeenScripts = ["HC.Experiments.AlgoliaSetSeen = function() {\r\n\tHC.Common.setExperimentSeen(402)\r\n}", "HC.Experiments.MobileAppOnboardingSetSeen = function() {\r\n  HC.Common.setExperimentSeen(455);\r\n}\r\n", "HC.Experiments.AlgoliaSetSeenNoFallback = function() {\r\n\tHC.Common.setExperimentSeen(490)\r\n}"];
            HC.JsEvaluator.add.apply(HC.JsEvaluator.add, experiments);
            HC.JsEvaluator.add.apply(HC.JsEvaluator.add, experimentSeenScripts);
            HC.JsEvaluator.process();
        })();
    </script>
    <script>
        $(function () {
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', '__hcgaInternal');

            window.__hcga = function () {
                var commandName = arguments[0],
                    args = Array.prototype.slice.call(arguments, 1);
                __hcgaInternal.apply(window, $.merge([commandName], args));
                __hcgaInternal.apply(window, $.merge(['registrationtracker.' + commandName], args));
            }
            var customDimensions = { "dimension11": "2", "dimension3": "20139", "dimension4": "502039", "dimension1": "PrivateBranding", "dimension20": "20171207-20171208", "dimension12": "0", "dimension8": "Peru", "dimension10": "PEN", "dimension16": "00090Y000A1Y01570N017B1N01891N01920N019B1N019C1N01AA1N01B21N01C11N01C31N01C40N01C71N01CA1N01CE1N01DC0N01DF1N01E00N01E11N01E31N01E81N01E90N01EA1N01EC0N01EF0N01F00Y01F20Y", "hostname": "hotel.jetcost.com.pe", "dimension15": 0, "dimension5": "sessionId:SPEes_5a1f841db16d4,searchId:5a1f8440bff3a,isApp:0,placeId:55083,placeCountryCode:PE,placeIataCode:LIM", "dimension9": "ES", "dimension13": "1", "dimension6": "SearchResults", "dimension7": "Lima", "dimension2": "DesktopWeb" };
            __hcgaInternal('create', 'UA-40537616-1', { 'storage': 'none', 'clientId': '4096a8ac-a8a1-4e7c-ac68-4f8888e693b9', 'userId': '', sampleRate: 2 });
            __hcgaInternal('create', 'UA-71354387-2', { 'storage': 'none', 'clientId': '4096a8ac-a8a1-4e7c-ac68-4f8888e693b9', 'userId': '', name: 'registrationtracker' });
            __hcga('set', customDimensions);
            __hcga('require', 'displayfeatures');
            if (window.location.hostname === "redirect.datahc.com") {
                __hcga('set', 'referrer', 'referrer.datahc.com');
            }
            HC.GoogleUA.sendPageView();
            __hcga('require', 'ec');
            HC.GoogleUA.init();
        });
    </script>
    <script type="text/javascript">
        HC.Errors.init(
            '\u003cp class=\u0027hc_f_t_err2 hc_f_error\u0027\u003e\u003cspan class=\u0027hc_icon\u0027\u003e!\u003c/span\u003e\u003cem\u003e[InsertMessage]\u003c/em\u003e\u003c/p\u003e',
            '\u003cp class=\u0027hc_info\u0027\u003e\u003cspan class=\u0027hc_icon\u0027\u003ei\u003c/span\u003e\u003cem\u003e[InsertMessage]\u003c/em\u003e\u003c/p\u003e');
    </script>
    <script type="text/javascript" src="https://cdn.datahc.com/Script/Bundles/CitySearch?v=Dz7JjmmUAPd4qWBNFC4Tu71lhAlW1kCGIlROmX1caPM1&cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa">
    </script>
    <script type="text/javascript">

        (function () {

            $.extend(true, HC.Common, {
                fields: {
                    destination: 'place:Lima',
                    radius: '0km',
                    checkin: '2017-12-07',
                    checkout: '2017-12-08',
                    rooms: [{ "adults": 2, "childAges": [] }]
                }
            });

            HC.SR.setOptions({
                hotelId: [],
                providerRateFilter: ''
            });

            HC.SR.Filter.setFields({
                showSoldOut: false,
                stars: [],
                hotelName: '',
                facilities: [],
                propertyType: [],
                themes: [],
                guestRatings: [],
                closedPanels: [],
                hotelChains: [],
                deals: [],
                priceRange: {
                    lowRate: null,
                    highRate: null
                }
            });

            HC.SR.Paging.setFields({
                pageSize: 15,
                pageIndex: 0
            });

            HC.Translations.set([
                ['BigMapOpen', '\u003cstrong\u003eAbrir\u003c/strong\u003e el mapa'],
                ['BigMapClose', '\u003cstrong\u003eCerrar\u003c/strong\u003e el mapa'],
                ['MapsZoomInLink', 'Acercar el zoom'],
                ['MapsZoomOutLink', 'Alejar el zoom'],
                ['HotelPageBook', 'Seleccionar'],
                ['Info', 'COMPLETO'],
                ['SearchResultItemPrice', 'Precio'],
                ['SearchResultItemHotelRating', 'Clasificación de hoteles'],
                ['SearchResultItemAddress', 'Dirección'],
                ['CityPagePriceFrom', 'desde'],
                ['HotelPageIncludesAllLocalTaxes', 'Impuestos locales incluidos'],
                ['ZeroHotels', '0 hoteles']
            ]);

        })();

    </script>
    <script type="text/javascript">

        (function () {
            HC.Map.setOptions({ useRatesProxy: true });
            HC.Translations.set('CitySearchPageLoadingResults',
                'Buscando en las mejores páginas web de viajes...');
            HC.SR.setOptions({
                datedPage: true
            });
            if (!HC.BingMaps.active) {
                HC.SR.Map.setOptions({ disconnectedMap: true });
            }
        })();
        </script>
    <script>
        var target = {
            'home': 'http://www.jetcost.com.pe/hoteles/',
            'others': 'http://www.jetcost.com.pe/hoteles/seo-bridge/'
        };

        var jcApiPrefix = "http://pxl.jtctrack.com/hc/v1/";
        var jcBridgePageUrl = "http://www.jetcost.com.pe/hoteles/search-bridge/";
        var jcFavicon = "https://d312mbhej9xjay.cloudfront.net/images/common/faviconJETCOST.ico?v_1413218500";
    </script>
	<script>
        HC.Breakpoints.init();
	</script>
</head>
<body class="hc_page_sr hc_lang_es hc_cur_pen hc_os_windows hc_r_layout_v2_full hc_ab_48139 hc_ab_9493 " onclick="void(0)">
    <form id="form2" runat="server">
		<input name="__RequestVerificationToken" type="hidden" value="I8EKPKtcjtOPjn2aYFYCr89-wH4iW2xPDvbPAVR3h8noQ3L9i-yuYhnydGy3s1ifjFMP93GockC-4Eg6Wxv7IRNPOaM1" />
        <asp:HiddenField ID="hdf_IdDepartamento" runat="server" />
        <asp:HiddenField ID="hdf_IdProvincia" runat="server" />
        <asp:HiddenField ID="hdf_IdDistrito" runat="server" />
        <asp:HiddenField ID="hdf_FechaIni" runat="server" />
        <asp:HiddenField ID="hdf_FechaFin" runat="server" />

        <div id="hc_evt_tooltip_modal" class="hc_m_modal" style="display: none;" onclick="void(0)"></div>	
        <div id="hc_bodyElements"></div>
        <div id="hc_r_v_full"></div>
        <div id="hc_template_roomConfig" style="display: none;">
        <fieldset data-index="{index}" class="hc_f_roomConfig_{index}">
            <legend>Habitaci&#243;n {index}:</legend>
            <p class="hc_f_t_txt hc_f_roomDesc" data-hc_section="configurationMessageSection"> <a href="javascript:void(0);" class="hc_f_edit hc_evt_editRoom">cambiar la configuraci&#243;n<span></span></a></p>
            <div class="hc_f_t_s2 hc_f_adults" data-hc_section="adultsSection">
                <label for="hc_f_id_adults_{index}_{instance}">
                    <span>Adultos</span>
                    <select id="hc_f_id_adults_{index}_{instance}" class="hc_evt_adults">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2" selected="selected">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                    </select>
                </label>
            </div>
            <div class="hc_f_t_s2 hc_f_children" data-hc_section="childrenSection">
                <label for="hc_f_id_children_{index}_{instance}">
                    <span>Ni&#241;os</span>
                    <select id="hc_f_id_children_{index}_{instance}" class="hc_evt_children">
                            <option value="0" selected="selected">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                    </select>
                </label>
            </div>
            <div class="hc_f_t_s_multi hc_f_ages" data-hc_section="agesSection">
                <label for="hc_f_id_ages_{index}_1_{instance}" style="display:none;">Edad de los ni&#241;os</label>
                    <span style="display:none;">
                        <select id="hc_f_id_ages_{index}_1_{instance}" >
                                <option value="0" >0</option>
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                                <option value="5" >5</option>
                                <option value="6" >6</option>
                                <option value="7" >7</option>
                                <option value="8" >8</option>
                                <option value="9" >9</option>
                                <option value="10" >10</option>
                                <option value="11" >11</option>
                                <option value="12" >12</option>
                                <option value="13" >13</option>
                                <option value="14" >14</option>
                                <option value="15" >15</option>
                                <option value="16" >16</option>
                                <option value="17" >17</option>
                        </select>
                    </span>
                    <span style="display:none;">
                        <select id="hc_f_id_ages_{index}_2_{instance}" >
                                <option value="0" >0</option>
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                                <option value="5" >5</option>
                                <option value="6" >6</option>
                                <option value="7" >7</option>
                                <option value="8" >8</option>
                                <option value="9" >9</option>
                                <option value="10" >10</option>
                                <option value="11" >11</option>
                                <option value="12" >12</option>
                                <option value="13" >13</option>
                                <option value="14" >14</option>
                                <option value="15" >15</option>
                                <option value="16" >16</option>
                                <option value="17" >17</option>
                        </select>
                    </span>
                    <span style="display:none;">
                        <select id="hc_f_id_ages_{index}_3_{instance}" >
                                <option value="0" >0</option>
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                                <option value="5" >5</option>
                                <option value="6" >6</option>
                                <option value="7" >7</option>
                                <option value="8" >8</option>
                                <option value="9" >9</option>
                                <option value="10" >10</option>
                                <option value="11" >11</option>
                                <option value="12" >12</option>
                                <option value="13" >13</option>
                                <option value="14" >14</option>
                                <option value="15" >15</option>
                                <option value="16" >16</option>
                                <option value="17" >17</option>
                        </select>
                    </span>
                    <span style="display:none;">
                        <select id="hc_f_id_ages_{index}_4_{instance}" >
                                <option value="0" >0</option>
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                                <option value="5" >5</option>
                                <option value="6" >6</option>
                                <option value="7" >7</option>
                                <option value="8" >8</option>
                                <option value="9" >9</option>
                                <option value="10" >10</option>
                                <option value="11" >11</option>
                                <option value="12" >12</option>
                                <option value="13" >13</option>
                                <option value="14" >14</option>
                                <option value="15" >15</option>
                                <option value="16" >16</option>
                                <option value="17" >17</option>
                        </select>
                    </span>
            </div>
            <div class="hc_f_t_btn hc_f_remove">
                <a href="javascript:void(0);" class="hc_f_btn_v0 hc_evt_removeRoom">quitar<span></span></a>
            </div>
            <div class="cDiv"></div>
        </fieldset>
        </div>
        <script type="text/javascript">
            HC.RoomConfig.init($('#hc_template_roomConfig'));
        </script>

        <div id="hc_r_globalWrap" class="hc_r_layout_v2_full">
          <script src="http://www.google.com/adsense/search/ads.js" type="text/javascript"></script>
            <div class='hc_container'>
              <div id="hc_r_content">
                <div id="hc_evt_settings_buttons" class="hc_r_config" data-settings="buttons">
	              <ul class="hc_config_nav">
		              <li class="hc_config_nav_lang hc_flag_es hc_hide">
			              <a href="javascript:void(0);" class="" data-settings-button="language"><span class="hc_icon hc_t_flag"></span></a>
		              </li>
		              <li class="hc_config_nav_cur hc_hide">
			              <a href="javascript:void(0);" data-settings-button="currency">PEN</a>
		              </li>
	              </ul>
	              <div class="hc_r_clear"></div>
                </div>

                <div class="hc_m hc_m_po hc_config_po_loading" style="display: none;">
                  <div class="hc_m_arrow_top"></div>
                  <b class="b1h"></b>
                  <b class="b2h"></b>
                  <b class="b3h"></b>
                  <b class="b4h"></b>
                  <div class="hc_m_outer">	
                    <div class="hc_m_hd"></div>	
                    <div class="hc_m_content">		
                      <div class="hc_e_spinner_v2">
                        <img src="https://cdn.datahc.com/Content/Images/Desktop/Shared/hc_loader1.gif?cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa" alt="" />
                      </div>
                    </div>	
                    <div class="hc_m_ft"></div>
                  </div>
                  <b class="b4bh"></b>
                  <b class="b3bh"></b>
                  <b class="b2bh"></b>
                  <b class="b1h"></b>
                </div>
<%--        <script>
HC.MainNavigation.setSpinnerTemplate(HC.Common.scriptPreviousSibling());
</script>


<script type="text/javascript">
(function () {
var navigationHolder = $('#hc_evt_settings_buttons');
HC.MainNavigation.init(navigationHolder, {
buttonContainer: navigationHolder,
containers: [$("#hc_evt_settings_currency"), $("#hc_evt_settings_language"), $("#hc_evt_settings_languageRecommendation")],
popoverContainers: [$("#hc_evt_settings_currency"), $("#hc_evt_settings_language"), $("#hc_evt_settings_accountMenu")],
ajaxGet: {
wishlist: '/WishList/List',
searchHistory: '/SearchHistory/List',
recentlyViewed: '/ViewedHotels/List',
lists: '/HotelList/ListsSummary?redirectIfSingleList=true'
}
});
})();
</script>--%>


                <div class="cDivBoth"></div>
                    <div id="hc_r_1">
                    <div class="hc_r_clear"></div>
                    </div>

                    <div id="hc_r_3">
                      <div id="hc_r_3b">
                        <a id="hc_map_main_top" name="hc_map_main_top"></a>
                        <div id="hc_intro">
                          <script type="text/javascript">
                              HC.SR.UI.setOptions({ updateBreadCrumbCount: false, showNumberOfAvailableHotels: true, container: HC.Common.scriptPreviousSibling() });
                          </script>
                          <h1 class="hc-searchproperties">Lima<span data-section="propertiesAvailable"></span></h1>
                          <div id="hc_sr_dates" class="hc_m">
                            <b class="b1h"></b>
                            <b class="b2h"></b>
                            <b class="b3h"></b>
                            <b class="b4h"></b>
                          <div class="hc_m_outer">	
                            <div class="hc_m_hd"></div>	
                            <div class="hc_m_content">					
                              <p>
                                1 noche (7 de dic - 8 de dic) para 2 adultos<span class='hc_hide'>, 0 ni&#241;os</span> <span class='hc_hide'> en 1 habitaci&#243;n</span>
                              </p>
                              <a href="javascript:void(0)" onclick="HC.SearchBox.changeSearchClicked($('#hc_changeSearch'));return false;" class="hc_f_btn_changeDates">Modificar la b&#250;squeda<span></span></a>
                              <div class="cDiv"></div>
                            </div>	
                            <div class="hc_m_ft"></div>
                          </div>
                            <b class="b4bh"></b>
                            <b class="b3bh"></b>
                            <b class="b2bh"></b>
                            <b class="b1h"></b>
                          </div>
                        </div>
                        <div class="cDiv"></div>
                        <div id="hc_changeSearch" class="hc_m_v2" style="display:none;">
                        <b class="b1h"></b><b class="b2h"></b><b class="b3h"></b><b class="b4h"></b><div class="hc_m_outer">	<div class="hc_m_hd">		<h2>Escoge tus fechas de viaje</h2>	</div>	<div class="hc_m_content">

                        <a href="javascript:void(0);" data-action="hidesearchbox" class="hc_m_close" style="display:block">Ocultar<span></span></a>
                        <fieldset>
                        <div class="hc_f_t_search2 hc_f_where" data-destinatioinput>
                        <label for="hc_f_id_where_3">&#191;D&#243;nde?</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="search__form__text"></asp:TextBox>
                        </div>
        
                        <div data-hidewhenminimised>
                        <div class="hc_f_t_cb2 hc_f_noDates">
                        <label for="hc_f_id_noDates_3">
                        <span>Todav&#237;a no tengo fechas espec&#237;ficas</span>
                        <input type="checkbox" id="hc_f_id_noDates_3" value="0"/>
                        </label>
                        </div>


                        <div class="hc_f_t_s3 hc_f_guestsRooms">
                        <label for="hc_f_id_guestsRooms_3">
                        <span>Hu&#233;spedes</span>
                        <select name="hc_f_id_guestsRooms_" id="hc_f_id_guestsRooms_3" class="hc_evt_roomsGuests">
                        <option value="1-1">1 adulto</option>
                        <option value="2-1" selected="selected">2 adultos en 1 habitaci&#243;n</option>
                        <option value="3-1">3 adultos en 1 habitaci&#243;n</option>
                        <option value="4-1">4 adultos en 1 habitaci&#243;n</option>
                        <option value="2-2">2 adultos en 2 habitaciones</option>
                        <option value="0">M&#225;s opciones...</option>
                        </select>
                        </label>
                        </div>
                        <div class="hc_f_t_roomConfig hc_f_roomConfig" data-section="roomConfig">
                        <div class="hc_f_t_btn hc_f_add">
                        <a href="javascript:void(0);" class="hc_evt_addRoom">A&#241;adir otra habitaci&#243;n<span></span></a>
                        </div>
                        </div>
                        <script type="text/javascript">
                            HC.RoomConfig.setInitialValues({
                                childrenCount: [],
                                dropdownValue: '2-1'
                            });
                        </script>

                        <div class="hc_f_t_btn hc_f_submit" data-section="submitButton">
                        <a class="hc_f_btn_v15" rel="nofollow" title="" onclick="return HC.SearchBox.getRates($('#hc_changeSearch'), { changeClass: ['', 'hc_active'], searchButton: this, searchingStr: 'Buscando<span></span>', skipFilters: false }); ">Buscar<span></span></a>
                        </div>

                        </div>
                            <div class="cDivBoth"></div>

                        </fieldset>





                    <script type="text/javascript">
</script>	</div>	<div class="hc_m_ft"></div></div><b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b class="b1h"></b>		</div>
                        <div id="hc_evt_lowAvail" class="hc_lowAvail hc_m_v1 hc_rating_4" data-rating="70">
                        <b class="b1h"></b><b class="b2h"></b><b class="b3h"></b><b class="b4h"></b><div class="hc_m_outer">	<div class="hc_m_hd">		<h2>Lima es muy popular en las fechas que has seleccionado - <span>70 % reservado</span></h2>	</div>	<div class="hc_m_content">        <canvas id="hc_evt_lowAvail_canvas" class="hc_lowAvail_gauge hc_lowAvail_canvas" height="105" width="122"></canvas>
                                <p>Los precios pueden aumentar debido al gran n&#250;mero de reservas.</p>
                                <div class="hc_lowAvail_otherDates">
                                    <h3>Intentar otras fechas</h3>
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <thead>
                                            <th><a onclick="HC.LowAvailability.search('2017-12-14', '2017-12-15')" href="javascript:void(0)">La pr&#243;xima semana</a></th>
                                            <th><a onclick="HC.LowAvailability.search('2018-01-04', '2018-01-05')" href="javascript:void(0)">El pr&#243;ximo mes</a></th>
                                        </thead>
                                        <tbody>
                                            <td><a onclick="HC.LowAvailability.search('2017-12-14', '2017-12-15')" href="javascript:void(0)">14 de dic - 15 de dic</a></td>
                                            <td><a onclick="HC.LowAvailability.search('2018-01-04', '2018-01-05')" href="javascript:void(0)">4 de ene - 5 de ene</a></td>
                                        </tbody>
                                    </table>
                                    <div class="cDiv"></div>
                                </div>
	                        </div>	<div class="hc_m_ft"></div></div><b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b class="b1h"></b></div>
                        <script type="text/javascript">
                            HC.LowAvailability.init(70, false);
                        </script>   
                        <div id="hc_evt_locationTemplate" class="hc_e_currentLocation" title="Current Location" style="display:none;"><span></span></div>
                        <script type="text/javascript">
                            (function () {

                                HC.Map.setOptions({
                                    containerId: '#hc_map_full',
                                    googleLanguageCode: 'es',
                                    iconSprite: 'https://cdn.datahc.com/Images/Maps/map_pins.png?cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa',
                                    iconLandmark: 'https://cdn.datahc.com/Images/Maps/landmark.png?cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa',
                                    soldText: 'COMPLETO',
                                    spinnerTemplate: '<img class="spinner-small" src="https://cdn.datahc.com/Content/Images/Mobile/Shared/hc_loader1.gif?cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa" />',
                                    noImageUrl: 'https://cdn.datahc.com/Images/hc_no_image.gif?cdn=1.0.2017.331004-C954e368cf9f3bcbf70e10d20fcb81d777a3ce2fa',
                                    tooltipElement: $('#hc_map_tt')[0],
                                    locationControlTemplate: $('#hc_evt_locationTemplate')[0]
                                });

                                HC.Translations.setMultiple([
                                    ['SearchResultItemHotelRating', 'Clasificación de hoteles'],
                                    ['SearchResultItemAddress', 'Dirección'],
                                    ['CityPagePriceFrom', 'desde'],
                                    ['HotelPageBook', 'Seleccionar'],
                                    ['MapsZoomInLink', 'Acercar el zoom'],
                                    ['MapsZoomOutLink', 'Alejar el zoom'],
                                    ['SearchResultItemPrice', 'Precio']
                                ]);

                            })();
                        </script>
                        <div style="display: none;">
                            <div class="hc-mapfilters" data-section-filter>

                                <span class="hc-filtertagwrapper" data-bind="foreach: allItems" data-section-summary>
                                    <span data-bind="html: getSummary(), click: $root.summaryItemClicked, css: { 'hc-filtertag--starrating': $data.isStarRating, 'hc-filtertag--clearall': $data.isClearAll }" class="hc-filtertag"></span>
                                </span>        

                                <div class="hc-mapfilters__button" data-section-refine>
                                    <a href="javascript:void(0);" class="hc-mapfilters__buttonlink">Filtrar</a>
                                </div>
                                <div class="hc-mapfilters__options" style="display: none;" data-section-filtermain>
                                    <input style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="submit">
                                    <div class="hc-filter" data-bind="with: starRatings">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink"><span data-bind="visible: canShowStarRating()">Clasificaci&#243;n por estrellas</span><span data-bind="visible: !canShowStarRating()">Categor&#237;a del establecimiento</span></a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: items">
                                                <div class="hc-checkbox" data-bind="css: 'hc_f_mapfilter_star_' + value()">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="checked: selected, attr: { id: 'hc_f_mapfilter_star_' + value(), name: 'hc_f_mapfilter_star_' + value(), value: value() }"/>
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_star_' + value(), 'title': description }" class="hc-checkbox__label">
                                                        <span data-bind="renderStarRatingFilter: $data"></span>
                                                    </label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="hc-filter" data-bind="with: priceRanges">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink">Precio (por noche)</a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: ranges">
                                                <div class="hc-checkbox">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="click: $parent.clicked, checked: selected, attr: { id: 'hc_f_mapfilter_price_' + value(), value: value(), disabled: disabled }"/>
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_price_' + value() }, html: description" class="hc-checkbox__label"></label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="hc-filter" data-bind="with: guestRatings">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink">Puntuaci&#243;n de los hu&#233;spedes</a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: ratings">
                                                <div class="hc-checkbox">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="checked: selected, attr: { id: 'hc_f_mapfilter_guestrating_' + value(), value: value() }" />
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_guestrating_' + value() }, html: description" class="hc-checkbox__label"></label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="hc-filter" data-bind="with: propertyTypes">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink">Tipo de alojamiento</a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: types">
                                                <div class="hc-checkbox">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="checked: selected, attr: { id: 'hc_f_mapfilter_propertytype_' + value(), value: value() }"/>
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_propertytype_' + value() }, text: description" class="hc-checkbox__label"></label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="hc-filter" data-bind="with: facilities">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink">Instalaciones y servicios del establecimiento</a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: facilities">
                                                <div class="hc-checkbox">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="checked: selected, attr: { id: 'hc_f_mapfilter_facility_' + value(), value: value() }"/>
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_facility_' + value() }, text: description" class="hc-checkbox__label"></label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="hc-filter" data-bind="with: themes">
                                        <h3 class="hc-filter__header">
                                            <a href="javascript:void(0);" rel="nofollow" data-bind="click: $root.expandContract, css: { 'hc-filter__headerlink--expanded': visible }" class="hc-filter__headerlink">Tema</a>
                                        </h3>
                                        <div class="hc-filter__options" data-bind="slide: visible">
                                            <fieldset class="hc-filter__fieldset" data-bind="foreach: themes">
                                                <div class="hc-checkbox">
                                                    <input type="checkbox" class="hc-checkbox__input" data-bind="checked: selected, attr: { id: 'hc_f_mapfilter_theme_' + value(), value: value() }"/>
                                                    <label data-bind="attr: { 'for': 'hc_f_mapfilter_theme_' + value() }, text: description" class="hc-checkbox__label"></label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script>
                            (function () {

                                if (!HC.Map.Filter) {
                                    return;
                                }

                                var wrapper = HC.Common.scriptPreviousSibling();
                                HC.Map.Filter.init({
                                    filterTemplate: wrapper.find('[data-section-filter]'),
                                    refineSection: wrapper.find('[data-section-refine]'),
                                    mainSection: wrapper.find('[data-section-filtermain]'),
                                    summarySection: wrapper.find('[data-section-summary]'),
                                    summaryHolder: $('#hc_map_evt_summary'),
                                    mapContainer: $('#hc_map_full'),
                                    data: {
                                        starRatings: { "Items": [{ "IsSelected": false, "Rating": { "IsRated": true, "IsSelfRated": false, "Value": 1.0, "NormalisedValue": 1 }, "Value": "1" }, { "IsSelected": false, "Rating": { "IsRated": true, "IsSelfRated": false, "Value": 2.0, "NormalisedValue": 2 }, "Value": "2" }, { "IsSelected": false, "Rating": { "IsRated": true, "IsSelfRated": false, "Value": 3.0, "NormalisedValue": 3 }, "Value": "3" }, { "IsSelected": false, "Rating": { "IsRated": true, "IsSelfRated": false, "Value": 4.0, "NormalisedValue": 4 }, "Value": "4" }, { "IsSelected": false, "Rating": { "IsRated": true, "IsSelfRated": false, "Value": 5.0, "NormalisedValue": 5 }, "Value": "5" }], "CanShowStarRating": true, "CanShowFilter": false },
                                        ratingDescriptions: { "1": "1 estrella", "2": "2 estrellas", "3": "3 estrellas", "4": "4 estrellas", "5": "5 estrellas" },
                                        chains: [{ "ID": 1092, "IsDefault": true, "IsSelected": false, "Text": "Hoteles San Agustin", "Value": "1092" }, { "ID": 228, "IsDefault": true, "IsSelected": false, "Text": "Thunderbird", "Value": "228" }, { "ID": 1080, "IsDefault": true, "IsSelected": false, "Text": "Hoteles Estelar", "Value": "1080" }, { "ID": 43, "IsDefault": true, "IsSelected": false, "Text": "Radisson", "Value": "43" }, { "ID": 143, "IsDefault": true, "IsSelected": false, "Text": "Sonesta Collection Hotels", "Value": "143" }],
                                        facilities: [{ "IsDefault": true, "IsSelected": false, "Text": "Cocina", "Value": "50" }, { "IsDefault": true, "IsSelected": false, "Text": "Cocina integral", "Value": "298" }, { "IsDefault": true, "IsSelected": false, "Text": "Conexión a internet de alta velocidad", "Value": "3" }, { "IsDefault": true, "IsSelected": false, "Text": "Parking", "Value": "6" }, { "IsDefault": true, "IsSelected": false, "Text": "Piscina", "Value": "7" }, { "IsDefault": true, "IsSelected": false, "Text": "Recepción abierta 24 h", "Value": "18" }, { "IsDefault": true, "IsSelected": false, "Text": "Restaurante", "Value": "5" }, { "IsDefault": true, "IsSelected": false, "Text": "Sala de fitness/gimnasio", "Value": "4" }, { "IsDefault": true, "IsSelected": false, "Text": "Spa y centro de bienestar", "Value": "193" }, { "IsDefault": true, "IsSelected": false, "Text": "Traslados al aeropuerto", "Value": "9" }, { "IsDefault": true, "IsSelected": false, "Text": "Wi-Fi", "Value": "202" }, { "IsDefault": true, "IsSelected": false, "Text": "Wi-Fi gratuito", "Value": "299" }],
                                        guestRatings: [{ "DisplayRating": 9, "IsSelected": false, "Ratings": [9, 10], "Value": "9,10" }, { "DisplayRating": 8, "IsSelected": false, "Ratings": [8], "Value": "8" }, { "DisplayRating": 7, "IsSelected": false, "Ratings": [7], "Value": "7" }, { "DisplayRating": 6, "IsSelected": false, "Ratings": [6], "Value": "6" }, { "DisplayRating": -1, "IsSelected": false, "Ratings": [-1], "Value": "-1" }],
                                        guestRatingsDescriptions: { "9": "Magn&#237;fico: 9", "8": "Muy bueno: 8", "7": "Bueno: 7", "6": "Agradable: 6", "-1": "Sin puntuaci&#243;n" },
                                        priceRanges: [{ "IsSelected": false, "PriceFrom": 0.0, "DisplayPriceFrom": {}, "PriceTo": 200.0, "DisplayPriceTo": {}, "Value": "0-200", "PriceRangeLayoutTranslationKey": "PriceRangeHighAndLow" }, { "IsSelected": false, "PriceFrom": 200.0, "DisplayPriceFrom": {}, "PriceTo": 400.0, "DisplayPriceTo": {}, "Value": "200-400", "PriceRangeLayoutTranslationKey": "PriceRangeHighAndLow" }, { "IsSelected": false, "PriceFrom": 400.0, "DisplayPriceFrom": {}, "PriceTo": 500.0, "DisplayPriceTo": {}, "Value": "400-500", "PriceRangeLayoutTranslationKey": "PriceRangeHighAndLow" }, { "IsSelected": false, "PriceFrom": 500.0, "DisplayPriceFrom": {}, "PriceTo": 700.0, "DisplayPriceTo": {}, "Value": "500-700", "PriceRangeLayoutTranslationKey": "PriceRangeHighAndLow" }, { "IsSelected": false, "PriceFrom": 700.0, "DisplayPriceFrom": {}, "PriceTo": 79228162514264337593543950335.0, "DisplayPriceTo": {}, "Value": "700", "PriceRangeLayoutTranslationKey": "PriceRangeLowOnly" }],
                                        lastPriceRangeValue: "700",
                                        priceDescriptions: { "0-200": "<span class='hc_f_filter_price_lower'><span class=\"hc_pr_cur\">PEN</span> 0<span class=\"hc_pr_syb\"></span></span> - <span class='hc_f_filter_price_upper'><span class=\"hc_pr_cur\">PEN</span> 199<span class=\"hc_pr_syb\"></span></span>", "200-400": "<span class='hc_f_filter_price_lower'><span class=\"hc_pr_cur\">PEN</span> 200<span class=\"hc_pr_syb\"></span></span> - <span class='hc_f_filter_price_upper'><span class=\"hc_pr_cur\">PEN</span> 399<span class=\"hc_pr_syb\"></span></span>", "400-500": "<span class='hc_f_filter_price_lower'><span class=\"hc_pr_cur\">PEN</span> 400<span class=\"hc_pr_syb\"></span></span> - <span class='hc_f_filter_price_upper'><span class=\"hc_pr_cur\">PEN</span> 499<span class=\"hc_pr_syb\"></span></span>", "500-700": "<span class='hc_f_filter_price_lower'><span class=\"hc_pr_cur\">PEN</span> 500<span class=\"hc_pr_syb\"></span></span> - <span class='hc_f_filter_price_upper'><span class=\"hc_pr_cur\">PEN</span> 699<span class=\"hc_pr_syb\"></span></span>", "700": "Más de <span class='hc_f_filter_price_lower'><span class=\"hc_pr_cur\">PEN</span> 700<span class=\"hc_pr_syb\"></span></span>" },
                                        propertyTypes: [{ "IsSelected": false, "Text": "Apartamento", "Value": "9" }, { "IsSelected": false, "Text": "Apartamento equipado", "Value": "33" }, { "IsSelected": false, "Text": "Bed & breakfast", "Value": "3" }, { "IsSelected": false, "Text": "Casa de huéspedes", "Value": "16" }, { "IsSelected": false, "Text": "Hostal", "Value": "5" }, { "IsSelected": false, "Text": "Hotel", "Value": "0" }, { "IsSelected": false, "Text": "Hotel-Inn", "Value": "2" }, { "IsSelected": false, "Text": "Motel", "Value": "1" }, { "IsSelected": false, "Text": "Resort", "Value": "7" }, { "IsSelected": false, "Text": "Villas", "Value": "20" }],
                                        themes: [{ "IsSelected": false, "Text": "Boutique / Diseño", "Value": "17" }, { "IsSelected": false, "Text": "Campo", "Value": "15" }, { "IsSelected": false, "Text": "Ciudad", "Value": "2" }, { "IsSelected": false, "Text": "Compras", "Value": "5" }, { "IsSelected": false, "Text": "Deporte / Ocio", "Value": "13" }, { "IsSelected": false, "Text": "Ecológico", "Value": "21" }, { "IsSelected": false, "Text": "Esquí / Deportes de invierno", "Value": "19" }, { "IsSelected": false, "Text": "Estancias románticas", "Value": "10" }, { "IsSelected": false, "Text": "Familias", "Value": "9" }, { "IsSelected": false, "Text": "Gastronomía", "Value": "7" }, { "IsSelected": false, "Text": "Historia", "Value": "16" }, { "IsSelected": false, "Text": "Lujo", "Value": "8" }, { "IsSelected": false, "Text": "Naturaleza / Aire libre", "Value": "18" }, { "IsSelected": false, "Text": "Negocios", "Value": "12" }, { "IsSelected": false, "Text": "Playa / Costa", "Value": "1" }, { "IsSelected": false, "Text": "Recorridos turísticos", "Value": "6" }, { "IsSelected": false, "Text": "Respetuoso con el colectivo LGBT", "Value": "20" }, { "IsSelected": false, "Text": "Spa / Relajación", "Value": "14" }, { "IsSelected": false, "Text": "Turismo de mochila / Económico", "Value": "3" }],
                                        clearAll: 'BORRAR TODO'
                                    }
                                });
                            })();

                        </script>

                        <!-- User new tooltip -->
                        <script>
                            HC.Map.setOptions({
                                tooltipElement: $('#hc_map_tt_alternate')
                            });
                        </script>
	                    <div id="hc_sr_progress"></div>
		                <div id="SearchResultsBody" class="hc_r_5" >
                          <div id="hc_sr_loadingSRIs" class="hc_e_spinner_v2 hc_sr_loadingSRIs" style="display: none;"></div>
                          <div id="SearchResultsHolder" class="resultsHolder" data-hasresults="true" data-totalresults="1455" data-totalfilteredresults="599" data-iscomplete="true" data-totalpages="40" data-pagenumber="1" data-hotelsavailabletranslation="599 disponibles" data-propertiesavailabletranslation="599 establecimientos disponibles" data-searchresults>
                              <div id="hc_sr" class="hc_sr_summary">
                                <div id="sortingOverlayDiv" class="hc-sortingoverlay"></div>
                                <%--AQUI VA EL DETALLE DE LOS HOTELES--%>

                              </div>


                              <div id="pagination" class="paginationWrap">
                                <div class="paginationListWrap" data-pagetype="PrevNext" data-totalpages="40">
                                    <div class="hc_f_t_btn hc_paging_btn_next">
                                      <a data-paging="next" data-pageindex="1" class="hc_f_btn_v37" href="javascript:void(0)" onclick="HC.SR.Paging.ReloadPage(this, 1);return false;" title="Siguiente">Siguiente <span class="hc_icon hc_t_pagination_next"></span></a>
                                    </div>
                                    <div class="cDivBoth"></div>
                                </div>
                              </div>
                          </div>
                          <script id="hc_f_sr_lowAvailability_searchradius" type="text/ignore" style="display: none;">
                              null
                          </script>
                          <script id="hc_f_sr_filter_hotelCounts" type="text/ignore" style="display:none;">
                            {
                                "counts": {"availableDeals":{"1":6},"availableFacility":{"5":177,"6":56,"7":24,"9":64,"11":40,"12":44,"13":70,"15":98,"20":23,"21":70,"30":42,"31":56,"33":103,"39":72,"40":38,"46":62,"47":37,"49":35,"53":93,"60":167,"66":67,"141":13,"189":14,"193":35,"202":378,"209":116,"253":82,"278":9,"298":23,"299":367,"1":73,"2":63,"4":68,"14":19,"18":141,"27":7,"34":39,"41":127,"56":160,"136":43,"185":18,"191":16,"210":72,"211":70,"255":24,"270":19,"281":42,"63":22,"139":33,"19":30,"45":16,"240":29,"17":47,"22":48,"35":20,"44":10,"51":19,"52":27,"212":45,"222":11,"297":4,"57":10,"58":17,"62":19,"92":11,"3":15,"232":5,"64":21,"221":5,"252":2,"257":18,"292":5,"203":6,"43":4,"194":4,"242":2,"220":4,"23":2,"8":8,"148":2,"208":6,"225":1,"38":4,"24":1,"263":4,"256":7,"243":2,"248":2,"258":2,"274":3,"99":2,"264":2,"90":2,"104":1,"229":8,"10":13,"181":13,"98":8,"50":1,"259":3,"128":1,"216":1,"254":1,"59":1,"182":1},"availableGuestRating":{"9,10":50,"8":111,"7":107,"6":40,"-1":279},"availableHotelChain":{"467":1,"1080":2,"457":1,"120":1,"1092":3,"38":1,"139":1,"143":2,"34":1,"81":1,"228":3,"187":1,"43":2,"70":1,"406":1,"351":1,"544":1,"141":1,"499":1,"446":1,"1979":1},"availableStarRating":{"2":81,"3":148,"4":59,"5":30,"1":281},"availablePrice":{"0-200":347,"200-400":190,"400-500":33,"500-700":23,"700":6},"availableTheme":{"5":77,"6":166,"7":111,"8":46,"9":49,"10":25,"12":57,"13":36,"1":33,"17":47,"2":54,"14":20,"16":1,"3":86},"availablePropertyType":{"0":254,"33":20,"16":56,"5":38,"3":55,"9":119,"2":15,"32":33,"4":3,"13":1,"8":5},"deals":{"1":6},"facility":{"5":177,"6":56,"7":24,"9":64,"11":40,"12":44,"13":70,"15":98,"20":23,"21":70,"30":42,"31":56,"33":103,"39":72,"40":38,"46":62,"47":37,"49":35,"53":93,"60":167,"66":67,"141":13,"189":14,"193":35,"202":378,"209":116,"253":82,"278":9,"298":23,"299":367,"1":73,"2":63,"4":68,"14":19,"18":141,"27":7,"34":39,"41":127,"56":160,"136":43,"185":18,"191":16,"210":72,"211":70,"255":24,"270":19,"281":42,"63":22,"139":33,"19":30,"45":16,"240":29,"17":47,"22":48,"35":20,"44":10,"51":19,"52":27,"212":45,"222":11,"297":4,"57":10,"58":17,"62":19,"92":11,"3":15,"232":5,"64":21,"221":5,"252":2,"257":18,"292":5,"203":6,"43":4,"194":4,"242":2,"220":4,"23":2,"8":8,"148":2,"208":6,"225":1,"38":4,"24":1,"263":4,"256":7,"243":2,"248":2,"258":2,"274":3,"99":2,"264":2,"90":2,"104":1,"229":8,"10":13,"181":13,"98":8,"50":1,"259":3,"128":1,"216":1,"254":1,"59":1,"182":1},"guestRating":{"9,10":50,"8":111,"7":107,"6":40,"-1":279},"price":{"0-200":347,"200-400":190,"400-500":33,"500-700":23,"700":6},"propertyType":{"0":254,"33":20,"16":56,"5":38,"3":55,"9":119,"2":15,"32":33,"4":3,"13":1,"8":5},"starRating":{"2":81,"3":148,"4":59,"5":30,"1":281},"theme":{"5":77,"6":166,"7":111,"8":46,"9":49,"10":25,"12":57,"13":36,"1":33,"17":47,"2":54,"14":20,"16":1,"3":86},"hotelChain":{"467":1,"1080":2,"457":1,"120":1,"1092":3,"38":1,"139":1,"143":2,"34":1,"81":1,"228":3,"187":1,"43":2,"70":1,"406":1,"351":1,"544":1,"141":1,"499":1,"446":1,"1979":1}},
                                "html": { "availableHotelChain": "\u003cfieldset data-count=\"5\" data-section=\"fieldset\"\u003e\r\n        \u003cdiv class=\"hc_f_t_cb\" data-item-container=\"cb\"\u003e\r\n            \u003clabel for=\"hc_f_filter_chain_1092\"\u003e\r\n                \u003cspan\u003eHoteles San Agustin\u003c/span\u003e\r\n                \u003cspan class=\"hc_e_numHtls\" data-section=\"hotelCount\"\u003e\u003c/span\u003e\r\n                \u003cinput type=\"checkbox\" name=\"hc_f_filter_chain_1092\" id=\"hc_f_filter_chain_1092\" value=\"1092\" onclick=\"HC.SR.Filter.SetHotelChains(this)\" /\u003e\r\n            \u003c/label\u003e\r\n        \u003c/div\u003e\r\n        \u003cdiv class=\"hc_f_t_cb\" data-item-container=\"cb\"\u003e\r\n            \u003clabel for=\"hc_f_filter_chain_228\"\u003e\r\n                \u003cspan\u003eThunderbird\u003c/span\u003e\r\n                \u003cspan class=\"hc_e_numHtls\" data-section=\"hotelCount\"\u003e\u003c/span\u003e\r\n                \u003cinput type=\"checkbox\" name=\"hc_f_filter_chain_228\" id=\"hc_f_filter_chain_228\" value=\"228\" onclick=\"HC.SR.Filter.SetHotelChains(this)\" /\u003e\r\n            \u003c/label\u003e\r\n        \u003c/div\u003e\r\n        \u003cdiv class=\"hc_f_t_cb\" data-item-container=\"cb\"\u003e\r\n            \u003clabel for=\"hc_f_filter_chain_1080\"\u003e\r\n                \u003cspan\u003eHoteles Estelar\u003c/span\u003e\r\n                \u003cspan class=\"hc_e_numHtls\" data-section=\"hotelCount\"\u003e\u003c/span\u003e\r\n                \u003cinput type=\"checkbox\" name=\"hc_f_filter_chain_1080\" id=\"hc_f_filter_chain_1080\" value=\"1080\" onclick=\"HC.SR.Filter.SetHotelChains(this)\" /\u003e\r\n            \u003c/label\u003e\r\n        \u003c/div\u003e\r\n        \u003cdiv class=\"hc_f_t_cb\" data-item-container=\"cb\"\u003e\r\n            \u003clabel for=\"hc_f_filter_chain_43\"\u003e\r\n                \u003cspan\u003eRadisson\u003c/span\u003e\r\n                \u003cspan class=\"hc_e_numHtls\" data-section=\"hotelCount\"\u003e\u003c/span\u003e\r\n                \u003cinput type=\"checkbox\" name=\"hc_f_filter_chain_43\" id=\"hc_f_filter_chain_43\" value=\"43\" onclick=\"HC.SR.Filter.SetHotelChains(this)\" /\u003e\r\n            \u003c/label\u003e\r\n        \u003c/div\u003e\r\n        \u003cdiv class=\"hc_f_t_cb\" data-item-container=\"cb\"\u003e\r\n            \u003clabel for=\"hc_f_filter_chain_143\"\u003e\r\n                \u003cspan\u003eSonesta Collection Hotels\u003c/span\u003e\r\n                \u003cspan class=\"hc_e_numHtls\" data-section=\"hotelCount\"\u003e\u003c/span\u003e\r\n                \u003cinput type=\"checkbox\" name=\"hc_f_filter_chain_143\" id=\"hc_f_filter_chain_143\" value=\"143\" onclick=\"HC.SR.Filter.SetHotelChains(this)\" /\u003e\r\n            \u003c/label\u003e\r\n        \u003c/div\u003e\r\n\u003c/fieldset\u003e" }
                            }
                          </script>
                          <div class="hc_r_clear"></div>
		                </div>
	                    <div class="hc_r_clear"></div>
	                  </div>
	                  <div class="hc_r_clear"></div>
                    </div>
                    <div id="hc_r_2">
	                  <a id="hc_section_checkPrices" name="hc_section_checkPrices"></a>
                      <div id="hc_checkPrices" class="hc_m_v2">
                          <b class="b1h"></b><b class="b2h"></b><b class="b3h"></b><b class="b4h"></b><div class="hc_m_outer">	<div class="hc_m_hd">		<h2>Buscar hoteles</h2>	</div>	<div class="hc_m_content">

                          <a href="javascript:void(0);" data-action="hidesearchbox" class="hc_m_close" style="display:none">Ocultar<span></span></a>
                          <fieldset>
                                  <div class="hc_f_t_search hc_f_where" data-destinatioinput>
                                      <label for="hc_f_id_where_1">&#191;D&#243;nde?</label>
                                      <%--<input type="search" name="hc_f_id_where_1" id="hc_f_id_where_1" title="ej. ciudad, regi&#243;n, distrito u hotel" placeholder="ej. ciudad, regi&#243;n, distrito u hotel"/>--%>
                                      <asp:TextBox ID="txtDestino" runat="server" CssClass="search__form__text"></asp:TextBox>
                                  </div>
                                  <div data-hidewhenminimised>
                                      <div class="hc_f_t_date5 hc_f_checkin" data-section="checkin" style="display:none;">
                                          <label for="hc_f_id_checkin_1_1">Fecha de entrada</label>
                                          <div class="hc_f_t_i2 hc_f_day">
                                              <input id="txtFechaIni" data-element="cal_input"  type="date"/>
                                          </div>
                                      </div>
                                      <div class="hc_f_t_date5 hc_f_checkout" data-section="checkout" style="display:none;">
                                          <label for="hc_f_id_checkout_1_1">Fecha de salida</label>
                                          <div class="hc_f_t_i2 hc_f_day">    
                                              <input id="txtFechaFin" data-element="cal_input"  type="date"/>
                                          </div>
                                      </div>

	                                  <div class="hc_f_t_cb hc_f_noDates">
	                                      <label for="hc_f_id_noDates_1">
	                                          <span>Todav&#237;a no tengo fechas espec&#237;ficas</span>
	                                          <input type="checkbox" id="hc_f_id_noDates_1" value="0"/>
	                                      </label>
	                                  </div>


                                      <div class=" hc_f_t_s2 hc_f_guestsRooms">
                                          <label for="hc_f_id_guestsRooms_1">
                                              <span>Hu&#233;spedes</span>
                                              <select name="hc_f_id_guestsRooms_" id="hc_f_id_guestsRooms_1" class="hc_evt_roomsGuests">
                                                      <option value="1-1">1 adulto</option>
                                                      <option value="2-1" selected="selected">2 adultos en 1 habitaci&#243;n</option>
                                                      <option value="3-1">3 adultos en 1 habitaci&#243;n</option>
                                                      <option value="4-1">4 adultos en 1 habitaci&#243;n</option>
                                                      <option value="2-2">2 adultos en 2 habitaciones</option>
                                                      <option value="0">M&#225;s opciones...</option>
                                              </select>
                                          </label>
                                      </div>
                                      <div class="hc_f_t_roomConfig hc_f_roomConfig" data-section="roomConfig">
                                          <div class="hc_f_t_btn hc_f_add">
                                              <a href="javascript:void(0);" class="hc_evt_addRoom">A&#241;adir otra habitaci&#243;n<span></span></a>
                                          </div>
                                      </div>
                                      <script type="text/javascript">
                                          HC.RoomConfig.setInitialValues({
                                              childrenCount: [],
                                              dropdownValue: '2-1'
                                          });
                                      </script>

                                      <div class="hc_f_t_btn hc_f_submit" data-section="submitButton">
                                          <a class="hc_f_btn_v9" rel="nofollow" title="" onclick="return HC.SearchBox.getRates($('#hc_checkPrices'), { changeClass: ['', 'hc_active'], searchButton: this, searchingStr: 'Buscando<span></span>', skipFilters: false }); ">Buscar<span></span></a>
                                      </div>

                                  </div>
                                  <div class="cDivBoth"></div>

                              </fieldset>

                          </div>	<div class="hc_m_ft"></div></div><b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b class="b1h"></b>	
                      </div>
	                  <a id="hc_section_refinePrices" name="hc_section_refinePrices"></a>
                      <div id="hc_refinePrices" class="hc_m_v16">
                        <b class="b1h"></b><b class="b2h"></b><b class="b3h"></b><b class="b4h"></b><div class="hc_m_outer">	<div class="hc_m_hd">		<h2>Refina tu b&#250;squeda</h2>	</div>	<div class="hc_m_content">

                        <form class="hc_f">
                        <input style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="submit">
                        <div id="hc_filter_hotelRating" class="hc_filter hc_m" i="3" data-section="filterPanel">
                            <div class="hc_m_hd" data-section="filterHeading">
                                <h3><a href="javascript:void(0);" rel="nofollow"><span class="hc_icon hc_t_accordion"></span>Clasificaci&#243;n por estrellas</a></h3>
                            </div>
                            <div class="hc_m_content">
                                <fieldset>
                                        <div class="hc_f_t_cb hc_f_filter_hotelRating_star1" data-item-container="cb">
                                            <label for="hc_f_filter_star_1" title="1 estrella">
                                                <p class="hc-hotelrating hc-hotelrating--star" title="(1 estrella)"><span class="hc-hotelrating__value hc-hotelrating__value--1"></span></p><span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input type="checkbox" name="hc_f_filter_star_1" id="hc_f_filter_star_1" value="1" onclick="HC.SR.Filter.SetStarRatings(this);" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb hc_f_filter_hotelRating_star2" data-item-container="cb">
                                            <label for="hc_f_filter_star_2" title="2 estrellas">
                                                <p class="hc-hotelrating hc-hotelrating--star" title="(2 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--2"></span></p><span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input type="checkbox" name="hc_f_filter_star_2" id="hc_f_filter_star_2" value="2" onclick="HC.SR.Filter.SetStarRatings(this);" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb hc_f_filter_hotelRating_star3" data-item-container="cb">
                                            <label for="hc_f_filter_star_3" title="3 estrellas">
                                                <p class="hc-hotelrating hc-hotelrating--star" title="(3 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--3"></span></p><span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input type="checkbox" name="hc_f_filter_star_3" id="hc_f_filter_star_3" value="3" onclick="HC.SR.Filter.SetStarRatings(this);" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb hc_f_filter_hotelRating_star4" data-item-container="cb">
                                            <label for="hc_f_filter_star_4" title="4 estrellas">
                                                <p class="hc-hotelrating hc-hotelrating--star" title="(4 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--4"></span></p><span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input type="checkbox" name="hc_f_filter_star_4" id="hc_f_filter_star_4" value="4" onclick="HC.SR.Filter.SetStarRatings(this);" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb hc_f_filter_hotelRating_star5" data-item-container="cb">
                                            <label for="hc_f_filter_star_5" title="5 estrellas">
                                                <p class="hc-hotelrating hc-hotelrating--star" title="(5 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--5"></span></p><span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input type="checkbox" name="hc_f_filter_star_5" id="hc_f_filter_star_5" value="5" onclick="HC.SR.Filter.SetStarRatings(this);" />
                                            </label>
                                        </div>
                                </fieldset>
                            </div>
                            <script type="text/javascript">
                                HC.SR.Filter.SetupFilter(3, $("#hc_filter_hotelRating"), { activeType: "check", activeValue: true });
                            </script>
                        </div>    
                        <div id="hc_filter_price" class="hc_filter hc_m" i="2" data-section="filterPanel">
                            <div class="hc_m_hd" data-section="filterHeading">
                                <h3><a href="javascript:void(0);" rel="nofollow"><span class="hc_icon hc_t_accordion"></span>Precio (por noche)</a></h3>
                            </div>
                            <div class="hc_m_content">
                                <fieldset>

                                        <div class="hc_f_t_cb" data-item-container="cb">
                                            <label for="hc_f_filter_price_0">
                                                <span><span class='hc_f_filter_price_lower'><span class="hc_pr_cur">PEN</span> 0<span class="hc_pr_syb"></span></span> - <span class='hc_f_filter_price_upper'><span class="hc_pr_cur">PEN</span> 199<span class="hc_pr_syb"></span></span></span>
                                                <span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input id="hc_f_filter_price_0" type="checkbox" value="0-200" onclick="HC.SR.Filter.SetPriceRange($('#hc_filter_price'))" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb" data-item-container="cb">
                                            <label for="hc_f_filter_price_1">
                                                <span><span class='hc_f_filter_price_lower'><span class="hc_pr_cur">PEN</span> 200<span class="hc_pr_syb"></span></span> - <span class='hc_f_filter_price_upper'><span class="hc_pr_cur">PEN</span> 399<span class="hc_pr_syb"></span></span></span>
                                                <span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input id="hc_f_filter_price_1" type="checkbox" value="200-400" onclick="HC.SR.Filter.SetPriceRange($('#hc_filter_price'))" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb" data-item-container="cb">
                                            <label for="hc_f_filter_price_2">
                                                <span><span class='hc_f_filter_price_lower'><span class="hc_pr_cur">PEN</span> 400<span class="hc_pr_syb"></span></span> - <span class='hc_f_filter_price_upper'><span class="hc_pr_cur">PEN</span> 499<span class="hc_pr_syb"></span></span></span>
                                                <span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input id="hc_f_filter_price_2" type="checkbox" value="400-500" onclick="HC.SR.Filter.SetPriceRange($('#hc_filter_price'))" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb" data-item-container="cb">
                                            <label for="hc_f_filter_price_3">
                                                <span><span class='hc_f_filter_price_lower'><span class="hc_pr_cur">PEN</span> 500<span class="hc_pr_syb"></span></span> - <span class='hc_f_filter_price_upper'><span class="hc_pr_cur">PEN</span> 699<span class="hc_pr_syb"></span></span></span>
                                                <span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input id="hc_f_filter_price_3" type="checkbox" value="500-700" onclick="HC.SR.Filter.SetPriceRange($('#hc_filter_price'))" />
                                            </label>
                                        </div>
                                        <div class="hc_f_t_cb" data-item-container="cb">
                                            <label for="hc_f_filter_price_4">
                                                <span>M&#225;s de <span class='hc_f_filter_price_lower'><span class="hc_pr_cur">PEN</span> 700<span class="hc_pr_syb"></span></span></span>
                                                <span class="hc_e_numHtls" data-section="hotelCount"></span>
                                                <input id="hc_f_filter_price_4" type="checkbox" value="700" onclick="HC.SR.Filter.SetPriceRange($('#hc_filter_price'))" />
                                            </label>
                                        </div>
                                </fieldset>
                                <script type="text/javascript">
                                    HC.SR.Filter.renderPriceRanges($('#hc_filter_price'))
                                </script>
                            </div>
                            <script type="text/javascript">
                                    HC.SR.Filter.SetupFilter(2, $("#hc_filter_price"), { activeType: "check", activeValue: true });
                            </script>
                        </div>
                        </form>
                        <script type="text/javascript">
                                HC.Translations.set('RemoveFiltersToSeeResults', 'Para ver más propiedades intenta eliminar los filtros que has seleccionado con anterioridad');
                                HC.SR.Filter.publishFiltersRendered();
                        </script>	
                        </div>	<div class="hc_m_ft"></div></div><b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b class="b1h"></b>
                      </div>
	                  <div class="hc_r_clear"></div>
                    </div>
                    <div id="hc_r_4">
	                    <div class="hc_r_clear"></div>
                    </div>
                    <div class="hc_r_clear"></div>
              </div>
              <div class='cDivBoth'></div>
              <div class="hc_ads">
                <div class="hc_ads_afs">
                  <div id="jc-hotels-combined-afs" class="banner banner--afs">
                    <script type="text/javascript">
                        (function (jt) {
                            var adsenseCreate = function () {
                                try {
                                    google.load("ads.search", "2");
                                } catch (err) { }
                                try {
                                    var options = {
                                        "pubId": "pub-6148753826516844",
                                        "query": "Hoteles :cityname".replace(':cityname', jcAFSQuery) + "",
                                        "hl": "es",
                                        "channel": "" + jcADSUnitId + ""
                                    },
                                        config = {
                                            'container': "jc-hotels-combined-afs",
                                            'width': "100%",
                                            'number': jcADSNumber || 2,
                                            'lines': "3",
                                            'fontFamily': "arial, sans-serif",
                                            'fontSizeTitle': "12",
                                            'fontSizeDescription': "12",
                                            'fontSizeDomainLink': "11",
                                            'line-height': "1.3",
                                            'linkTarget': "_blank",
                                            'colorTitleLink': "#0000CC",
                                            'colorText': "#000000",
                                            'colorDomainLink': "#008000",
                                            'colorBackground': "" + jcADSBckg + "" || '#FFFFFF',
                                            'colorBorder': "" + jcADSBckg + "" || '#FFFFFF',
                                            'titleBold': true,
                                            'rolloverLinkUnderline': true,
                                            'rolloverLinkBold': false,
                                            'rolloverLinkColor': "#FF0000",
                                            'rolloverLinkBackgroundColor': "" + jcADSBckg + "" || '#FFFFFF',
                                            'siteLinks': true,
                                            'sellerRatings': true,
                                            'plusOnes': false,
                                        };

                                    config['attributionTex'] = 'Anuncios';

                                    new google.ads.search.Ads(options, config);
                                } catch (err) { }
                            };
                            adsenseCreate();
                        })(window.jt = window.jt || {});
                        </script>
                  </div>        
                </div>
                <div class="hc_ads_dfp" style="margin-top: 16px">
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
            <footer class="footer2">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="main">
                                <div class="map">
                                    <h4>Sobre Jetcost</h4>
                                    <ul>
                                        <li>
                                            <a>Quiénes somos</a>
                                        </li>
                                        <li>
                                            <a>Contacto</a>
                                        </li>
                                        <li>
                                            <a>Protección de datos</a>
                                        </li>
                                        <li>
                                            <a>Información legal</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="map">
                                    <h4>Enlaces</h4>
                                    <ul>
                                                                    <li>
                                            <a>Compañías aéreas low cost</a>
                                        </li>
                                        <li>
                                            <a>Compañías aéreas</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="intl">
                                    <h4 class="intl">Jetcost internacional</h4>
                                 </div>
                                <div class="br"></div>
                        </div>
                    </div>
                </div>
            </footer>
            <br />
            <div class="hc_r_clear"></div>
        </div>
    </form>
  </body>
</html><script type="text/javascript">
    var Selecciono;
    $(document).ready(function () {
        BuscarHoteles();

        $(".hc_f_btn_v8").live('click' , function () {
            alert(1);
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

        function BuscarHoteles() {
            var dv_Hotel_Dinamico = '<div id="sortingOverlayDiv" class="hc-sortingoverlay"></div>';
            $.ajax({
                type: "POST",
                url: "ResultadosHoteles.aspx/ListarHotelesXBusqueda",
                data: "{'idDep': '" + $("#hdf_IdDepartamento").val() + "'," +
                       "'idProv': '" + $("#hdf_IdProvincia").val() + "'," +
                       "'idDist': '" + $("#hdf_IdDistrito").val() + "'," +
                       "'vcFechaI': '" + $("#hdf_FechaIni").val() + "'," +
                       "'vcFechaF': '" + $("#hdf_FechaFin").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    debugger;
                    for (var i = 0; i < result.d.length; i++) {
                        dv_Hotel_Dinamico += '<div id="sortingOverlayDiv" class="hc-sortingoverlay"></div>';
                        dv_Hotel_Dinamico += '<div class="hc_m_outer" style="height: 250px !important;">';
                        dv_Hotel_Dinamico += '<div class="hc_m_content" style="background: #edf1f6 !important;height: 250px !important;">';
                        dv_Hotel_Dinamico += '<div class="hc_hotel hc_sri_result">';
                        dv_Hotel_Dinamico += '<h3><a id="searchResultHeading1055048" title="" rel="nofollow">' + result.d[i]['nombre'] + '</a></h3>';
                        dv_Hotel_Dinamico += '<p class="hc-hotelrating hc-hotelrating--star" title="(5 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--5"></span></p>'
                        dv_Hotel_Dinamico += '<p class="hc_hotel_location">' + result.d[i]['nombre'] + '</p>';
                        dv_Hotel_Dinamico += '<a class="hc_hotel_photo"><img src=' + "'image/images" + (i + 1) + ".jpg'" + 'alt="" align="middle"/></a>';
                        dv_Hotel_Dinamico += '<p class="hc_hotel_userRating">Magnífico, 9.2</p>';
                        dv_Hotel_Dinamico += '<p class="hc_hotel_numberOfReviews " data-ceid="searchresult_numberofreviews_5">Basado en <span>3,599</span> comentarios</p>';
                        dv_Hotel_Dinamico += '<div class="hc_hotel_sentiments " data-ceid="searchresult_reviewquotes_5">';
                        dv_Hotel_Dinamico += '<ul><li>"Piscina estupenda",</li><li>"Internet gratis",</li><li>"Bueno para ir de compras"</li></ul>';
                        dv_Hotel_Dinamico += '</div>';
                        dv_Hotel_Dinamico += '<div class="hc_sri_result_promotedDeal" style="position: relative !important; margin-top: 0px !important; padding: 0px !important; min-height: 125px !important;">';
                        dv_Hotel_Dinamico += '<p class="hc_hotel_price " data-ceid="searchresult_promotedeal_price_2">';
                        dv_Hotel_Dinamico += '<span class="hc_pr_cur">PEN</span> ' + result.d[i].cuartos[0]["costo_noche"] + '<span class="hc_pr_cur"> por noche</span>';
                        dv_Hotel_Dinamico += '</p>';
                        dv_Hotel_Dinamico += '<p class="hc_hotel_roomsLeft">';
                        dv_Hotel_Dinamico += '</p>';
                        dv_Hotel_Dinamico += '<div class="hc_f_t_btn hc_f_viewDealButton " data-ceid="searchresult_promotedeal_viewdeal_2">';
                        dv_Hotel_Dinamico += '<input type="button" class="hc_f_btn_v8" data-track="SearchResultItem-ViewDeal" value="Ver oferta"/>';
                        dv_Hotel_Dinamico += '</div>';
                        dv_Hotel_Dinamico += '<p class="hc_hotel_provider">Hotel.info</p>';
                        dv_Hotel_Dinamico += '</div>';
                        dv_Hotel_Dinamico += '</div>';
                        dv_Hotel_Dinamico += '</div>';
                        dv_Hotel_Dinamico += '</div><div class="hc_m_ft"></div></div>';
                    }
                    $("#hc_sr").append(dv_Hotel_Dinamico);
                    //debugger;
                    //var cantLineas = result.d;
                    //alert(cantLineas);
                },
                error: function (xhr, err, thrErr) {
                    alert(thrErr);
                    //MostrarErrorAjax(xhr, err, thrErr);
                }
            });

        }


        //<div class="hc_m_outer" style="height: 250px !important;">
        //    <div class="hc_m_content" style="background: #edf1f6 !important;height: 250px !important;">
        //        <div class="hc_hotel hc_sri_result">
        //            <h3><a id="searchResultHeading1055048" title="" rel="nofollow">JW Marriott Hotel Lima</a></h3>
        //            <p class="hc-hotelrating hc-hotelrating--star" title="(5 estrellas)"><span class="hc-hotelrating__value hc-hotelrating__value--5"></span></p>
        //            <p class="hc_hotel_location">Distrito de Miraflores, Lima</p>
        //            <a class="hc_hotel_photo"><img src="https://edge.media.datahc.com/Z1055048.jpg?v=1383351933" alt="" /></a>
        //            <p class="hc_hotel_userRating">Magnífico, 9.2</p>
        //            <p class="hc_hotel_numberOfReviews " data-ceid="searchresult_numberofreviews_5">Basado en <span>3,599</span> comentarios</p>
        //            <div class="hc_hotel_sentiments " data-ceid="searchresult_reviewquotes_5">
        //                <ul><li>"Piscina estupenda",</li><li>"Internet gratis",</li><li>"Bueno para ir de compras"</li></ul>
        //            </div>
        //            <div class="hc_sri_result_promotedDeal" style="position: relative !important; margin-top: 0px !important; padding: 0px !important; min-height: 125px !important;">
        //                <p class="hc_hotel_price " data-ceid="searchresult_promotedeal_price_2">
        //                    <span class="hc_pr_cur">PEN</span> 936<span class="hc_pr_cur"> por noche</span>
        //                </p>
        //                <p class="hc_hotel_roomsLeft">
        //                </p>
        //                <div class="hc_f_t_btn hc_f_viewDealButton " data-ceid="searchresult_promotedeal_viewdeal_2">
        //                    <a href="/ProviderRedirect.ashx?key=0.6684843.62443466.0.PEN.1169771737&amp;saving=1370&amp;source=32-0" target="_blank" class="hc_f_btn_v8" data-track="SearchResultItem-ViewDeal">Ver oferta</a>
        //                </div>
        //                <p class="hc_hotel_provider">Hotel.info</p>
        //            </div>
        //        </div>
        //    </div>	<div class="hc_m_ft">
        //    </div>
        //</div>



    });
</script>




