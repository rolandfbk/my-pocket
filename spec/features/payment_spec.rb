require 'rails_helper'

RSpec.describe 'Category page test', type: :feature do
  describe 'new page' do
    before :each do
      @user = User.create(name: 'Grabrielle', email: 'gabrielle@test.com', password: '123456789')
      @category = @user.categories.create(name: 'Nandos')
      @payment = @category.payments.create(name: 'Chips', amount: 10, user_id: @user.id)

      visit new_user_session_path
      fill_in 'Email', with: 'gabrielle@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check payments#new path' do
      visit "/categories/#{@category.id}/payments/new"
      expect(current_path).to eq("/categories/#{@category.id}/payments/new")
    end
  end
end
