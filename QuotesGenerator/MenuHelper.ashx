<%@ WebHandler Language="C#" Class="MenuHelper" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.IO;
using System.Web.Services;
using System.Web.Configuration;
using System.Collections.Generic;
using TBSS.WCF;

public class MenuHelper : cHandler {
    string sMethod = "";
    DataTable dt = new DataTable();

    public override void Process(HttpContext context)
    {
        sMethod = context.Request["sMethod"];
        switch (sMethod)
        {
            case "GetEmployeeMenu":
                {
                    string sEmpCode = context.Request["sEmpCode"];
                    context.Response.Write(MenuResourceList(sEmpCode));
                }
                break;
            case "GetEmployeeSubMenu":
                {
                    string sEmpCode = context.Request["sEmpCode"];
                    string sParentID = context.Request["sParentID"];
                    context.Response.Write(SubMenuResourceList(sEmpCode, sParentID));
                }
                break;
        }
    }
    
    //usp_GetEmployeeMenu
    public string MenuResourceList(string p_sEmpCode)
    {
        dt = new DataTable();
        SqlConnection SQLcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["igrowConnString"].ConnectionString);
        SQLcon.Open();
        SqlCommand sqlcmd = new SqlCommand("usp_GetEmployeeMenu", SQLcon);
        sqlcmd.Parameters.AddWithValue("@t_vc_EmCode", p_sEmpCode);
        sqlcmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adpt = new SqlDataAdapter(sqlcmd);
        adpt.Fill(dt);
        if (SQLcon.State != ConnectionState.Closed)
        {
            SQLcon.Close();
        }
        return new cResult(dt)._sObject;
    }

    //usp_GetEmployeeSubMenu
    public string SubMenuResourceList(string p_sEmpCode, string p_sParentID)
    {
        dt = new DataTable();
        SqlConnection SQLcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["igrowConnString"].ConnectionString);
        SQLcon.Open();
        SqlCommand sqlcmd = new SqlCommand("usp_GetEmployeeSubMenu", SQLcon);
        sqlcmd.Parameters.AddWithValue("@t_vc_EmCode", p_sEmpCode);
        sqlcmd.Parameters.AddWithValue("@ParentID", p_sParentID);
        sqlcmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adpt = new SqlDataAdapter(sqlcmd);
        adpt.Fill(dt);
        if (SQLcon.State != ConnectionState.Closed)
        {
            SQLcon.Close();
        }
        return new cResult(dt)._sObject;
    }
   

}