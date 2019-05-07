using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace project_Employee_Management
{
    class ConnectDB
    {
        public static SqlConnection GetDBConnection()
        {
            string datasource = @"DESKTOP-S3C1RNO\SQLEXPRESS";

            string database = "EmployeeManagement";
            string username = "sa";
            string password = "123456";
            //trả về class tiện ích giúp kết nối vào cơ sở dữ liệu SQL Server.
            return Config_Connect.GetDBConnection(datasource, database, username, password);
        }
    }
}
