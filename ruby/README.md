# Income Tax Calculator API - Ruby Gem

Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income, and can add Social Security and Medicare (FICA) for true take-home pay.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_incometaxcalculator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_incometaxcalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_incometaxcalculator'

# Initialize the client
client = APIVerve::Incometaxcalculator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  income: 85000,
  rate: 22,
  deduction: 14600
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ income: 85000, rate: 22, deduction: 14600 })
  puts response["data"]
rescue APIVerve::Incometaxcalculator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Incometaxcalculator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Incometaxcalculator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "year": 2025,
    "filing_status": "single",
    "income": 85000,
    "standardDeduction": 15000,
    "taxableIncome": 70000,
    "totalTax": 10313.88,
    "effectiveRate": "12.13%",
    "marginalRate": "22%",
    "incomeAfterTax": 74686.12,
    "monthlyTax": 859.49,
    "monthlyIncome": 6223.84,
    "brackets": [
      {
        "rate": 0.1,
        "ratePercent": "10.0%",
        "rangeMin": 0,
        "rangeMax": 11925,
        "taxableAmount": 11926,
        "taxAmount": 1192.6
      },
      {
        "rate": 0.12,
        "ratePercent": "12.0%",
        "rangeMin": 11926,
        "rangeMax": 48475,
        "taxableAmount": 36550,
        "taxAmount": 4386
      },
      {
        "rate": 0.22,
        "ratePercent": "22.0%",
        "rangeMin": 48476,
        "rangeMax": 103350,
        "taxableAmount": 21524,
        "taxAmount": 4735.28
      }
    ],
    "fica": {
      "total": 6502.5,
      "socialSecurityRate": 0.062,
      "socialSecurityWageBase": 176100,
      "socialSecurityTax": 5270,
      "medicareRate": 0.0145,
      "medicareTax": 1232.5,
      "additionalMedicareThreshold": 200000,
      "additionalMedicareTax": 0
    },
    "takeHomePay": 68183.62,
    "monthlyTakeHomePay": 5681.97,
    "totalEffectiveRate": "19.78%"
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incometaxcalculator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/incometaxcalculator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/incometaxcalculator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
