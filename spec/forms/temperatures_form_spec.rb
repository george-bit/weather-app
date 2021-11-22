require 'rails_helper'

RSpec.describe TemperaturesForm, type: :model do
  describe '#save' do
    it 'can create a new record when none exist' do
      described_class.new(max_cold_temp: '9', min_hot_temp: '18').save

      temperatures = Temperatures.all

      expect(temperatures.count).to eq(1)
      expect(temperatures.first.max_cold_temp).to eq(9)
      expect(temperatures.first.min_hot_temp).to eq(18)
    end

    it 'can update an existing record' do
      Temperatures.create!(max_cold_temp: '11', min_hot_temp: '22')
      described_class.new(max_cold_temp: '9', min_hot_temp: '18').save

      temperatures = Temperatures.all

      expect(temperatures.count).to eq(1)
      expect(temperatures.first.max_cold_temp).to eq(9)
      expect(temperatures.first.min_hot_temp).to eq(18)
    end
  end
end
