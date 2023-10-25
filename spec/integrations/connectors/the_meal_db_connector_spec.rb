# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Connectors::TheMealDbConnector do
  describe '#random_meal' do
    let(:result) { Meal.new }

    it 'fetches random meal' do
      response = instance_double(RestClient::Response, body: '')
      parser = double(Parsers::TheMealDbParser)
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(Parsers::TheMealDbParser).to receive(:new).with(response.body).and_return(parser)
      allow(parser).to receive(:to_meals).and_return([result])
      allow(Connectors::RedisConnector).to receive(:set_key)

      expect(described_class.random_meal).to eq(result)
    end
  end

  describe '#search_meal' do
    let(:result) { Meal.new }

    it 'fetches random meal' do
      response = instance_double(RestClient::Response, body: '')
      parser = double(Parsers::TheMealDbParser)
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(Parsers::TheMealDbParser).to receive(:new).with(response.body).and_return(parser)
      allow(parser).to receive(:to_meals).and_return([result])
      allow(Connectors::RedisConnector).to receive(:set_key)

      expect(described_class.search_meal(name: 'name')).to eq([result])
    end
  end

  describe '#meal_details' do
    let(:result) { Meal.new }

    it 'fetches random meal' do
      response = instance_double(RestClient::Response, body: '')
      parser = double(Parsers::TheMealDbParser)
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(Parsers::TheMealDbParser).to receive(:new).with(response.body).and_return(parser)
      allow(parser).to receive(:to_meals).and_return([result])
      allow(Connectors::RedisConnector).to receive(:get_key)

      expect(described_class.meal_details(meal_id: 'meal_id')).to eq(result)
    end
  end

  describe '#meal_categories' do
    let(:result) { Category.new }

    it 'fetches random meal' do
      response = instance_double(RestClient::Response, body: '')
      parser = double(Parsers::TheMealDbParser)
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(Parsers::TheMealDbParser).to receive(:new).with(response.body).and_return(parser)
      allow(parser).to receive(:to_categories).and_return([result])
      allow(Connectors::RedisConnector).to receive(:set_key)

      expect(described_class.meal_categories).to eq([result])
    end
  end

  describe '#meal_by_category' do
    let(:result) { Meal.new }

    it 'fetches random meal' do
      response = instance_double(RestClient::Response, body: '')
      parser = double(Parsers::TheMealDbParser)
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(Parsers::TheMealDbParser).to receive(:new).with(response.body).and_return(parser)
      allow(parser).to receive(:to_meals).and_return([result])
      allow(Connectors::RedisConnector).to receive(:set_key)

      expect(described_class.meal_by_category(category_id: 'category_id')).to eq([result])
    end
  end
end
