# spec/models/food_spec.rb

require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    # Create a user using FactoryBot and associate it with the food record
    food = FactoryBot.create(:food, user: FactoryBot.create(:user))
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = FactoryBot.build(:food, name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    food = FactoryBot.build(:food, measurement_unit: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = FactoryBot.build(:food, price: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    food = FactoryBot.build(:food, quantity: nil)
    expect(food).to_not be_valid
  end
end
