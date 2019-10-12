<?php
    $userCount =  DB::table('users')->where('role_id',2)->count();
    $videoCount =  DB::table('posts')->count();
    $quotesCount =  DB::table('quotes')->count();
    $viewersCount =  DB::table('video_viewers')->count();

    $categories_video = DB::table('posts as P')->
                        select('P.id',
                                'P.title',
                                'P.title',
                                'C.name','C.category_color',
                                DB::raw('COUNT(P.id) AS count_total'),
                                DB::raw('date(P.created_at) as created_at')
                            )
                        ->leftJoin('categories as C', 'C.id', '=', 'P.category_id')
                        ->groupBy('C.id')
                        ->get();

    $video_Date =   DB::table('posts')->
                    select( DB::raw('MONTH(created_at) as Month'),
                        DB::raw('YEAR(created_at) as Year')
                        )
                    ->groupBy(DB::raw("MONTH(created_at)"))
                    ->get();

    $month_wise_video = DB::table('posts as P')->
                        select('P.id',
                                'P.title',
                                'P.title',
                                DB::raw('COUNT(P.id) AS count_total'),
                                DB::raw('date(P.created_at) as created_at'),
                                DB::raw('MONTHNAME(P.created_at) as month_name')
                            )
                        ->groupBy(DB::raw("MONTH(created_at)"))
                        ->get();

    $month_wise_video_viewer = DB::table('video_viewers as P')->
                                select('P.id',
                                        DB::raw('COUNT(P.id) AS count_total'),
                                        DB::raw('MONTHNAME(P.created_at) as month_name')
                                    )
                                ->groupBy(DB::raw("MONTH(created_at)"))
                                ->get();

    $day_wise_video_viewer =DB::table('video_viewers as P')->
                            select('P.id',
                            DB::raw('COUNT(P.id) AS count_total'),
                            DB::raw('DAYNAME(P.created_at) as day_name'),
                            DB::raw('DAY(P.created_at) as days')
                             )
                            ->groupBy(DB::raw("Day(created_at)"))
                            ->get();

    $week_wise_video_viewer =DB::table('video_viewers as P')->
                             select('P.id',
                                DB::raw('COUNT(P.id) AS count_total'),
                                DB::raw('Concat("W",WEEK(P.created_at)) as weeks')
                                )
                            ->groupBy(DB::raw("Week(created_at)"))
                            ->get();

                        // dd($month_wise_video);

?>
<!-- product sales and new order css start-->

<!-- <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/components.css') }}">  -->
<!-- product sales and new order css end-->

