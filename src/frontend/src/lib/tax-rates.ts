export interface TaxInfo {
  province: string;
  type: 'GST' | 'HST' | 'GST+PST' | 'GST+QST';
  rate: number;
  breakdown: string;
}

const TAX_RATES: Record<string, TaxInfo> = {
  ON: { province: 'Ontario', type: 'HST', rate: 0.13, breakdown: '13% HST' },
  BC: { province: 'British Columbia', type: 'GST+PST', rate: 0.12, breakdown: '5% GST + 7% PST' },
  AB: { province: 'Alberta', type: 'GST', rate: 0.05, breakdown: '5% GST' },
  QC: { province: 'Quebec', type: 'GST+QST', rate: 0.14975, breakdown: '5% GST + 9.975% QST' },
  MB: { province: 'Manitoba', type: 'GST+PST', rate: 0.12, breakdown: '5% GST + 7% PST' },
  SK: { province: 'Saskatchewan', type: 'GST+PST', rate: 0.11, breakdown: '5% GST + 6% PST' },
  NS: { province: 'Nova Scotia', type: 'HST', rate: 0.14, breakdown: '14% HST' },
  NB: { province: 'New Brunswick', type: 'HST', rate: 0.15, breakdown: '15% HST' },
  NL: { province: 'Newfoundland & Labrador', type: 'HST', rate: 0.15, breakdown: '15% HST' },
  PE: { province: 'Prince Edward Island', type: 'HST', rate: 0.15, breakdown: '15% HST' },
  NT: { province: 'Northwest Territories', type: 'GST', rate: 0.05, breakdown: '5% GST' },
  NU: { province: 'Nunavut', type: 'GST', rate: 0.05, breakdown: '5% GST' },
  YT: { province: 'Yukon', type: 'GST', rate: 0.05, breakdown: '5% GST' },
};

export function getTaxInfo(provinceCode: string): TaxInfo {
  return TAX_RATES[provinceCode] || TAX_RATES['ON'];
}

export function calculateTax(amount: number, provinceCode: string): {
  subtotal: number;
  taxAmount: number;
  taxRate: number;
  taxLabel: string;
  total: number;
} {
  const info = getTaxInfo(provinceCode);
  const taxAmount = Math.round(amount * info.rate * 100) / 100;
  return {
    subtotal: amount,
    taxAmount,
    taxRate: info.rate,
    taxLabel: info.breakdown,
    total: Math.round((amount + taxAmount) * 100) / 100,
  };
}
