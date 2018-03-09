require 'reload'

describe Reload do
  let(:reload) { described_class.new }

  describe '#initialize' do
    it 'has a @printer variable that is an instance of Printer' do
      expect(reload.printer).to be_an_instance_of(Printer)
    end
  end

  describe '#assign_product_or_change' do
    it 'calls gets to receive user input' do
      allow(STDIN).to receive(:gets) { 'change' }
      reload.assign_product_or_change
      expect(STDIN).to have_received(:gets)
    end
  end
end