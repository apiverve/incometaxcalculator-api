# Income Tax Calculator API - Dart/Flutter Client

Income Tax Calculator is a tool for calculating US federal income tax. It takes your income, filing status, and year to compute your total tax, effective rate, marginal rate, and a full bracket-by-bracket breakdown.

[![pub package](https://img.shields.io/pub/v/apiverve_incometaxcalculator.svg)](https://pub.dev/packages/apiverve_incometaxcalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Income Tax Calculator API](https://apiverve.com/marketplace/incometaxcalculator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_incometaxcalculator: ^1.1.14
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
      'filing_status': 'single',
      'year': 2024
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
    "totalTax": 10852.5,
    "effectiveRate": "12.77%",
    "marginalRate": "22%",
    "incomeAfterTax": 74147.5,
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
    ]
  }
}
```

## API Reference

- **API Home:** [Income Tax Calculator API](https://apiverve.com/marketplace/incometaxcalculator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/incometaxcalculator](https://docs.apiverve.com/ref/incometaxcalculator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
