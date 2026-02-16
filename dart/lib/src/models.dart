/// Response models for the Income Tax Calculator API.

/// API Response wrapper.
class IncometaxcalculatorResponse {
  final String status;
  final dynamic error;
  final IncometaxcalculatorData? data;

  IncometaxcalculatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory IncometaxcalculatorResponse.fromJson(Map<String, dynamic> json) => IncometaxcalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IncometaxcalculatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Income Tax Calculator API.

class IncometaxcalculatorData {
  int? year;
  String? filingStatus;
  int? income;
  int? standardDeduction;
  int? taxableIncome;
  double? totalTax;
  String? effectiveRate;
  String? marginalRate;
  double? incomeAfterTax;
  List<IncometaxcalculatorDataBracketsItem>? brackets;

  IncometaxcalculatorData({
    this.year,
    this.filingStatus,
    this.income,
    this.standardDeduction,
    this.taxableIncome,
    this.totalTax,
    this.effectiveRate,
    this.marginalRate,
    this.incomeAfterTax,
    this.brackets,
  });

  factory IncometaxcalculatorData.fromJson(Map<String, dynamic> json) => IncometaxcalculatorData(
      year: json['year'],
      filingStatus: json['filing_status'],
      income: json['income'],
      standardDeduction: json['standardDeduction'],
      taxableIncome: json['taxableIncome'],
      totalTax: json['totalTax'],
      effectiveRate: json['effectiveRate'],
      marginalRate: json['marginalRate'],
      incomeAfterTax: json['incomeAfterTax'],
      brackets: (json['brackets'] as List?)?.map((e) => IncometaxcalculatorDataBracketsItem.fromJson(e)).toList(),
    );
}

class IncometaxcalculatorDataBracketsItem {
  double? rate;
  String? ratePercent;
  int? rangeMin;
  int? rangeMax;
  int? taxableAmount;
  double? taxAmount;

  IncometaxcalculatorDataBracketsItem({
    this.rate,
    this.ratePercent,
    this.rangeMin,
    this.rangeMax,
    this.taxableAmount,
    this.taxAmount,
  });

  factory IncometaxcalculatorDataBracketsItem.fromJson(Map<String, dynamic> json) => IncometaxcalculatorDataBracketsItem(
      rate: json['rate'],
      ratePercent: json['ratePercent'],
      rangeMin: json['rangeMin'],
      rangeMax: json['rangeMax'],
      taxableAmount: json['taxableAmount'],
      taxAmount: json['taxAmount'],
    );
}

class IncometaxcalculatorRequest {
  double income;
  String filingStatus;
  int? year;

  IncometaxcalculatorRequest({
    required this.income,
    required this.filingStatus,
    this.year,
  });

  Map<String, dynamic> toJson() => {
      'income': income,
      'filing_status': filingStatus,
      if (year != null) 'year': year,
    };
}
