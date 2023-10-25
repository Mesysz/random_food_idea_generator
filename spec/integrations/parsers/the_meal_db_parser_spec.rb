# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::TheMealDbParser do
  describe '#to_categories' do
    subject { described_class.new(response).to_categories }

    let(:response) do
      {
        categories: [{
          idCategory: '1',
          strCategory: 'cat',
          strCategoryDescription: 'desc'
        }]
      }.to_json
    end

    it 'creates array of Category objects' do
      expect(subject.map(&:class).uniq).to eq([Category])
    end
  end

  describe '#to_meals' do
    subject { described_class.new(response).to_meals }

    let(:response) do
      {
        meals: [{
          idMeal: '1',
          strMeal: 'name',
          strCategory: 'cat',
          strInstructions: 'desc',
          source: TheMealDb.name
        }]
      }.to_json
    end

    it 'creates array of Meal objects' do
      expect(subject.map(&:class).uniq).to eq([Meal])
    end
  end
end
