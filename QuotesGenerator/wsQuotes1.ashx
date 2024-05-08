<%@ WebHandler Language="C#"  Class="wsQuotes1" %>
using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Newtonsoft.Json;


public class wsQuotes1 : cHandler
{
    string sMethod = "";
    DataTable dt = new DataTable();
    public override void Process(HttpContext context)
    {
        sMethod = context.Request["sMethod"];
        switch (sMethod)
        {
            case "fetchquotes":
                {
                    string sid = context.Request["sid"];
                    DataTable dt = fetchquotes(sid);
                    string jsonData = JsonConvert.SerializeObject(dt); 
                    context.Response.ContentType = "application/json";
                    context.Response.Write(jsonData);
                }
                break;
        }
    }
    public DataTable fetchquotes(string p_sid)
    {
        dt = new DataTable();
        SqlConnection SQLcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        SQLcon.Open();
        SqlCommand sqlcmd = new SqlCommand("usp_QuotesFetch", SQLcon);
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@id", p_sid);
        SqlDataAdapter adpt = new SqlDataAdapter(sqlcmd);
        adpt.Fill(dt);
        if (SQLcon.State != ConnectionState.Closed)
        {
            SQLcon.Close();
        }
        return dt;

    }
        public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}