require 'rails_helper'
RSpec.describe StaticPagesController, type: :controller do
  describe 'Top' do
    context "should get top" do
      before do
        get :top
      end
      it 'assert_response :success' do
        expect(response.status).to eq 200
      end
    end
  end
end