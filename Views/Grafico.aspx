<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grafico.aspx.cs" Inherits="WbForm.Views.Grafico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Cabecalho" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/maps/modules/map.js"></script>
    <script src="http://code.highcharts.com/mapdata/custom/world.js"></script>
    <link href="../Style/mapa.css" rel="stylesheet" />
<!-- Flag sprites service provided by Martijn Lafeber, https://github.com/lafeber/world-flags-sprite/blob/master/LICENSE -->
<link rel="stylesheet" type="text/css" href="http://cloud.github.com/downloads/lafeber/world-flags-sprite/flags32.css" />
 
    <h1>Gráfico</h1>

    <div id="container">
        <script type="text/javascript">
            $(function () {




                // Load the data from a Google Spreadsheet
                // https://docs.google.com/a/highsoft.com/spreadsheet/pub?hl=en_GB&hl=en_GB&key=0AoIaUO7wH1HwdFJHaFI4eUJDYlVna3k5TlpuXzZubHc&output=html
                Highcharts.data({

                    googleSpreadsheetKey: '0AoIaUO7wH1HwdFJHaFI4eUJDYlVna3k5TlpuXzZubHc',

                    // custom handler when the spreadsheet is parsed
                    parsed: function (columns) {

                        // Read the columns into the data array
                        var data = [];
                        $.each(columns[0], function (i, code) {
                            data.push({
                                code: code.toUpperCase(),
                                value: parseFloat(columns[2][i]),
                                name: columns[1][i]
                            });
                        });


                        // Initiate the chart
                        $('#container').highcharts('Map', {
                            chart: {
                                borderWidth: 1
                            },

                            colors: ['rgba(19,64,117,0.05)', 'rgba(19,64,117,0.2)', 'rgba(19,64,117,0.4)',
                                'rgba(19,64,117,0.5)', 'rgba(19,64,117,0.6)', 'rgba(19,64,117,0.8)', 'rgba(19,64,117,1)'],

                            title: {
                                text: 'Population density by country (/km²)'
                            },

                            mapNavigation: {
                                enabled: true
                            },

                            legend: {
                                title: {
                                    text: 'Individuals per km²',
                                    style: {
                                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                                    }
                                },
                                align: 'left',
                                verticalAlign: 'bottom',
                                floating: true,
                                layout: 'vertical',
                                valueDecimals: 0,
                                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || 'rgba(255, 255, 255, 0.85)',
                                symbolRadius: 0,
                                symbolHeight: 14
                            },

                            colorAxis: {
                                dataClasses: [{
                                    to: 3
                                }, {
                                    from: 3,
                                    to: 10
                                }, {
                                    from: 10,
                                    to: 30
                                }, {
                                    from: 30,
                                    to: 100
                                }, {
                                    from: 100,
                                    to: 300
                                }, {
                                    from: 300,
                                    to: 1000
                                }, {
                                    from: 1000
                                }]
                            },

                            series: [{
                                data: data,
                                mapData: Highcharts.maps['custom/world'],
                                joinBy: ['iso-a2', 'code'],
                                animation: true,
                                name: 'Population density',
                                states: {
                                    hover: {
                                        color: '#BADA55'
                                    }
                                },
                                tooltip: {
                                    valueSuffix: '/km²'
                                }
                            }]
                        });
                    },
                    error: function () {
                        $('#container').html('<div class="loading">' +
                            '<i class="icon-frown icon-large"></i> ' +
                            'Error loading data from Google Spreadsheets' +
                            '</div>');
                    }
                });
            });
        </script>
	
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Rodape" runat="server">

</asp:Content>
