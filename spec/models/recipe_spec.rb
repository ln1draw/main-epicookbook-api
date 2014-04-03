require 'spec_helper'

describe Recipe do
  let(:recipe) { create(:recipe) }
  describe 'validates' do
    it 'valid data' do
      expect(recipe).to be_valid
    end

    it 'presence of name' do
      recipe.update(name: nil)
      expect(recipe.errors[:name]).to include "can't be blank"
    end
  end
end
