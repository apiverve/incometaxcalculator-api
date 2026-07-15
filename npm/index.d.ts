declare module '@apiverve/incometaxcalculator' {
  export interface incometaxcalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface incometaxcalculatorResponse {
    status: string;
    error: string | null;
    data: IncomeTaxCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface IncomeTaxCalculatorData {
      year:              number | null;
      filingStatus:      null | string;
      income:            number | null;
      standardDeduction: number | null;
      taxableIncome:     number | null;
      totalTax:          number | null;
      effectiveRate:     null | string;
      marginalRate:      null | string;
      incomeAfterTax:    number | null;
      monthlyTax:        number | null;
      monthlyIncome:     number | null;
      brackets:          Bracket[];
  }
  
  interface Bracket {
      rate:          number | null;
      ratePercent:   null | string;
      rangeMin:      number | null;
      rangeMax:      number | null;
      taxableAmount: number | null;
      taxAmount:     number | null;
  }

  export default class incometaxcalculatorWrapper {
    constructor(options: incometaxcalculatorOptions);

    execute(callback: (error: any, data: incometaxcalculatorResponse | null) => void): Promise<incometaxcalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: incometaxcalculatorResponse | null) => void): Promise<incometaxcalculatorResponse>;
    execute(query?: Record<string, any>): Promise<incometaxcalculatorResponse>;
  }
}
