/*=========================================================================================
    File Name: lasagna.js
    Description: echarts lasagna chart
    ----------------------------------------------------------------------------------------
    Item Name: Modern Admin - Clean Bootstrap 4 Dashboard HTML Template
   Version: 3.0
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Lasagna chart
// ------------------------------

var categories_video = $.parseJSON(categories_video, true);
// console.log(categories_video);
var jsonSeries = [];
var tempSeries = '';
var dataSet = [];
var categoryName = [];
var categoryColor = [];
// var data = JSON.parse(jsonarray);
    for (var key in categories_video) {
        var count = categories_video[key].count_total;
        var catName = categories_video[key].name;        
        
        // var color = categories_video[key].category_color;

            dataSet.push({value: count, name: catName});
            // categoryColor.push(color);
            categoryName.push(catName);
    }


$(window).on("load", function(){

    for (var key in categories_video) {
        var catName = categories_video[key].name; 
        var color = categories_video[key].category_color;       
        categoryName.push(catName);
        categoryColor.push(color);
    }

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
            var myChart = ec.init(document.getElementById('lasagna'));
            

            // Chart Options
            // ------------------------------
            chartOptions = {

                // Add title
                title: {
                    text: 'Category wise video',
                    // subtext: 'Based on shared research',
                    x: 'center'
                },

                // Add tooltip
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b}: {c} ({d}%)'
                },

                // Add legend
                legend: {
                    x: 'left',
                    orient: 'vertical',
                    data: categoryName
                },

                // Add custom colors
                color: categoryColor,

                // Enable drag recalculate
                calculable: false,

                // Add series
                series: (function () {
                    var series = [];
                    for (var i = 0; i < 30; i++) {
                        series.push({
                            // name: 'Browser',
                            type: 'pie',
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: i > 28
                                    },
                                    labelLine: {
                                        show: i > 28,
                                        length: 20
                                    }
                                }
                            },

                            radius: [i * 3.6 + 40, i * 3.6 + 43],
                            center: ['50%', '55%'],
                            data : dataSet
                            // data: [
                            //     {value: i * 128 + 80,  name: 'Chrome'},
                            //     {value: i * 64  + 160,  name: 'Firefox'},
                            //     {value: i * 32  + 320,  name: 'Safari'},
                            //     {value: i * 16  + 640,  name: 'IE9+'},
                            //     {value: i * 8  + 1280, name: 'IE8-'}
                            // ]
                        })
                    }
                    return series;
                })()
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