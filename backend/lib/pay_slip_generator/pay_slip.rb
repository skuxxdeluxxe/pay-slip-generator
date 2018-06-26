# Pay slip generator module
module PaySlipGenerator
  # Pay slip class
  class PaySlip
    def initialize(first_name, last_name, annual_income, super_rate, payment_period)
      @first_name = first_name || raise('Must provide first name')
      @last_name = last_name || raise('Must provide last name')
      @payment_period = payment_period || raise('Must provide payment period')
      @annual_income = validate_annual_income annual_income
      @super_rate = validate_super_rate super_rate
    end

    # rubocop:disable Metrics/MethodLength
    def generate
      gross_income = calculate_gross_income @annual_income
      income_tax = calculate_tax @annual_income
      {
        first_name: @first_name,
        last_name: @last_name,
        payment_period: @payment_period,
        gross_income: gross_income,
        income_tax: income_tax,
        net_income: calculate_net_income(gross_income, income_tax),
        super_annuation: calculate_super(@super_rate, gross_income)
      }
    end

    private

    def validate_annual_income(annual_income)
      raise('Must provide annual income') if annual_income.nil?
      raise('Annual income must be a number') unless numeric? annual_income
      annual_income.to_f
    end

    def validate_super_rate(super_rate)
      raise('Must provide super rate') if super_rate.nil?
      raise('Super rate must be a number') unless numeric? super_rate
      rate = super_rate.to_f
      raise('Invalid super rate, must be between 0 and 50') if rate < 0 || rate > 50
      rate
    end

    def calculate_super(super_rate, gross_income)
      (gross_income * (super_rate / 100)).round
    end

    def calculate_gross_income(annual_income)
      (annual_income / 12).round
    end

    def calculate_tax(annual_income)
      return 0 if annual_income <= 18_200
      return ((annual_income * 0.19) / 12).round if annual_income <= 37_000
      return ((3572 + ((annual_income - 37_000) * 0.325)) / 12).round if annual_income <= 80_000
      return ((17_547 + ((annual_income - 80_000) * 0.37)) / 12).round if annual_income <= 180_000
      return ((54_547 + ((annual_income - 180_000) * 0.45)) / 12).round if annual_income > 180_000
    end

    def calculate_net_income(gross_income, income_tax)
      gross_income - income_tax
    end

    # rubocop:disable Style/RescueModifier
    # rubocop:disable Lint/RescueWithoutErrorClass
    def numeric?(number)
      true if Float(number) rescue false
    end
  end
end
