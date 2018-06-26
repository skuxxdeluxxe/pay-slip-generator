module PaySlipGenerator
  class PaySlip
    def initialize(first_name, last_name, annual_income, super_rate, start_date)
      @first_name = first_name || raise('Must provide first name')
      @last_name = last_name  || raise('Must provide last name')
      annual_income = annual_income || raise('Must provide annual income')
      super_rate = super_rate || raise('Must provide super rate')
      @start_date = start_date || raise('Must provide start date')

      @gross_income = calculate_gross_income annual_income
      @super_figure = calculate_super super_rate, @gross_income
      @income_tax = calculate_tax annual_income
      @net_income = calculate_net_income @gross_income, @income_tax
    end

    def generate
      puts "#{@first_name} #{@last_name}, #{@start_date}, #{@gross_income}, #{@income_tax}, #{@net_income}, #{@super_figure}"
    end

    private

    def calculate_super(super_rate, gross_income)
      (gross_income.to_f * (super_rate.to_f/100)).round
    end

    def calculate_gross_income(annual_income)
      (annual_income.to_f / 12).round
    end

    def calculate_tax(annual_income)
      income = annual_income.to_f
      return 0 if income <= 18200
      return ((income * 0.19)/12).round if income <= 37000
      return ((3572 + ((income - 37000) * 0.325))/12).round if income <= 80000
      return ((17547 + ((income - 80000) * 0.37))/12).round if income <= 180000
      return ((54547 + ((income - 180000) * 0.45))/12).round if income > 180000
    end

    def calculate_net_income(gross_income, income_tax)
      gross_income - income_tax
    end
  end
end
