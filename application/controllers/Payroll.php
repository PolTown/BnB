<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Payroll extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model('Public_model');
        $this->load->model('Admin_model');
    }

    public function index()
    {
        $data['title'] = 'Salary';
        $data['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
        $data['employees'] = $this->Public_model->getEmployees(); // Change this to fetch your employee data
        $data['start'] = $this->input->get('start');
        $data['end'] = $this->input->get('end');

        // Calculate and fetch payroll data here
        $data['salary'] = $this->_calculatePayroll($data['start'], $data['end']);

        $this->load->view('templates/table_header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('templates/topbar');
        $this->load->view('payroll/salary/index', $data);
        $this->load->view('templates/table_footer');
    }

    private function _calculatePayroll($start, $end)
    {
        if ($start == '' || $end == '') {
            return false;
        } else {
            // Calculate payroll data here based on your business logic
            // You can retrieve data from the database and perform calculations as needed
            // For example, you might calculate salaries, deductions, and net pay for each employee.
            // Make sure to return the payroll data as an array or object.
            $payrollData = $this->Payroll_model->calculatePayroll($start, $end);
            return $payrollData;
        }
    }

    // Add other methods as needed for payroll processing

    public function salary()
    {
      // Department Data
      $d['title'] = 'Salary';
      $d['Salary'] = $this->db->get('Salary')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      $this->load->view('templates/table_header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/salary/index', $d); // Department Page
      $this->load->view('templates/table_footer');
    }

    public function a_salary()
    {
      // Add Employee
      $d['title'] = 'Salary';
      $d['department'] = $this->db->get('department')->result_array();
      $d['shift'] = $this->db->get('shift')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      // Form Validation
      $this->form_validation->set_rules('e_name', 'Employee Name', 'required|trim');
      $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
      $this->form_validation->set_rules('s_id', 'Shift', 'required|trim');
      $this->form_validation->set_rules('e_gender', 'Gender', 'required');
      $this->form_validation->set_rules('e_birth_date', 'Birth Date', 'required|trim');
      $this->form_validation->set_rules('e_hire_date', 'Hire Date', 'required|trim');
  
      if ($this->form_validation->run() == true) {
        $this->_addPayroll();
      }
      $this->load->view('templates/header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/salary/a_salary', $d); 
      $this->load->view('templates/footer');
    }

    
    public function deductions()
    {
      // Department Data
      $d['title'] = 'Deductions';
      $d['Deductions'] = $this->db->get('Deductions')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      $this->load->view('templates/table_header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/deductions/index', $d); // Department Page
      $this->load->view('templates/table_footer');
    }

    public function a_deductions()
    {
      // Add Employee
      $d['title'] = 'Deductions';
      $d['department'] = $this->db->get('department')->result_array();
      $d['shift'] = $this->db->get('shift')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      // Form Validation
      $this->form_validation->set_rules('e_name', 'Employee Name', 'required|trim');
      $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
      $this->form_validation->set_rules('s_id', 'Shift', 'required|trim');
      $this->form_validation->set_rules('e_gender', 'Gender', 'required');
      $this->form_validation->set_rules('e_birth_date', 'Birth Date', 'required|trim');
      $this->form_validation->set_rules('e_hire_date', 'Hire Date', 'required|trim');
  
      if ($this->form_validation->run() == true) {
        $this->_addPayroll();
      }
      $this->load->view('templates/header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/deductions/a_deductions', $d); 
      $this->load->view('templates/footer');
    }

    
    public function overtime()
    {
      // Department Data
      $d['title'] = 'Overtime';
      $d['Overtime'] = $this->db->get('Overtime')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      $this->load->view('templates/table_header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/overtime/index', $d); // Department Page
      $this->load->view('templates/table_footer');
    }

    public function a_overtime()
    {
      // Add Employee
      $d['title'] = 'Overtime';
      $d['department'] = $this->db->get('department')->result_array();
      $d['shift'] = $this->db->get('shift')->result_array();
      $d['account'] = $this->Admin_model->getAdmin($this->session->userdata['username']);
  
      // Form Validation
      $this->form_validation->set_rules('e_name', 'Employee Name', 'required|trim');
      $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
      $this->form_validation->set_rules('s_id', 'Shift', 'required|trim');
      $this->form_validation->set_rules('e_gender', 'Gender', 'required');
      $this->form_validation->set_rules('e_birth_date', 'Birth Date', 'required|trim');
      $this->form_validation->set_rules('e_hire_date', 'Hire Date', 'required|trim');
  
      if ($this->form_validation->run() == true) {
        $this->_addPayroll();
      }
      $this->load->view('templates/header', $d);
      $this->load->view('templates/sidebar');
      $this->load->view('templates/topbar');
      $this->load->view('payroll/overtime/a_overtime', $d); 
      $this->load->view('templates/footer');
    }
}
