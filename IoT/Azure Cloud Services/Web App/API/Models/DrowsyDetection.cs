using RestSharp.Deserializers;
using System;
using System.ComponentModel.DataAnnotations;

namespace TodoApi.Models
{
    public class DrowsyDetection
    {
        [Key]
        public long DetectionId { get; set; }

        public string SensorId { get; set; }

        public decimal Normal { get; set; }

        [DeserializeAs(Name = "Eyes Closed")]
        public decimal EyesClosed { get; set; }

        public decimal Yawn { get; set; }

        public Boolean Drowsy { get; set; }
        
        public DateTime Timestamp { get; set; }
    }
}