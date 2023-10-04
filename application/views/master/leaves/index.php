        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-flex w-100 align-items-center">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <h1 class="h3 mb-0 text-gray-800"><?= $title; ?></h1>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-right">
            </div>
          </div>
        <hr>
          <div class="row">
            <div class="col-lg-12 cols-md-12 col-sm-12">
              <?= $this->session->flashdata('message'); ?>
            </div>
          </div>
          <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Data Table Users-->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-dark">DataTables Users</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Employee Name</th>
                      <th>Reason</th>
                      <th>Leave type</th>
                      <th>Starting Date</th>
                      <th>End date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->
        <hr>
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
              <?= $this->session->flashdata('message'); ?>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->