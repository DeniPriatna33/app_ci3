<div class="main-wrapper">
	<!-- Preloader - style you can find in spinners.css -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- Preloader - style you can find in spinners.css -->
	<!-- Login box.scss -->
	<div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background:url(<?= base_url() ?>assets/images/big/auth-bg.jpg) no-repeat center center;">
		<div class="auth-box">
			<div id="loginform">
				<div class="logo">
					<span class="db"><img src="<?= base_url() ?>assets/images/logo-icon.png" alt="logo" /></span>
					<h5 class="font-medium m-b-20">Sign In to Admin</h5>
				</div>

				<?= $this->session->flashdata('message'); ?>
				<!-- Form -->
				<div class="row">
					<div class="col-12">
						<form method="POST" action="<?= base_url('auth') ?>" class="form-horizontal m-t-20" id="loginform">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><i class="ti-user"></i></span>
								</div>
								<input type="text" name="email" id="email" class="form-control form-control-lg" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" value="<?= set_value('email') ?>">
							</div>
							<?= form_error('email', '<small class="text-danger">', '</small>') ?>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon2"><i class="ti-pencil"></i></span>
								</div>
								<input type="password" name="password" id="password" class="form-control form-control-lg" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
							</div>
							<?= form_error('password', '<small class="text-danger">', '</small>') ?>
							<div class="form-group row">
								<div class="col-md-12">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Remember me</label>
										<!-- <a href="javascript:void(0)" id="to-recover" class="text-dark float-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a> -->
										<a href="<?= base_url('auth/forgotPassword') ?>" id="to-recover" class="text-dark float-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a>
									</div>
								</div>
							</div>
							<div class="form-group text-center">
								<div class="col-xs-12 p-b-20">
									<button class="btn btn-block btn-lg btn-info" type="submit">Log In</button>
								</div>
							</div>

							<div class="form-group m-b-0 m-t-10">
								<div class="col-sm-12 text-center">
									Don't have an account? <a href="<?= base_url('auth/registration') ?>" class="text-info m-l-5"><b>Sign Up</b></a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- <div id="recoverform">
				<div class="logo">
					<span class="db"><img src="</?= base_url() ?>assets/images/logo-icon.png" alt="logo" /></span>
					<h5 class="font-medium m-b-20">Recover Password</h5>
					<span>Enter your Email and instructions will be sent to you!</span>
				</div>
				<div class="row m-t-20">
					<form class="col-12" action="index.html">
						<div class="form-group row">
							<div class="col-12">
								<input class="form-control form-control-lg" type="email" required="" placeholder="Username">
							</div>
						</div>
						<div class="row m-t-20">
							<div class="col-12">
								<button class="btn btn-block btn-lg btn-danger" type="submit" name="action">Reset</button>
							</div>
						</div>
					</form>
				</div>
			</div> -->
		</div>
	</div>
</div>