/*=========================================================================================
    File Name: nightingale-rose.js
    Description: echarts nightingale rose chart
    ----------------------------------------------------------------------------------------
    Item Name: Modern Admin - Clean Bootstrap 4 Dashboard HTML Template
   Version: 3.0
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Nightingale rose chart
// ------------------------------


var month_wise_video = $.parseJSON(month_wise_video, true);
// console.log(categories_video);
var jsonSeries = [];
var tempSeries = '';
var data = [];
var categoryName = [];
var categoryColor = [];
// var data = JSON.parse(jsonarray);
    for (var key in month_wise_video) {
        var count = month_wise_video[key].count_total;
        var month_name = month_wise_video[key].month_name;
        data.push({value: count, name: month_name});
    }
    

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
            var myChart = ec.init(document.getElementById('nightingale-rose'));

            // Chart Options
            // ------------------------------
            chartOptions = {

                // Add title
                title: {
                    text: 'Month wise video',
                    // subtext: 'Senior front end developer',
                    x: 'center'
                },

                // Add tooltip
                tooltip: {
                    trigger: 'item',
                    // formatter: "{a} <br/>{b}: +{c}$ ({d}%)"
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },

                // Add legend
                legend: {
                    x: 'left',
                    y: 'top',
                    orient: 'vertical',
                    data: ['January','February','March','April','May','June','July','August','September','October','November','December']
                },

                // Add custom colors
                color: ['#00A5A8', '#FF7D4D', '#FF4558','#626E82', '#28D094', '#FFC400', '#006064', '#FF1744', '#1565C0', '#FFC400', '#64FFDA', '#607D8B'],

                // Display toolbox
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    feature: {
                        mark: {
                            show: false,
                            title: {
                                mark: 'Markline switch',
                                markUndo: 'Undo markline',
                                markClear: 'Clear markline'
                            }
                        },
                        dataView: {
                            show: false,
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
                            type: ['pie', 'funnel']
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

                // Enable drag recalculate
                calculable: true,

                // Add series
                series: [
                    {
                        // name: 'Increase (brutto)',
                        type: 'pie',
                        radius: ['15%', '73%'],
                        center: ['50%', '57%'],
                        roseType: 'radius',

                        // Funnel
                        width: '40%',
                        height: '78%',
                        x: '30%',
                        y: '17.5%',
                        max: 450,

                        itemStyle: {
                            normal: {
                                label: {
                                    show: false
                                },
                                labelLine: {
                                    show: false
                                }
                            },
                            emphasis: {
                                label: {
                                    show: true
                                },
                                labelLine: {
                                    show: true
                                }
                            }
                        },
                        // data: [
                        //     {value: 440, name: 'January'},
                        //     {value: 260, name: 'February'},
                        //     {value: 350, name: 'March'},
                        //     {value: 250, name: 'April'},
                        //     {value: 210, name: 'May'},
                        //     {value: 350, name: 'June'},
                        //     {value: 300, name: 'July'},
                        //     {value: 430, name: 'August'},
                        //     {value: 400, name: 'September'},
                        //     {value: 450, name: 'October'},
                        //     {value: 330, name: 'November'},
                        //     {value: 200, name: 'December'}
                        // ]
                        data: data
                    }
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