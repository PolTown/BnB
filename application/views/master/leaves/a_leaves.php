        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>
          <div class="row">
            <div class="col-lg-3">
              <a href="<?= base_url('master/payroll'); ?>" class="btn btn-light bg-gradient-light border btn-icon-split mb-4 rounded-0">
                <span class="icon text-white">
                  <i class="fas fa-chevron-left"></i>
                </span>
                <span class="text">Back</span>
              </a>
            </div>
            <div class="col-lg-5 offset-lg-4">
              <?= $this->session->flashdata('message'); ?>
            </div>
          </div>
          <div class="row justify-content-center">
            <div class="col-lg-10 p-0">
              <?= form_open_multipart('master/a_payroll'); ?>
              <div class="card rounded-0">
                <h5 class="card-header">Payroll Master Data</h5>
                <div class="card-body">
                  <h5 class="card-title">Leaves</h5>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group row">
                        <label for="e_name" class="col-form-label col-lg-4">Employee ID</label>
                        <div class="col p-0">
                          <input type="text" class="form-control col-lg" name="e_name" id="e_name" autofocus>
                          <?= form_error('e_name', '<small class="text-danger">', '</small>') ?>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="e_name" class="col-form-label col-lg-4">Type of Leave</label>
                        <div class="col p-0">
                          <input type="text" class="form-control col-lg" name="e_name" id="e_name" autofocus>
                          <?= form_error('e_name', '<small class="text-danger">', '</small>') ?>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="e_name" class="col-form-label col-lg-4">Reason</label>
                        <div class="col p-0">
                          <input type="text" class="form-control col-lg" name="e_name" id="e_name" autofocus>
                          <?= form_error('e_name', '<small class="text-danger">', '</small>') ?>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group row">
                        <label for="e_birth_date" class="col-form-label col-lg-4">Starting Date</label>
                        <div class="col-lg p-0">
                          <input type="date" class="form-control col-lg" name="e_birth_date" id="e_birth_date" min="1990-01-01" max="2002-01-01">
                          <?= form_error('e_birth_date', '<small class="text-danger">', '</small>') ?>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="e_hire_date" class="col-form-label col-lg-4">Ending Date</label>
                        <div class="col-lg p-0">
                          <input type="date" class="form-control col-lg" name="e_hire_date" id="e_hire_date" min="2004-04-16" max="<?= date('Y-m-d', time()); ?>">
                          <?= form_error('e_hire_date', '<small class="text-danger">', '</small>') ?>
                        </div>
                      </div>
                    </div>
                  </div>

                  <button type="submit" class="btn btn-sm btn-primary bg-gradient-primary btn-icon-split mt-4 float-right rounded-0">
                    <span class="icon text-white">
                      <i class="fas fa-plus-circle"></i>
                    </span>
                    <span class="text">Save</span>
                  </button>
                  <?= form_close(); ?>
                </div>
              </div>
              <?= form_close() ?>
            </div>
          </div>
          
        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <script>
          // Add the following code if you want the name of the file appear on select
          $(".custom-file-input").on("change", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
          });
        </script>