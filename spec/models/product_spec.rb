require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @product = Product.new(:name => 'Name', :price_cents => 100, :quantity => 10, :category_id => 1)
    @productnil = Product.new

    @product.save
    @productnil.save
  end

  describe 'Validations' do
    it "should call error without product name" do
      expect(@product.name).to be_present
    end

    it "should call error without product price" do
      expect(@product.price_cents).to be_present
    end

    it "should call error without product quantity" do
      expect(@product.quantity).to be_present
    end

    it "should call error without product category" do
      expect(@product.category_id).to be_present
    end

    it "should call error without product name" do
      
      expect(@productnil.name).to be_nil
      expect(@productnil.errors.full_messages).to include("Name can't be blank")

      expect(@productnil.price_cents).to be_nil
      expect(@productnil.errors.full_messages).to include("Price can't be blank")

      expect(@productnil.quantity).to be_nil
      expect(@productnil.errors.full_messages).to include("Quantity can't be blank")

      expect(@productnil.category_id).to be_nil
      expect(@productnil.errors.full_messages).to include("Category can't be blank")

    end

  end
end
