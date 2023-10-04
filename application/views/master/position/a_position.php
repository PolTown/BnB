        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>
          <div class="row">
            <div class="col-lg-3">
              <a href="<?= base_url('master/position'); ?>" class="btn btn-light bg-gradient-light border btn-icon-split mb-4 rounded-0">
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
          <form action="" method="POST" class="col-lg-5 col-md-6 col-sm-12  p-0">
            <div class="card rounded-0">
              <h5 class="card-header">Department Master Data</h5>
              <div class="card-body">
                <h5 class="card-title">Add New Department</h5>
                <p class="card-text">Form to add a new position</p>
                <form>
                  <?= $this->session->flashdata('message') ?>
                  <div class="form-group">
                    <label for="p_name" class="col-form-label-lg">Postion Name</label>
                    <input type="text" class="form-control form-control-lg" autofocus name="p_name" id="p_name" value="<?= !empty($this->input->post('p_name')) ? $this->input->post('p_name') : '' ?>">
                    <?= form_error('p_name', '<small class="text-danger">', '</small>') ?>
                  </div>
                  <div class="form-group">
                    <label for="p_rate" class="col-form-label-lg">Rate</label>
                    <input type="text" class="form-control form-control-lg" name="p_rate" id="p_rate" value="<?= !empty($this->input->post('p_rate')) ? $this->input->post('p_rate') : '' ?>">
                    <?= form_error('p_rate', '<small class="text-danger">', '</small>') ?>
                  </div>
                  <button type="submit" class="btn btn-sm btn-primary bg-gradient-primary btn-icon-split mt-4 float-right rounded-0">
                    <span class="icon text-white">
                      <i class="fas fa-plus-circle"></i>
                    </span>
                    <span class="text">Save</span>
                  </button>
                </form>
          
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