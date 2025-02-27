<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto">
                        <a class="navbar-brand" href="{{ route('voyager.dashboard') }}">
                            
                            <?php $admin_logo_img = Voyager::setting('admin.icon_image', ''); ?>
                            @if($admin_logo_img == '')
                                <img src="{{ voyager_asset('images/logo-icon-light.png') }}" alt="Logo Icon">
                            @else
                                <img src="{{ Voyager::image($admin_logo_img) }}" alt="Logo Icon">
                            @endif
                            
                            <div class="title">{{Voyager::setting('admin.title', 'VOYAGER')}}</div>
                        </a>
                    </li>
                    <li class="nav-item d-none d-lg-block nav-toggle">
                        <a class="nav-link modern-nav-toggle pr-0 waves-effect waves-dark" data-toggle="collapse">
                            <i class="toggle-icon ft-toggle-right font-medium-3 white" data-ticon="ft-toggle-right"></i>
                        </a>
                    </li>
                </ul>
            </div><!-- .navbar-header -->

            <div class="panel widget center bgimage"
                 style="background-image:url({{ Voyager::image( Voyager::setting('admin.bg_image'), voyager_asset('images/bg.jpg') ) }}); background-size: cover; background-position: 0px;">
                <div class="dimmer"></div>
                <div class="panel-content">
                    <img src="{{ $user_avatar }}" class="avatar" alt="{{ app('VoyagerAuth')->user()->name }} avatar">
                    <h4>{{ ucwords(app('VoyagerAuth')->user()->name) }}</h4>
                    <p>{{ app('VoyagerAuth')->user()->email }}</p>

                    <a href="{{ route('voyager.profile') }}" class="btn btn-primary">{{ __('voyager::generic.profile') }}</a>
                    <div style="clear:both"></div>
                </div>
            </div>

        </div>
        <div id="adminmenu">
            <admin-menu :items="{{ menu('admin', '_json') }}"></admin-menu>
        </div>
    </nav>
</div>
