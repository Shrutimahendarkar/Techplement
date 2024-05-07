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


/// <summary>
/// Summary description for cHandler
/// </summary>
public class cHandler : IHttpHandler
{
    public cHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void ProcessRequest(HttpContext context)
    {
        var sError = "";
        if (context.Request == null)
        {
            sError = "Http Call Prevented";

        }
        else
        {
            if (context.Request.Headers["X-Requested-With"] != "XMLHttpRequest") sError = "Http Call Prevented";
        }
        if (sError.Length > 0)
        {
            context.Response.Write(sError);
            return;
        }
        else
        {
            Process(context);
        }
    }

    public virtual void Process(HttpContext context)
    {

    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}