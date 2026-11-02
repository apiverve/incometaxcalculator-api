/// Response models for the Income Tax Calculator API.

/// API Response wrapper.
class IncometaxcalculatorResponse {
  final String status;
  final dynamic error;
  final IncometaxcalculatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  IncometaxcalculatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory IncometaxcalculatorResponse.fromJson(Map<String, dynamic> json) => IncometaxcalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IncometaxcalculatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Income Tax Calculator API.

class IncometaxcalculatorData {
  num? year;
  String? filingStatus;
  num? income;
  num? standardDeduction;
  num? taxableIncome;
  num? totalTax;
  String? effectiveRate;
  String? marginalRate;
  num? incomeAfterTax;
  num? monthlyTax;
  num? monthlyIncome;
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
    this.monthlyTax,
    this.monthlyIncome,
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
      monthlyTax: json['monthlyTax'],
      monthlyIncome: json['monthlyIncome'],
      brackets: (json['brackets'] as List?)?.map((e) => IncometaxcalculatorDataBracketsItem.fromJson(e)).toList(),
    );
}

class IncometaxcalculatorDataBracketsItem {
  num? rate;
  String? ratePercent;
  num? rangeMin;
  num? rangeMax;
  num? taxableAmount;
  num? taxAmount;

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
  double rate;
  double? deduction;

  IncometaxcalculatorRequest({
    required this.income,
    required this.rate,
    this.deduction,
  });

  Map<String, dynamic> toJson() => {
      'income': income,
      'rate': rate,
      if (deduction != null) 'deduction': deduction,
    };
}
