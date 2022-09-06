require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before :each do
    @user = User.create(name: 'Grabrielle', email: 'gabrielle@test.com', password: '123456789')
    @category = @user.categories.create(name: 'Nandos')
    @payment = @category.payments.create(name: 'Chips', amount: 10, user_id: @user.id)
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET #index' do
    before(:example) { get root_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it "should include 'Nandos'" do
      expect(response.body).to include('Nandos')
    end
  end

  describe 'GET #show' do
    before(:example) { get category_path(@category) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should render the category details' do
      expect(response.body).to include('Nandos')
      expect(response.body).to include('TOTAL TRANSACTIONS')
      expect(response.body).to include('Chips')
      expect(response.body).to include('10')
    end

    it 'total_payments should be equal to 10' do
      expect(@category.total_payments).to eq 10
    end
  end

  describe 'GET #new' do
    before(:example) { get new_category_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('new')
    end

    it 'should include "Add"' do
      expect(response.body).to include('Add')
    end
  end
end
