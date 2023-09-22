<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
  // Constructor
  public function __construct()
  {
    parent::__construct();
    is_weekends();
    is_logged_in();
    is_checked_in();
    is_checked_out();
    $this->load->library('form_validation');
    $this->load->model('Public_model');
    $this->load->model('Admin_model');
  }

  // Dashboard
  public function index()
  {
    $dquery = "SELECT department_id AS d_id, COUNT(employee_id) AS qty FROM employee_department GROUP BY d_id";
    $d['d_list'] = $this->db->query($dquery)->result_array();
    $squery = "SELECT e.shift_id AS s_id, COUNT(e.id) AS qty, s.start, s.end FROM employee e inner join `shift` s on e.shift_id = s.id GROUP BY s_id";
    $d['s_list'] = $this->db->query($squery)->result_array();
    // Dashboard
    $d['title'] = 'Dashboard';
    $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
    $d['display'] = $this->Admin_model->getDataForDashboard();

    $this->load->view('templates/dashboard_header', $d);
    $this->load->view('templates/sidebar');
    $this->load->view('templates/topbar');
    $this->load->view('admin/index', $d); // Dashboard Page
    $this->load->view('templates/dashboard_footer');
  }

  public function users()
  {
    $query = "SELECT employee_department.employee_id AS e_id,
                     employee_department.department_id AS d_id,
                     users.username AS u_username,
                     employee.name AS e_name
                FROM employee_department
           LEFT JOIN users
                  ON employee_department.employee_id = users.employee_id
          INNER JOIN employee
                  ON employee_department.employee_id = employee.id
          ";
    $d['title'] = 'Users';
    $d['data'] = $this->db->query($query)->result_array();
    $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);

    $this->load->view('templates/table_header', $d);
    $this->load->view('templates/sidebar');
    $this->load->view('templates/topbar');
    $this->load->view('admin/users/index', $d);
    $this->load->view('templates/table_footer');
  }

  public function a_users($e_id)
  {
    $empDep = $this->db->get_where('employee_department', ['employee_id' => $e_id])->row_array();
    $d['title'] = 'Users';
    $d['username'] = $empDep['department_id'] . $empDep['employee_id'];
    $d['e_id'] = $empDep['employee_id'];
    $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);

    $this->form_validation->set_rules('u_username', 'Username', 'required|trim|min_length[6]');
    $this->form_validation->set_rules('u_password', 'Password', 'required|trim|min_length[6]');

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('admin/users/a_users', $d);
      $this->load->view('templates/footer');
    } else {
      $username = $this->input->post('u_username');
      if ($empDep['department_id'] != 'ADM') {
        $role_id = 2;
      } else {
        $role_id = 1;
      }
      $data = [
        'username' => $username,
        'password' => password_hash($this->input->post('u_password'), PASSWORD_DEFAULT),
        'employee_id' => $this->input->post('e_id'),
        'role_id' => $role_id
      ];
      $this->_addUsers($data);
    }
  }
  private function _addUsers($data)
  {
    $this->db->insert('users', $data);
    $rows = $this->db->affected_rows();
    if ($rows > 0) {
      $this->session->set_flashdata('message', '<div class="alert alert-success rounded-0 mb-2" role="alert">
          Successfully created an account!</div>');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger rounded-0 mb-2" role="alert">
        Failed to create account!</div>');
    }
    redirect('admin/users');
  }

  public function e_users($username)
  {
    $d['title'] = 'Users';
    $d['users'] = $this->db->get_where('users', ['username' => $username])->row_array();
    $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);

    $this->form_validation->set_rules('password', 'Password', 'required|trim|min_length[6]');

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('admin/users/e_users', $d);
      $this->load->view('templates/footer');
    } else {
      $data = ['password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT)];
      $this->_editUsers($data, $username);
    }
  }
  private function _editUsers($data, $username)
  {
    $this->db->update('users', $data, ['username' => $username]);
    $rows = $this->db->affected_rows();
    if ($rows > 0) {
      $this->session->set_flashdata('message', '<div class="alert alert-success rounded-0 mb-2" role="alert">
          Successfully edited an account!</div>');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger rounded-0 mb-2" role="alert">
        Failed to edit account!</div>');
    }
    redirect('admin/users');
  }

  public function d_users($username)
  {
    $this->db->delete('users', ['username' => $username]);
    $rows = $this->db->affected_rows();
    if ($rows > 0) {
      $this->session->set_flashdata('message', '<div class="alert alert-success rounded-0 mb-2" role="alert">
          Successfully deleted an account!</div>');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger rounded-0 mb-2" role="alert">
        Failed to delete account!</div>');
    }
    redirect('admin/users');
  }
}
