# frozen_string_literal: true

# == Schema Information
#
# Table name: saved_meals
#
#  id          :uuid             not null, primary key
#  category    :string
#  description :text
#  name        :string
#  source_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  source_id   :string
#  user_id     :bigint           not null
#
# Indexes
#
#  index_saved_meals_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe SavedMeal do
  it { is_expected.to validate_presence_of(:user) }
end
