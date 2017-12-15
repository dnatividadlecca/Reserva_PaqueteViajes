var lista;
var matriz;
var indicePagina = 0;
var registrosPagina = 15;

window.onload = function () {

    document.getElementById("btnBuscar").onclick = function () {
        var origen = document.getElementById("txtOrigen").value;
        var destino = document.getElementById("txtDestino").value;
        var fechaSalida = document.getElementById("txtfechaSalida").value;
        var fechaRegreso = document.getElementById("txtfechaRegreso").value;
        var nroPasajeros  = 0;
        get("http://localhost:56322/Vuelos/Buscar/?origen=" + origen + "&destino=" + destino + "&fechaSalida=" + fechaSalida + "&fechaRegreso=" + fechaRegreso + "&nroPasajeros=" + nroPasajeros, mostrarRpta);
    }

    document.getElementById("btnBorrarFiltros").onclick = function () {
        var cabeceras = document.getElementsByClassName("Cabecera");
        var nCabeceras = cabeceras.length;
        var valores = [];
        for (j = 0; j < nCabeceras; j++) {
            cabeceras[j].value = "";
        }
        filtrarTabla();
        x = 2;
    }
}

var get = function (url, callBack) {
    requestServer("get", url, callBack);
}


function requestServer(type, url, callBack, frm) {
    var xhr = new XMLHttpRequest();
    xhr.open(type, url);
    xhr.onreadystatechange = function () {
        if (xhr.status == 200 && xhr.readyState == 4) {
            if (callBack != null) callBack(xhr.responseText);
        }
    }
    if (type == "get") xhr.send();
    else {
        if (frm != null) xhr.send(frm);
    }
}

function mostrarRpta(rpta) {
    var contenido = "";
    if (rpta != "") {
        lista = rpta.split("¬");
        crearTabla();
        filtrarTabla();
    }
}

function filtrarTabla() {
    crearMatriz();
    mostrarMatriz();
}

function crearTabla() {
    var campos = lista[0].split("|");
    var nCampos = campos.length;
    var anchos = lista[1].split("|");
    var contenido = "<table><thead><tr class='FilaCabecera'>";
    var idCombo = "";
    for (var j = 0; j < nCampos; j++) {
        contenido += "<th style='width:";
        contenido += anchos[j];
        contenido += "px'>";
        contenido += campos[j];
        contenido += "<br/>";
        //contenido += "<input type='text' style='width:90%' class='Cabecera' onkeyup='filtrarTabla();' />";
        contenido += "</th>";
    }
    contenido += "</tr></thead><tbody id='tbVuelos'></tbody>";
    contenido += "<tfoot><tr><td id='tdPagina' colspan='";
    contenido += nCampos.toString();
    contenido += "' class='Centro'></td>";
    contenido += "</table>";
    document.getElementById("divVuelos").innerHTML = contenido;
}

function crearMatriz() {
    matriz = [];
    var campos;
    var nCampos;
    var registros = lista[2].split(',');
    var nRegistros = registros.length;
    var exito = true;
    var c = 0;
    var cabeceras = document.getElementsByClassName("Cabecera");
    var nCabeceras = cabeceras.length;
    var valores = [];
    for (j = 0; j < nCabeceras; j++) {
        valores.push(cabeceras[j].value);
    }
    for (var i = 2; i < nRegistros; i++) {
        campos = registros[i].split("|");
        nCampos = campos.length;
        exito = true;
        for (j = 0; j < nCabeceras; j++) {
            exito = (valores[j] == "" || campos[j].toLowerCase().indexOf(valores[j]) > -1);
            if (!exito) break;
        }
        if (exito) {
            matriz[c] = [];
            for (var j = 0; j < nCampos; j++) {
                if (isNaN(campos[j])) matriz[c][j] = campos[j];
                else matriz[c][j] = campos[j] * 1;
            }
            c++;
        }
    }
}

function mostrarMatriz() {
    var campos;
    var nRegistros = matriz.length;
    var nCampos = matriz[0].length;
    var contenido = "";
    var inicio = indicePagina * registrosPagina;
    var fin = inicio + registrosPagina;
    for (var i = inicio; i < fin; i++) {
        if (i < nRegistros) {
            contenido += "<tr class='FilaDatos'>";
            for (var j = 0; j < nCampos; j++) {
                contenido += "<td>";
                contenido += matriz[i][j];
                contenido += "</td>";
            }
            contenido += "</tr>";
        }
        else break;
    }
    document.getElementById("tbVuelos").innerHTML = contenido;
    document.getElementById("spnRegistros").innerHTML = nRegistros;
    crearPaginacion();
}

function crearPaginacion() {
    var contenido = "";
    var nRegistros = matriz.length;
    var indiceUltimaPagina = Math.floor(nRegistros / registrosPagina);
    if (nRegistros % registrosPagina == 0) indiceUltimaPagina--;
    for (var j = 0; j <= indiceUltimaPagina; j++) {
        contenido += "<input type='button' class='Navega' value='";
        contenido += (j + 1).toString();
        contenido += "' onclick='paginar(";
        contenido += j.toString();
        contenido += ");'/>";
    }
    document.getElementById("tdPagina").innerHTML = contenido;
}

function paginar(indice) {
    indicePagina = indice;
    mostrarMatriz();
}