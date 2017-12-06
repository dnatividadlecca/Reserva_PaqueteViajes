<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarVuelo.aspx.cs" Inherits="WebProyecto.BuscarVuelo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Scripts/jquery-1.7.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button type="button" id="btnBuscarHoteles" class="btn btn-primary col-xs-12">Buscar</button>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    $(document).ready(function () {
        $("#btnBuscarHoteles").click(function () {
            $.ajax({
                type: "POST",
                url: "BuscarVuelo.aspx/ListarHotelesXBusqueda",
                data:"{}",
                //data: "{'prvcCodCta': '2', 'prInCodSubCue': '1'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var cantLineas = result.d;
                    alert(cantLineas);
                },
                error: function (xhr, err, thrErr) {
                    alert(thrErr);
                    //MostrarErrorAjax(xhr, err, thrErr);
                }
            });
        });
        
    });
</script>


