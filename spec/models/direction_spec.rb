require 'spec_helper'

describe Direction do
  let(:direction) { create(:direction) }
  describe 'validates' do
    it 'valid data' do
      expect(direction).to be_valid
    end

    it 'presence of recipe_id' do
      direction.update(recipe_id: nil)
      expect(direction.errors[:recipe_id]).to include "can't be blank"
    end

    it 'presence of content' do
      direction.update(content: nil)
      expect(direction.errors[:content]).to include "can't be blank"
    end
  end
end
