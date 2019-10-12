/*=========================================================================================
    File Name: timeline.js
    Description: echarts timeline chart
    ----------------------------------------------------------------------------------------
    Item Name: Modern Admin - Clean Bootstrap 4 Dashboard HTML Template
   Version: 3.0
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Timeline chart
// ------------------------------
var categories_video = $.parseJSON(categories_video, true);
// console.log(categories_video);
var jsonSeries = [];
var tempSeries = '';
var data = [];
var categoryName = [];
var categoryColor = [];
// var data = JSON.parse(jsonarray);
    for (var key in categories_video) {
        var count = categories_video[key].count_total;
        var name = categories_video[key].name;
        var color = categories_video[key].category_color;

            data.push({value: count, name: name});
            categoryColor.push(color);
            categoryName.push(name);
    }


var video_Date = $.parseJSON(video_Date, true);
var videoDate = [];
// var data = JSON.parse(jsonarray);
    for (var key in video_Date) {
            var Month = video_Date[key].Month;
            var Year = video_Date[key].Year;
            var date = Year+'-'+Month+'-01';
            videoDate.push(date);
    }
    // for (var i = categories_video.length - 1; i >= 0; i--) {
    //     var specialsymbol = ',';
    //     if(i == categories_video.length - 1){
    //         specialsymbol = ''
    //     }
    //     // var obj = JSON.parse(jsonStr)
    //     tempSeries = ({value: '10000', name: 'TESTS'});
    //     // tempSeries = "{value: "+1000+", name: '"+categories_video[i].name+"'}"+specialsymbol+tempSeries ;
    //     jsonSeries.push(tempSeries);

    // }
    // console.log(JSON.stringify(data));

$(window).on("load", function(){

    // Set paths
    // ------------------------------

    require.config({
        paths: {
            echarts: '../../../app-assets/vendors/js/charts/echarts'
        }
    });


    // Configuration
    // ------------------------------

    require(
        [
            'echarts',
            'echarts/chart/pie',
            'echarts/chart/funnel'
        ],


        // Charts setup
        function (ec) {
            // Initialize chart
            // ------------------------------
            var myChart = ec.init(document.getElementById('timeline'));

            var idx = 1;

            // Chart Options
            // ------------------------------
            chartOptions = {

                // Add timeline
                timeline: {
                    x: 10,
                    x2: 10,
                    data: videoDate,
                    label: {
                        formatter: function(s) {
                            return s.slice(0, 7);
                        }
                    },
                    autoPlay: true,
                    playInterval: 3000
                },

                // Set options
                options: [
                    {

                        // Add title
                        title: {
                            text: 'Categorie statistics',
                            subtext: 'Based on shared research',
                            x: 'center'
                        },

                        // Add tooltip
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                        },

                        // Add legend
                        legend: {
                            x: 'left',
                            orient: 'vertical',
                            data: categoryName
                        },

                        // Add custom colors
                        color: categoryColor,

                        // Display toolbox
                        toolbox: {
                            show: true,
                            orient: 'vertical',
                            feature: {
                                mark: {
                                    show: true,
                                    title: {
                                        mark: 'Markline switch',
                                        markUndo: 'Undo markline',
                                        markClear: 'Clear markline'
                                    }
                                },
                                dataView: {
                                    show: true,
                                    readOnly: false,
                                    title: 'View data',
                                    lang: ['View chart data', 'Close', 'Update']
                                },
                                magicType: {
                                    show: true,
                                    title: {
                                        pie: 'Switch to pies',
                                        funnel: 'Switch to funnel',
                                    },
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1700
                                        }
                                    }
                                },
                                restore: {
                                    show: true,
                                    title: 'Restore'
                                },
                                saveAsImage: {
                                    show: true,
                                    title: 'Same as image',
                                    lang: ['Save']
                                }
                            }
                        },


                        // Add series
                        series: [{
                            name: 'Browser',
                            type: 'pie',
                            // center: ['50%', '50%'],
                            // radius: '60%',
                            data: data
                        }]
                    },

                    {

                        series: [{
                            name: 'Browser',
                            type: 'pie',
                            data: [{"value":50,"name":"Category 1"},
                            {"value":100,"name":"Category 2"},
                            {"value":2,"name":"Category 3"}]
                        }]
                    },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // },
                    // {
                    //     series: [{
                    //         name: 'Browser',
                    //         type: 'pie',
                    //         data: [
                    //             {value: idx * 128 + 80,  name:'Chrome'},
                    //             {value: idx * 64  + 160,  name:'Firefox'},
                    //             {value: idx * 32  + 320,  name:'Safari'},
                    //             {value: idx * 16  + 640,  name:'IE9+'},
                    //             {value: idx++ * 8  + 1280, name:'IE8-'}
                    //         ]
                    //     }]
                    // }
                ]
            };

            // Apply options
            // ------------------------------

            myChart.setOption(chartOptions);


            // Resize chart
            // ------------------------------

            $(function () {

                // Resize chart on menu width change and window resize
                $(window).on('resize', resize);
                $(".menu-toggle").on('click', resize);

                // Resize function
                function resize() {
                    setTimeout(function() {

                        // Resize chart
                        myChart.resize();
                    }, 200);
                }
            });
        }
    );
});