<div class="custom-content-wrap container-fluid">
<div class="content-body">
                <div class="row">
                    <div class="col-xl-3 col-md-3 col-sm-6 col-12">
                        <div class="card pull-up">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-left">
                                             <h3 class="info">{{$userCount}}</h3>
                                            <h6>Users</h6>
                                        </div>
                                        <div>
                                            <i class="ft-user info font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                        <div class="progress-bar bg-gradient-x-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-3 col-sm-6 col-12">
                        <div class="card pull-up">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-left">
                                             <h3 class="warning">{{$videoCount}}</h3>
                                            <h6>Videos</h6>
                                        </div>
                                        <div>
                                            <i class="ft-video warning font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                        <div class="progress-bar bg-gradient-x-warning" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-3 col-sm-6 col-12">
                        <div class="card pull-up">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-left">
                                            <h3 class="success">{{$quotesCount}}</h3>
                                            <h6>Quotes</h6>
                                        </div>
                                        <div>
                                            <i class="ft-message-circle success font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                        <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-3 col-sm-6 col-12">
                        <div class="card pull-up">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-left">
                                           <h3 class="danger">{{$viewersCount}}</h3>
                                            <h6>Viewers</h6>
                                        </div>
                                        <div>
                                            <i class="ft-users danger font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                        <div class="progress-bar bg-gradient-x-danger" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Products sell and New Orders -->

     <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-body">
                <!-- pie & doughnut charts section start -->
                <section id="pie-doughnut-charts">
                    <div class="row">

                        <!-- Lasagna Chart -->
                        <div class="col-xl-6 col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Category wise video</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <!-- <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li> -->
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <div id="lasagna" class="height-400 echart-container"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Nightingale Rose Diagram Chart -->
                        <div class="col-xl-6 col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <!-- <h4 class="card-title">Nightingale Rose Diagram Chart</h4> -->
                                    <h4 class="card-title">Month wise video</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <!-- <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li> -->
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <div id="nightingale-rose" class="height-400 echart-container"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Nightingale Rose With Labels Chart -->
                    </div>

                    <div class="row">

                        <!-- Timeline Chart -->
                        <!-- <div class="col-xl-6 col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Pie Timeline Chart</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <div id="timeline" class="height-400 echart-container"></div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        
                    </div>

                </section>
                <!-- // pie & doughnut charts section end -->
            </div>
        </div>
    </div>            


    <div class="row match-height">
        <div class="col-xl-12 col-md-12 col-12 " id="ecommerceChartView" >
            <div class="card card-shadow">
                <div class="card-header card-header-transparent py-20">
                    <!-- <div class="btn-group dropdown dropcustom">
                        <a href="#" class="text-body dropdown-toggle blue-grey-700" data-toggle="dropdown">PRODUCTS SALES</a>
                        <div class="dropdown-menu animate" role="menu">
                            <a class="dropdown-item" href="#" role="menuitem">Sales</a>
                            <a class="dropdown-item" href="#" role="menuitem">Total sales</a>
                            <a class="dropdown-item" href="#" role="menuitem">profit</a>
                        </div>
                    </div> -->
                    <ul class="nav nav-pills nav-pills-rounded chart-action float-right btn-group " role="group">
                        <li class="nav-item"><a class="active nav-link" data-toggle="tab" href="#scoreLineToDay">Day</a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scoreLineToWeek">Week</a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scoreLineToMonth">Month</a></li>
                    </ul>
                </div>
                <div class="widget-content tab-content bg-white p-20 ">
                    <div class="ct-chart tab-pane active scoreLineShadow" id="scoreLineToDay"></div>
                    <div class="ct-chart tab-pane scoreLineShadow" id="scoreLineToWeek"></div>
                    <div class="ct-chart tab-pane scoreLineShadow" id="scoreLineToMonth"></div>
                </div>
            </div>
        </div>
        <!-- <div class="col-xl-4 col-md-4">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New Orders</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content">
                    <div id="new-orders" class="media-list position-relative">
                        <div class="table-responsive">
                            <table id="new-orders-table" class="table table-hover table-xl mb-0">
                                <thead>
                                    <tr>
                                        <th class="border-top-0">Product</th>
                                        <th class="border-top-0">Customers</th>
                                        <th class="border-top-0">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-truncate">iPhone X</td>
                                        <td class="text-truncate p-1">
                                            <ul class="list-unstyled users-list m-0">
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="John Doe" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-19.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Katherine Nichols" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-18.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Joseph Weaver" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-17.png')}}" alt="Avatar">
                                                </li>
                                                <li class="avatar avatar-sm">
                                                    <span class="badge badge-info">+4 more</span>
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="text-truncate">$8999</td>
                                    </tr>
                                    <tr>
                                        <td class="text-truncate">Pixel 2</td>
                                        <td class="text-truncate p-1">
                                            <ul class="list-unstyled users-list m-0">
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Alice Scott" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-16.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Charles Miller" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-15.png')}}" alt="Avatar">
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="text-truncate">$5550</td>
                                    </tr>
                                    <tr>
                                        <td class="text-truncate">OnePlus</td>
                                        <td class="text-truncate p-1">
                                            <ul class="list-unstyled users-list m-0">
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Christine Ramos" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-11.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Thomas Brewer" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-10.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Alice Chapman" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-9.png')}}" alt="Avatar">
                                                </li>
                                                <li class="avatar avatar-sm">
                                                    <span class="badge badge-info">+3 more</span>
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="text-truncate">$9000</td>
                                    </tr>
                                    <tr>
                                        <td class="text-truncate">Galaxy</td>
                                        <td class="text-truncate p-1">
                                            <ul class="list-unstyled users-list m-0">
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Ryan Schneider" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-14.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Tiffany Oliver" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-13.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Joan Reid" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-12.png')}}" alt="Avatar">
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="text-truncate">$7500</td>
                                    </tr>
                                    <tr>
                                        <td class="text-truncate">Moto Z2</td>
                                        <td class="text-truncate p-1">
                                            <ul class="list-unstyled users-list m-0">
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Kimberly Simmons" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-8.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Willie Torres" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-7.png')}}" alt="Avatar">
                                                </li>
                                                <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Rebecca Jones" class="avatar avatar-sm pull-up">
                                                    <img class="media-object rounded-circle" src="{{asset('app-assets/images/portrait/small/avatar-s-6.png')}}" alt="Avatar">
                                                </li>
                                                <li class="avatar avatar-sm">
                                                    <span class="badge badge-info">+1 more</span>
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="text-truncate">$8500</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
    </div>
                 <!-- Products sell and New Orders -->
