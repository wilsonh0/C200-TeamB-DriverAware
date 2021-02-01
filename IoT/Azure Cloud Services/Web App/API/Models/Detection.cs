using System;
using System.ComponentModel.DataAnnotations;

namespace TodoApi.Models
{
    public class Detection
    {
        [Key]
        public long DetectionId { get; set; }
        public string DeviceId { get; set; }
        public string SensorId { get; set; }
        public string Classification { get; set; }
        public DateTime Timestamp { get; set; }
    }
}