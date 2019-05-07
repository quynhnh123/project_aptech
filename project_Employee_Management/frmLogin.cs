using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace project_Employee_Management
{
    public partial class frmLogin : Form
    {
        Employee_ManagementDataContext db;
        public frmLogin()
        {
            InitializeComponent();
            db = new Employee_ManagementDataContext();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            //Kiểm tra tài khoản và mật khẩu
            //tạo biến chứa tài khoản và mật khẩu
            var user_Acc = db.tbNhanViens.SingleOrDefault(x => x.taikhoan.Equals(txtAccount.Text) && x.matkhau.Equals(txtPassword.Text));
            if(user_Acc != null)//Đăng nhập đúng
            {
                //Lưu tài khoản 
                if( chkRemember.Checked == true)
                {
                  
                    Properties.Settings.Default.Username = user_Acc.taikhoan;
                    Properties.Settings.Default.Password = user_Acc.matkhau;
                    Properties.Settings.Default.Remember = true;
                }
                else
                {
                    Properties.Settings.Default.Username = "";
                    Properties.Settings.Default.Password = "";
                    Properties.Settings.Default.Remember = false;
                }
                Properties.Settings.Default.Save();
                //Chuyển qua frmMenu
                frmMenu frm_Menu = new frmMenu();
               
                //mở frm Menu
                frm_Menu.frmLogin = this;
                frm_Menu.Show();
                //ẩn frm Login
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kiểm tra lại tài khoản và mật khẩu", "Hệ thống cống rãnh",MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            txtAccount.Text = Properties.Settings.Default.Username;
            txtPassword.Text = Properties.Settings.Default.Password;
            chkRemember.Checked = Properties.Settings.Default.Remember;
        }

        private void frmLogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
