using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TodoApi.Models;

namespace TodoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DrowsyDetectionsController : ControllerBase
    {
        private readonly DrowsyDetectionContext _context;

        public DrowsyDetectionsController(DrowsyDetectionContext context)
        {
            _context = context;
        }

        // GET: api/DrowsyDetections
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DrowsyDetection>>> GetDrowsyDetections()
        {
            return await _context.DrowsyDetections.ToListAsync();
        }

        // GET: api/DrowsyDetections/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DrowsyDetection>> GetDrowsyDetection(long id)
        {
            var drowsyDetection = await _context.DrowsyDetections.FindAsync(id);

            if (drowsyDetection == null)
            {
                return NotFound();
            }

            return drowsyDetection;
        }

        // PUT: api/DrowsyDetections/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDrowsyDetection(long id, DrowsyDetection drowsyDetection)
        {
            if (id != drowsyDetection.DetectionId)
            {
                return BadRequest();
            }

            _context.Entry(drowsyDetection).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DrowsyDetectionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/DrowsyDetections
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<DrowsyDetection>> PostDrowsyDetection(DrowsyDetection drowsyDetection)
        {
            _context.DrowsyDetections.Add(drowsyDetection);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDrowsyDetection", new { id = drowsyDetection.DetectionId }, drowsyDetection);
        }

        // DELETE: api/DrowsyDetections/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<DrowsyDetection>> DeleteDrowsyDetection(long id)
        {
            var drowsyDetection = await _context.DrowsyDetections.FindAsync(id);
            if (drowsyDetection == null)
            {
                return NotFound();
            }

            _context.DrowsyDetections.Remove(drowsyDetection);
            await _context.SaveChangesAsync();

            return drowsyDetection;
        }

        private bool DrowsyDetectionExists(long id)
        {
            return _context.DrowsyDetections.Any(e => e.DetectionId == id);
        }
    }
}
