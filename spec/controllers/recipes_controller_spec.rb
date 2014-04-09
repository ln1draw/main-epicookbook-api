require 'spec_helper'

describe RecipesController do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end
  describe 'GET index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    # I need to know more about testing json to write more specs
  end
  # index show create destroy
end