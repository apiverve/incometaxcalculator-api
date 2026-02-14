declare module '@apiverve/incometaxcalculator' {
  export interface incometaxcalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface incometaxcalculatorResponse {
    status: string;
    error: string | null;
    data: IncomeTaxCalculatorData;
    code?: number;
  }


  interface IncomeTaxCalculatorData {
      year:              number;
      filingStatus:      string;
      income:            number;
      standardDeduction: number;
      taxableIncome:     number;
      totalTax:          number;
      effectiveRate:     string;
      marginalRate:      string;
      incomeAfterTax:    number;
      brackets:          Bracket[];
  }
  
  interface Bracket {
      rate:          number;
      ratePercent:   string;
      rangeMin:      number;
      rangeMax:      number;
      taxableAmount: number;
      taxAmount:     number;
  }

  export default class incometaxcalculatorWrapper {
    constructor(options: incometaxcalculatorOptions);

    execute(callback: (error: any, data: incometaxcalculatorResponse | null) => void): Promise<incometaxcalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: incometaxcalculatorResponse | null) => void): Promise<incometaxcalculatorResponse>;
    execute(query?: Record<string, any>): Promise<incometaxcalculatorResponse>;
  }
}
