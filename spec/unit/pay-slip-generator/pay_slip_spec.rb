require 'spec_helper'
require 'pay_slip_generator/pay_slip'

describe PaySlipGenerator::PaySlip do
  describe '#initilize' do
    it 'it fails when the first name has not been provided' do
      expect { new PaySlipGenerator::PaySlip.new nil, 'last', '150', '9', '30 March to 31 March' }
        .to raise_error 'Must provide first name'
    end

    it 'it fails when the last name has not been provided' do
      expect { new PaySlipGenerator::PaySlip.new 'first', nil, '150', '9', '30 March to 31 March' }
        .to raise_error 'Must provide last name'
    end

    it 'it fails when the annual income has not been provided' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', nil, '9', '30 March to 31 March' }
        .to raise_error 'Must provide annual income'
    end

    it 'it fails when the super rate has not been provided' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', '150', nil, '30 March to 31 March' }
        .to raise_error 'Must provide super rate'
    end

    it 'it fails when the payment period has not been provided' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', '150', '9', nil }.to raise_error 'Must provide payment period'
    end

    it 'it fails when the annual income is not a number' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', 'sdfsdf', '9', '30 March to 31 March' }
        .to raise_error 'Annual income must be a number'
    end

    it 'it fails when the super rate is not a number' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', '150', 'sdfsdf', '30 March to 31 March' }
        .to raise_error 'Super rate must be a number'
    end

    it 'it fails when the super rate is below 0' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', '150', '-5', '30 March to 31 March' }
        .to raise_error 'Invalid super rate, must be between 0 and 50'
    end

    it 'it fails when the super rate is above 50' do
      expect { new PaySlipGenerator::PaySlip.new 'first', 'last_name', '150', '100', '30 March to 31 March' }
        .to raise_error 'Invalid super rate, must be between 0 and 50'
    end
  end

  describe '#generate' do
    subject(:pay_slip) { described_class.new 'David', 'Rudd', '60050', '9', '01 March - 31 March' }

    it 'returns a hash of pay slip details' do
      expect(pay_slip.generate).to be_eql(
        first_name: 'David',
        last_name: 'Rudd',
        payment_period: '01 March - 31 March',
        gross_income: 5004,
        income_tax: 922,
        net_income: 4082,
        super_annuation: 450
      )
    end
  end
end
