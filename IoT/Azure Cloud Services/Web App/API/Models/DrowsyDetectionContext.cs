using Microsoft.EntityFrameworkCore;

namespace TodoApi.Models
{
    public class DrowsyDetectionContext : DbContext
    {
        public DrowsyDetectionContext(DbContextOptions<DrowsyDetectionContext> options)
            : base(options)
        {
        }

        public DbSet<DrowsyDetection> DrowsyDetections { get; set; }
    }
}