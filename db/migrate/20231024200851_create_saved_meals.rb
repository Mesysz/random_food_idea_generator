# frozen_string_literal: true

class CreateSavedMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_meals, id: :uuid do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :source_id
      t.string :source_type
      t.references :user, null: false, foreign_key: false

      t.timestamps
    end
  end
end
