# Income Tax Calculator API - PHP Package

Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income, and can add Social Security and Medicare (FICA) for true take-home pay.

## Installation

Install via Composer:

```bash
composer require apiverve/incometaxcalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Incometaxcalculator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'income' => 85000,
    'rate' => 22,
    'deduction' => 14600
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Incometaxcalculator\Client;
use APIVerve\Incometaxcalculator\Exceptions\APIException;
use APIVerve\Incometaxcalculator\Exceptions\ValidationException;

try {
    $response = $client->execute(['income' => 85000, 'rate' => 22, 'deduction' => 14600]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incometaxcalculator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/incometaxcalculator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/incometaxcalculator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
