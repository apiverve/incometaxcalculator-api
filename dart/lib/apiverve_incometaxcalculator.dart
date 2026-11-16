/// Income Tax Calculator API client for Dart/Flutter
///
/// Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income, can add Social Security and Medicare (FICA) for true take-home pay, and with state=NY adds that state's income tax on the same income.
///
/// For more information, visit: https://apiverve.com/marketplace/incometaxcalculator?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_incometaxcalculator;

export 'src/client.dart';
export 'src/models.dart';