</div>

             <!-- BEGIN: Content-->
   
    <!-- END: Content-->
</div>



<script type="text/javascript">
    
    
    var week_wise_video_viewer = '<?php echo json_encode($week_wise_video_viewer);  ?>';
    var day_wise_video_viewer = '<?php echo json_encode($day_wise_video_viewer);  ?>';
    var categories_video = '<?php echo json_encode($categories_video);  ?>';
    var month_wise_video_viewer = '<?php echo json_encode($month_wise_video_viewer);  ?>';
    var video_Date = '<?php echo json_encode($video_Date);  ?>';
    var month_wise_video = '<?php echo json_encode($month_wise_video);  ?>';

</script>




<!-- for products sales chart -->
<script src="{{asset('app-assets/vendors/js/vendors.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/charts/chartist.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/charts/chartist-plugin-tooltip.min.js')}}"></script>
<!-- for products sales chart -->

<!-- for all pie chart(round) and donut(round) chart minimize and maximize features -->
<script src="{{asset('app-assets/js/core/app-menu.js')}}"></script>
<script src="{{asset('app-assets/js/core/app.js')}}"></script>
<!-- for all pie chart(round) and donut(round) chart minimize and maximize features -->

<!-- for products sales chart -->
<script src="{{asset('app-assets/js/scripts/pages/dashboard-ecommerce.js')}}"></script>
<!-- for products sales chart -->

<!-- for all pie chart(round) and doughnutut(round) chart minimize and maximize features -->
<script src="{{asset('app-assets/vendors/js/material-vendors.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/charts/echarts/echarts.js')}}"></script>
<!-- <script src="{{asset('app-assets/js/scripts/charts/echarts/pie-doughnut/timeline.js')}}"></script> -->
<script src="{{asset('app-assets/js/scripts/charts/echarts/pie-doughnut/lasagna.js')}}"></script>
<script src="{{asset('app-assets/js/scripts/charts/echarts/pie-doughnut/nightingale-rose.js')}}"></script>
<!-- for all pie chart(round) and donut(round) chart minimize and maximize features -->


<script src="{{asset('app-assets/vendors/js/charts/echarts/chart/pie.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/charts/echarts/chart/funnel.js')}}"></script>


 <script type="text/javascript">
       $(document).ready(function(){
            var i = 0;
            $('div .dropcustom a').click(function(){
                if(i > 0){
                    var v  = $(this).parent().find('class');
                     if ($(this).parent().hasClass('open')){
                            $(this).parent().removeClass('open');
                      } else {
                            $(this).parent().addClass('open');
                      }
                  }
                i++;
            });
        });
    </script>
