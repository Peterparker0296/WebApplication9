using iTextSharp.text;


using System.Text;
using System.Threading;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iTextSharp.text.pdf.AcroFields;
using System.Web.UI.HtmlControls;
using AngleSharp.Html.Parser;
using EvoPdf;

namespace WebApplication9
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {


           Label2.Text = Label1.Text;

            TextWriter outTextWriter = new StringWriter();
           //Server.Execute("WebForm1.aspx", outTextWriter);

            string htmlStringToConvert = outTextWriter.ToString();

            HtmlToPdfConverter htmlToPdfConverter = new HtmlToPdfConverter();

        
            htmlToPdfConverter.LicenseKey = "4W9+bn19bn5ue2B+bn1/YH98YHd3d3c=";

         
            string baseUrl = HttpContext.Current.Request.Url.AbsoluteUri;

            byte[] outPdfBuffer = htmlToPdfConverter.ConvertHtml(htmlStringToConvert, baseUrl);

            
            Response.AddHeader("Content-Type", "application/pdf");

            
            Response.AddHeader("Content-Disposition", String.Format( outPdfBuffer.Length.ToString()));

            Response.BinaryWrite(outPdfBuffer);

            
            Response.End();


























            //using (StringWriter sw = new StringWriter())
            //{
            //    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            //    {
            //        StringBuilder sb = new StringBuilder();

            //            StringReader sr = new StringReader(sb.ToString());
            //            Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            //            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //            pdfDoc.Open();
            //            htmlparser.Parse(sr);

            //            Response.ContentType = "application/pdf";
            //            Response.AddHeader("content-disposition", "attachment;filename=HTMLExport.pdf");
            //            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //            Response.Write(pdfDoc);
            //            Response.End();

            //    }

            //}


        }

        private void ShowPdf(string v)
        {
            throw new NotImplementedException();
        }


        //protected void Unnamed1_Click(object sender, EventArgs e)
        //{



        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    using (MemoryStream memoryStream = new MemoryStream())
        //    {

        //        StringBuilder sb = new StringBuilder();

        //        StringReader sr = new StringReader(sb.ToString());
        //        StringWriter sw = new StringWriter();
        //        HtmlTextWriter hw = new HtmlTextWriter(sw);
        //        this.Page.RenderControl(hw);
        //        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
        //        StringReader se = new StringReader(sw.ToString());


        //        pdfDoc.Open();
        //        htmlparser.Parse(sr);

        //        //pdfDoc.Close();
        //        byte[] bytes = memoryStream.ToArray();
        //        memoryStream.Close();


        //        try
        //        {
        //            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        //            mail.To.Add("harrisk0296@gmail.com");
        //            mail.From = new MailAddress("raj7373@gmail.com");
        //            mail.Subject = ("asp.net");
        //            mail.Body = Request.Form["tamil values"];
        //            mail.Attachments.Add(new Attachment(new MemoryStream(bytes), "iTextSharpPDF.pdf"));
        //            SmtpClient smtp = new SmtpClient();
        //            smtp.Host = "smtp.gmail.com";
        //            smtp.Port = 587;
        //            smtp.UseDefaultCredentials = false;
        //            smtp.Credentials = new System.Net.NetworkCredential("kamarajtamil7373@gmail.com", "muczfbpvlbffulth");
        //            smtp.EnableSsl = true;
        //            smtp.Send(mail);
        //        }
        //        catch (Exception ex)
        //        {


        //        }
        //    }
        //}





    }
}