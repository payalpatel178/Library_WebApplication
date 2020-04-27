using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace LibraryWebApplication.BusinessLayer
{
    public class UtilityTools
    {
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["LibraryWebDB"].ConnectionString;
        }
        public static int ExecuteStudentInsert(Student student)
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_InsertStudentInfo";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {
                        SqlParameter[] param = new SqlParameter[5];
                        param[0] = new SqlParameter("@FirstName", System.Data.SqlDbType.VarChar, 50);
                        param[1] = new SqlParameter("@LastName", System.Data.SqlDbType.VarChar, 50);
                        param[2] = new SqlParameter("@BirthDate", System.Data.SqlDbType.DateTime, 8);
                        param[3] = new SqlParameter("@Gender", System.Data.SqlDbType.Char, 6);
                        param[4] = new SqlParameter("@Class", System.Data.SqlDbType.VarChar, 20);

                        param[0].Value = student.FirstName;
                        param[1].Value = student.LastName;
                        param[2].Value = student.BirthDate;
                        param[3].Value = student.Gender;
                        param[4].Value = student.Class;

                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        return (int)cmd.ExecuteScalar();
                    }
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.ErrorCode.ToString());
                    return ex.ErrorCode;
                }
            }
        }

        public static int ExecuteBookInsert(Book book,Author author,Type type)
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_InsertBookInfo";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {
                        SqlParameter[] param = new SqlParameter[6];
                        param[0] = new SqlParameter("@Title", System.Data.SqlDbType.VarChar, 50);
                        param[1] = new SqlParameter("@PageCount", System.Data.SqlDbType.Int);
                        param[2] = new SqlParameter("@Price", System.Data.SqlDbType.Decimal);
                        param[3] = new SqlParameter("@FirstName", System.Data.SqlDbType.VarChar, 50);
                        param[4] = new SqlParameter("@LastName", System.Data.SqlDbType.VarChar, 50);
                        param[5] = new SqlParameter("@Name", System.Data.SqlDbType.VarChar, 50);

                        param[0].Value = book.Title;
                        param[1].Value = book.PageCount;
                        param[2].Value = book.Price;
                        param[3].Value = author.FirstName;
                        param[4].Value = author.LastName;
                        param[5].Value = type.Name;

                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        return (int)cmd.ExecuteScalar();
                    }
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.ErrorCode.ToString());
                    return ex.ErrorCode;
                }
            }
        }

        public static object ExecuteStudentAndBookSelect()
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_ExecuteSelectStudentAndBook";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new System.Data.DataSet();
                        da.Fill(ds);


                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        return ds;

                    }
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static int ExecuteBorrowBookInsert(Borrow borrow)
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_InsertBorrowBookInfo";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {
                        SqlParameter[] param = new SqlParameter[2];
                        param[0] = new SqlParameter("@StudentId", System.Data.SqlDbType.Int);
                        param[1] = new SqlParameter("@BookId", System.Data.SqlDbType.Int);

                        param[0].Value = borrow.StudentId;
                        param[1].Value = borrow.BookId;

                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        return (int)cmd.ExecuteScalar();
                    }
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.ErrorCode.ToString());
                    return ex.ErrorCode;
                }
            }
        }

        public static object ExecuteStudentWithBookReturnSelect()
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_ExecuteSelectStudentWithBorrowBook";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new System.Data.DataSet();
                        da.Fill(ds);


                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        return ds;

                    }
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static int ExecuteReturnBookUpdateBroughtDate(Borrow returnBook)
        {
            SqlConnection conn;
            SqlCommand cmd;

            using (conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    string sql = "sp_UpdateDateOnReturnBook";//Name of the store procedure

                    conn.Open();
                    using (cmd = new SqlCommand(sql, conn))
                    {
                        SqlParameter[] param = new SqlParameter[2];
                        param[0] = new SqlParameter("@StudentId", System.Data.SqlDbType.Int);
                        param[1] = new SqlParameter("@BookId", System.Data.SqlDbType.Int);

                        param[0].Value = returnBook.StudentId;
                        param[1].Value = returnBook.BookId;

                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        return (int)cmd.ExecuteScalar();
                    }
                }
                catch (SqlException ex)
                {
                    Console.Write(ex.ErrorCode.ToString());
                    return ex.ErrorCode;
                }
            }
        }
    }
}