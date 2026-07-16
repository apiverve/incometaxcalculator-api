using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.IncomeTaxCalculator
{
    /// <summary>
    /// Query options for the Income Tax Calculator API
    /// </summary>
    public class IncomeTaxCalculatorQueryOptions
    {
        /// <summary>
        /// Gross annual income in USD
        /// </summary>
        [JsonProperty("income")]
        public double Income { get; set; }

        /// <summary>
        /// Tax rate as a percentage (e.g., 22 for 22%)
        /// </summary>
        [JsonProperty("rate")]
        public double Rate { get; set; }

        /// <summary>
        /// Optional deduction amount to subtract from income before calculating tax
        /// </summary>
        [JsonProperty("deduction")]
        public double? Deduction { get; set; }
    }
}
