# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TheMealDb do
  it_behaves_like 'MealServiceMethods'

  describe '#random_meal' do
    it 'retrieves random meal data' do
      expect(Connectors::TheMealDbConnector).to have_received(:random_meal)
      described_class.send(:random_meal)
    end
  end

  describe '#search_meal' do
    let(:name) { 'name' }

    it 'searches for meal' do
      expect(Connectors::TheMealDbConnector).to have_received(:search_meal).with(name:)
      described_class.send(:search_meal, name:)
    end
  end

  describe '#meal_details' do
    let(:meal_id) { 'meal_id' }

    it 'retrieves meal details' do
      expect(Connectors::TheMealDbConnector).to have_received(:meal_details).with(meal_id:)
      described_class.send(:meal_details, meal_id:)
    end
  end

  describe '#meal_categories' do
    it 'retrieves categories' do
      expect(Connectors::TheMealDbConnector).to have_received(:meal_categories)
      described_class.send(:meal_categories)
    end
  end

  describe '#meal_by_category' do
    let(:category_id) { 'category_id' }
    let(:category) do
      c = Category.new
      c.id_category = category_id
      c
    end

    it 'retrieves meals for category' do
      expect(Connectors::TheMealDbConnector).to have_received(:meal_by_category).with(category_id:)
      described_class.send(:meal_by_category, category:)
    end
  end
end
