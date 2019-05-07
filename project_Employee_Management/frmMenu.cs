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
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();
        }
        public Form frmLogin { get; set; }
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        
        //Tạo hàm riêng chỉ để load các form MDI
        private void Load_frm_Mdi(Form frm)
        {
            frm.MdiParent = this;
            //Các thuộc tính hiển thị
            
            frm.TopLevel = false;
            frm.AutoScroll = true;
            //hiển thị
            //kiểm tra : nếu như form parent(frm hiện tại) đang có form mdi đang mở
            if (this.ActiveMdiChild != null)
            {
                //gán frm hiện tại đang mở vào một biến
                var frmCurrent = this.ActiveMdiChild;

                //đóng frm hiện tại
                //this.splitContainer1.Panel2.Controls.Remove(frmCurrent);
                    
                    frmCurrent.Close();
                    //mở frm truyền vào
                    frm.Show();
            }
            else// nếu như chưa có form nào mở
            {
                frm.Show();
            }
            this.sts_frm_Name.Text = frm.Text;
            this.splitContainer1.Panel2.Controls.Add(frm);
            frm.FormBorderStyle = FormBorderStyle.None;
            frm.StartPosition = FormStartPosition.CenterParent;
            frm.Dock = DockStyle.Top;
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            frmLogin.Show();
            this.Close();
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void frmMenu_Load(object sender, EventArgs e)
        {
            frmInfo frm = new frmInfo();
            Load_frm_Mdi(frm);
        }

        private void frmMenu_FormClosed(object sender, FormClosedEventArgs e)
        {
            frmLogin.Show();
        }

        private void btnInfo_Click(object sender, EventArgs e)
        {
            frmInfo frm = new frmInfo();
            Load_frm_Mdi(frm);
        }

        private void btnEmployee_Click(object sender, EventArgs e)
        {
            frmEmployee frm = new frmEmployee();
            Load_frm_Mdi(frm);
        }

        private void btnLab_Click(object sender, EventArgs e)
        {
            frmLab frm = new frmLab();
            Load_frm_Mdi(frm);
        }

        private void btnProject_Click(object sender, EventArgs e)
        {
            frmProject frm = new frmProject();
            Load_frm_Mdi(frm);
        }

        private void btnTimekeeping_Click(object sender, EventArgs e)
        {
            frmTimekeeping frm = new frmTimekeeping();
            Load_frm_Mdi(frm);
        }

        private void btnEvaluation_Click(object sender, EventArgs e)
        {
            frmEvaluation frm = new frmEvaluation();
            Load_frm_Mdi(frm);
        }

        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {

        }
    }
}
