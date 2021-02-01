using IoTHubTrigger = Microsoft.Azure.WebJobs.EventHubTriggerAttribute;

using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Azure.EventHubs;
using System.Text;
using System.Net.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Azure.WebJobs.Extensions.SignalRService;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;

namespace Company.Function
{
    public static class Functions
    {
        private static HttpClient client = new HttpClient();

        [FunctionName("IotHubTrigger")]
        public static async Task Run(
            [IoTHubTrigger("messages/events", Connection = "IoTEndpoint")]EventData message,
            ILogger log,
            [SignalR(HubName = "MyHub")]IAsyncCollector<SignalRMessage> signalRMessages)
        {
            var messageFromIoTDevice = Encoding.UTF8.GetString(message.Body.Array);
            log.LogInformation($"C# IoT Hub trigger function processed a message: {messageFromIoTDevice}");

            await signalRMessages.AddAsync(
                new SignalRMessage
                {
                    Target = "iotMessage",
                    Arguments = new[] { messageFromIoTDevice }
                })
                .ConfigureAwait(false);
        }

        [FunctionName("negotiate")]
        public static SignalRConnectionInfo GetSignalRInfo(
            [HttpTrigger(AuthorizationLevel.Anonymous, "post")] HttpRequest req,
            [SignalRConnectionInfo(HubName = "MyHub")] SignalRConnectionInfo connectionInfo)
        {
            return connectionInfo;
        }
    }
}