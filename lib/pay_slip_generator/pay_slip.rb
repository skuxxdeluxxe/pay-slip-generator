# Pay slip generator module
module PaySlipGenerator
  # Pay slip class
  class PaySlip
    def initialize(first_name, last_name, annual_income, super_rate, payment_period)
      @first_name = first_name || raise('Must provide first name')
      @last_name = last_name || raise('Must provide last name')
      raise('Must provide annual income') if annual_income.nil?
      raise('Must provide super rate') if super_rate.nil?
      @payment_period = payment_period || raise('Must provide payment period')

      raise('Annual income must be a number') unless numeric? annual_income
      raise('Super rate must be a number') unless numeric? super_rate
      @annual_income = annual_income.to_f
      @super_rate = super_rate.to_f
      raise('Invalid super rate, must be between 0 and 50') if @super_rate < 0 || @super_rate > 50
    end

    def generate
      gross_income = calculate_gross_income @annual_income
      income_tax = calculate_tax @annual_income
      net_income = calculate_net_income gross_income, income_tax
      super_annuation = calculate_super @super_rate, gross_income
      {
        first_name: @first_name,
        last_name: @last_name,
        payment_period: @payment_period,
        gross_income: gross_income,
        income_tax: income_tax,
        net_income: net_income,
        super_annuation: super_annuation
      }
    end

    private

    def calculate_super(super_rate, gross_income)
      (gross_income.to_f * (super_rate.to_f / 100)).round
    end

    def calculate_gross_income(annual_income)
      (annual_income.to_f / 12).round
    end

    def calculate_tax(annual_income)
      income = annual_income.to_f
      return 0 if income <= 18_200
      return ((income * 0.19) / 12).round if income <= 37_000
      return ((3572 + ((income - 37_000) * 0.325)) / 12).round if income <= 80_000
      return ((17_547 + ((income - 80_000) * 0.37)) / 12).round if income <= 180_000
      return ((54_547 + ((income - 180_000) * 0.45)) / 12).round if income > 180_000
    end

    def calculate_net_income(gross_income, income_tax)
      gross_income - income_tax
    end

    def numeric?(number)
      true if Float(number) rescue false
    end
  end
end
