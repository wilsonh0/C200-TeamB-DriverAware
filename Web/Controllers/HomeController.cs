using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using WebApp_4.Models;

namespace WebApp_4.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {

            RestClient restClient = new RestClient("https://c200-teamb-api.azurewebsites.net/");

            RestRequest restRequest = new RestRequest("api/detections", Method.GET);

            IRestResponse restResponse = restClient.Execute(restRequest);

            string response = restResponse.Content;

            var listDetect = JsonConvert.DeserializeObject<List<Detections>>(response);

            int counter = listDetect.Count;


            return View(listDetect);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
