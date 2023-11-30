<div class="main-wrapper">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Login box.scss -->
	<!-- ============================================================== -->
	<div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background:url(<?= base_url() ?>assets/images/big/auth-bg.jpg) no-repeat center center;">
		<div class="auth-box">
			<div>
				<div class="logo">
					<span class="db"><img src="<?= base_url() ?>assets/images/logo-icon.png" alt="logo" /></span>
					<h5 class="font-medium m-b-20">Sign Up to Admin</h5>
				</div>
				<!-- Form -->
				<div class="row">
					<div class="col-12">
						<form method="POST" action="<?= base_url('auth/registration') ?>" class="form-horizontal m-t-20">
							<div class="form-group row ">
								<div class="col-12 ">
									<input class="form-control form-control-lg" name="name" id="name" type="text" placeholder="Name" value="<?= set_value('name') ?>">
									<?= form_error('name', '<small class="text-danger">', '</small>') ?>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-12 ">
									<input class="form-control form-control-lg" name="email" id="email" type="text" placeholder="Email" value="<?= set_value('email') ?>">
									<?= form_error('email', '<small class="text-danger">', '</small>') ?>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-12 ">
									<input class="form-control form-control-lg" name="password1" type="password" placeholder="Password">
									<?= form_error('password1', '<small class="text-danger">', '</small>') ?>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-12 ">
									<input class="form-control form-control-lg" name="password2" type="password" placeholder="Confirm Password">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-12 ">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">I agree to all <a href="javascript:void(0)">Terms</a></label>
									</div>
								</div>
							</div>
							<div class="form-group text-center ">
								<div class="col-xs-12 p-b-20 ">
									<button class="btn btn-block btn-lg btn-info " type="submit">SIGN UP</button>
								</div>
							</div>
							<div class="form-group m-b-0 m-t-10 ">
								<div class="col-sm-12 text-center ">
									Already have an account? <a href="<?= base_url('auth') ?> " class="text-info m-l-5 "><b>Sign In</b></a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Login box.scss -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Page wrapper scss in scafholding.scss -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Page wrapper scss in scafholding.scss -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right Sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right Sidebar -->
	<!-- ============================================================== -->
</div>