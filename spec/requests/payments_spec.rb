require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  before :each do
    @user = User.create(name: 'Grabrielle', email: 'gabrielle@test.com', password: '123456789')
    @category = @user.categories.create(name: 'Nandos')
    @payment = @category.payments.create(name: 'Chips', amount: 10, user_id: @user)
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET #new' do
    before(:example) { get new_category_payment_path(@category) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('new')
    end

    it "should include 'Add'" do
      expect(response.body).to include('Add')
    end
  end
end
