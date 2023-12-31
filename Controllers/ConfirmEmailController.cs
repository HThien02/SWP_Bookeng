﻿using Microsoft.AspNetCore.Mvc;
using SWP_template.Models;

namespace SWP_template.Controllers
{
    public class ConfirmEmailController : Controller
    {
        public IActionResult Index()
        {

            return View("~/Views/Signup/ConfirmEmail.cshtml");
        }
        public string SendConfirmEmail(string email, string roleID)
        {
            Random random = new Random();
            int randomNumber = random.Next(0, 999999);
            string result = randomNumber.ToString("D6");
            SendMailServices sendMailServices = new SendMailServices();
            var mailContent = new MailContent();
            mailContent.To = email;
            mailContent.Subject = $"Verifi your Bookeng email";
            if(roleID == "R003") { 
            mailContent.Body = "<h1>Hi, Thang! Thanks for joining our website. Before Bookeng your trip, please verifi your email.</h1>" +
                $"<p>Here is your code: {result}</p>";
            }else if(roleID == "R002")
            {
                mailContent.Body = "<h1>Hi, Thang! Thanks for joining our website. Before publishing your destination, please verifi your email.</h1>" +
                $"<p>Here is your code: {result}</p>";
            }
            _ = sendMailServices.SendMail(mailContent).Result;
            return result;

        }
        [HttpPost]
        public IActionResult ConfirmEmail(string verifiCode, string code, string name, string account, string email, string password, string roleID)
        {
            if (verifiCode.Equals(code))
            {
                if(roleID == "R003")
                {
                EFManage.SinupAccount(name,account, email, password, roleID);
                return View("/Views/Login/Login.cshtml");

                }else
                {
                    EFManage.SinupAccount(name, account, email, password, roleID);
                    return View("/Views/Owner/OwnerLogin.cshtml");
                }
            }
            else
            {
                ViewBag.fail = "Wrong verifi code. Try again";
                ViewBag.verifiCode = verifiCode;
                ViewBag.name = name;
                ViewBag.account = account;
                ViewBag.email = email;
                ViewBag.password = password;
                return View("~/Views/Signup/ConfirmEmail.cshtml");
            }
        }
    }
}
