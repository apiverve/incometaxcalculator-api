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
        public string Income { get; set; }

        /// <summary>
        /// Filing status
        /// </summary>
        [JsonProperty("filing_status")]
        public string Filing_status { get; set; }

        /// <summary>
        /// The tax year to use for brackets. Defaults to the previous year.
        /// </summary>
        [JsonProperty("year")]
        public string Year { get; set; }
    }
}
