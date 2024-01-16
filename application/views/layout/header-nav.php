 <!-- Preloader - style you can find in spinners.css -->
 <div class="preloader">
 	<div class="lds-ripple">
 		<div class="lds-pos"></div>
 		<div class="lds-pos"></div>
 	</div>
 </div>
 <!-- Main wrapper - style you can find in pages.scss -->
 <div id="main-wrapper">
 	<!-- Topbar header - style you can find in pages.scss -->
 	<header class="topbar">
 		<nav class="navbar top-navbar navbar-expand-md navbar-dark">
 			<div class="navbar-header">
 				<!-- This is for the sidebar toggle which is visible on mobile only -->
 				<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
 					<i class="ti-menu ti-close"></i>
 				</a>
 				<!-- Logo -->
 				<div class="navbar-brand">
 					<a href="index.html" class="logo">
 						<!-- Logo icon -->
 						<b class="logo-icon">
 							<!-- Dark Logo icon -->
 							<img src="<?= base_url() ?>assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
 							<!-- Light Logo icon -->
 							<img src="<?= base_url() ?>assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
 						</b>
 						<!--End Logo icon -->
 						<!-- Logo text -->
 						<span class="logo-text">
 							<!-- dark Logo text -->
 							<img src="<?= base_url() ?>assets/images/logo-text.png" alt="homepage" class="dark-logo" />
 							<!-- Light Logo text -->
 							<img src="<?= base_url() ?>assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
 						</span>
 					</a>
 					<a class="sidebartoggler d-none d-md-block" href="javascript:void(0)" data-sidebartype="mini-sidebar">
 						<i class="mdi mdi-toggle-switch mdi-toggle-switch-off font-20"></i>
 					</a>
 				</div>
 				<!-- End Logo -->
 				<!-- Toggle which is visible on mobile only -->
 				<a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
 					<i class="ti-more"></i>
 				</a>
 			</div>
 			<!-- End Logo -->
 			<div class="navbar-collapse collapse" id="navbarSupportedContent">
 				<!-- toggle and nav items -->
 				<ul class="navbar-nav float-left mr-auto">
 					<li class="nav-item search-box">
 						<a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
 							<div class="d-flex align-items-center">
 								<i class="mdi mdi-magnify font-20 mr-1"></i>
 								<div class="ml-1 d-none d-sm-block">
 									<span>Search</span>
 								</div>
 							</div>
 						</a>
 						<form class="app-search position-absolute">
 							<input type="text" class="form-control" placeholder="Search &amp; enter">
 							<a class="srh-btn">
 								<i class="ti-close"></i>
 							</a>
 						</form>
 					</li>
 				</ul>
 				<!-- Right side toggle and nav items -->
 				<ul class="navbar-nav float-right">
 					<li class="nav-item dropdown">
 						<a class="nav-link dropdown-toggle waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

 							<img src="<?= base_url('assets/images/profile/') . $user['image'] ?>" alt="user" class="rounded-circle" width="40">
 							<span class="m-l-5 font-medium d-none d-sm-inline-block"><?= $user['name'] ?> <i class="mdi mdi-chevron-down"></i></span>
 						</a>
 						<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
 							<span class="with-arrow">
 								<span class="bg-primary"></span>
 							</span>
 							<div class="d-flex no-block align-items-center p-15 bg-primary text-white m-b-10">
 								<div class="">
 									<img src="<?= base_url('assets/images/profile/') . $user['image'] ?>" alt="user" class="rounded-circle" width="60">
 								</div>
 								<div class="m-l-10">
 									<h4 class="m-b-0"><?= $user['name'] ?></h4>
 									<p class=" m-b-0"><?= $user['email'] ?></p>
 								</div>
 							</div>
 							<div class="profile-dis scrollable">
 								<a class="dropdown-item" href="<?= base_url('user') ?>">
 									<i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
 								<div class="dropdown-divider"></div>
 								<a class="dropdown-item" href="<?= base_url('auth/logout') ?>">
 									<i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
 								<div class="dropdown-divider"></div>
 							</div>
 						</div>
 					</li>
 					<!-- User profile and search -->
 				</ul>
 			</div>
 		</nav>
 	</header>
 	<!-- End Topbar header -->
 	<!-- Left Sidebar - style you can find in sidebar.scss  -->
 	<aside class="left-sidebar">
 		<!-- Sidebar scroll-->
 		<div class="scroll-sidebar">
 			<!-- Sidebar navigation-->
 			<nav class="sidebar-nav">
 				<ul id="sidebarnav">
 					<!-- Query Menu -->
 					<?php
						$role_id = $this->session->userdata('role_id');
						$queryMenu = "SELECT tbl_login_menu.id, menu FROM tbl_login_menu JOIN tbl_login_access_menu ON tbl_login_menu.id = tbl_login_access_menu.menu_id
									 WHERE tbl_login_access_menu.role_id = '$role_id' ORDER BY 
									 (CASE tbl_login_menu.id WHEN 3 THEN 'Z' ELSE 'A' END), 
									 tbl_login_menu.id ASC;
									 ";
						$menu = $this->db->query($queryMenu)->result_array();
						?>
						<li class="nav-small-cap">
 							<i class="mdi mdi-dots-horizontal"></i>
 							<span class="hide-menu">Personal</span>
 						</li>
						<?php foreach ($menu as $mn) { ?>
							<?php if ($mn['menu'] == 'Menu') { ?>
								<li class="nav-small-cap">
									<i class="mdi mdi-dots-horizontal"></i>
									<span class="hide-menu">Settings</span>
								</li>
							<?php }else if ($mn['menu'] == 'Crud') { ?>
								<li class="nav-small-cap">
									<i class="mdi mdi-dots-horizontal"></i>
									<span class="hide-menu">App</span>
								</li>
							<?php } ?>
 						<!-- <li class="nav-small-cap">
 							<i class="mdi mdi-dots-horizontal"></i>
 							<span class="hide-menu"></?= $mn['menu'] ?></span>
 						</li> -->
						
 						<li class="sidebar-item">
 							<?php
								$menuId = $mn['id'];
								$querySubmenu = "SELECT * FROM tbl_login_sub_menu JOIN tbl_login_menu ON tbl_login_sub_menu.menu_id = tbl_login_menu.id WHERE tbl_login_sub_menu.menu_id = '$menuId' AND tbl_login_sub_menu.is_active = 1 ORDER BY title,urutan ASC";
								$sub_menu = $this->db->query($querySubmenu)->result_array();
								?>
 							<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
 								<i class="mdi mdi-av-timer"></i>
 								<span class="hide-menu"><?= $mn['menu'] ?> </span>
 								<!-- <span class="badge badge-pill badge-info ml-auto m-r-15"></?= count($sub_menu) ?></span> -->
 							</a>


 							<ul aria-expanded="false" class="collapse  first-level">
 								<?php foreach ($sub_menu as $sm) { ?>
 									<li class="sidebar-item">
 										<a class="sidebar-link waves-effect waves-dark sidebar-link pb-1" href="<?= base_url($sm['url']) ?>" aria-expanded="false"><i class="<?= $sm['icon'] ?>"></i><span class="hide-menu"><?= $sm['title'] ?> </span></a>
 									</li>
 								<?php } ?>
 							</ul>


 						<?php } ?>
 						</li>
 						<!-- Siapkan Sub-menu sesuai menu -->


 						<li class="sidebar-item">
 							<a class="sidebar-link waves-effect waves-dark sidebar-link " href="<?= base_url('auth/logout') ?>" aria-expanded="false">
 								<i class="mdi mdi-directions"></i>
 								<span class="hide-menu">Log Out</span>
 							</a>
 						</li>
 				</ul>
 			</nav>
 			<!-- End Sidebar navigation -->
 		</div>
 		<!-- End Sidebar scroll-->
 	</aside>
 	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
 	<!-- Page wrapper  -->
 	<div class="page-wrapper">
 		<!-- Bread crumb and right sidebar toggle -->
