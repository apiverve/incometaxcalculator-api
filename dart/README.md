# Income Tax Calculator API - Dart/Flutter Client

Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income, and can add Social Security and Medicare (FICA) for true take-home pay.

[![pub package](https://img.shields.io/pub/v/apiverve_incometaxcalculator.svg)](https://pub.dev/packages/apiverve_incometaxcalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Income Tax Calculator API](https://apiverve.com/marketplace/incometaxcalculator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_incometaxcalculator: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_incometaxcalculator/apiverve_incometaxcalculator.dart';

void main() async {
  final client = IncometaxcalculatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'income': 85000,
      'rate': 22,
      'deduction': 14600
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Income Tax Calculator API](https://apiverve.com/marketplace/incometaxcalculator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/incometaxcalculator](https://docs.apiverve.com/ref/incometaxcalculator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
