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
				<?= $this->session->flashdata('message'); ?>
				<!-- Form -->
				<div>
					<div class="logo">
						<span class="db"><img src="<?= base_url() ?>assets/images/logo-icon.png" alt="logo" /></span>
						<h5 class="font-medium m-b-20">Recover Password</h5>
						<span>Enter your Email and instructions will be sent to you!</span>
					</div>
					<div class="row m-t-20">
						<!-- Form -->
						<form class="col-12" method="POST" action="<?= base_url('auth/forgotpassword'); ?>">
							<!-- email -->
							<div class="form-group row">
								<div class="col-12">
									<input type="text" class="form-control form-control-user" id="email" name="email" placeholder="Enter Email Address..." value="<?= set_value('email'); ?>">
									<?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
								</div>
							</div>
							<!-- pwd -->
							<div class="row m-t-20">
								<div class="col-12">
									<button class="btn btn-block btn-lg btn-danger" type="submit" name="action">Reset Password</button>
								</div>
							</div>
						</form>
						<hr>
						<div class="col-md-12" style="text-align: center;">
							<a class="small" href="<?= base_url('auth'); ?>">Back to login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>