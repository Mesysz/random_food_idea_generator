# frozen_string_literal: true

RSpec.shared_examples 'MealServiceMethods' do
  context 'with MealServiceMethods module included' do
    it 'implements all required methods' do
      MealServiceMethods::REQUIRED_METHODS.each do |method|
        expect { described_class.send(method) }.not_to raise_error(NoMethodError)
      end
    end
  end
end
