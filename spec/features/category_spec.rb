require 'rails_helper'

RSpec.describe 'Category page test', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Grabrielle', email: 'gabrielle@test.com', password: '123456789')
      @category = @user.categories.create(name: 'Nandos')

      visit new_user_session_path
      fill_in 'Email', with: 'gabrielle@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check categories#index path' do
      visit root_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Categories')
    end

    it 'Should display all user categories details' do
      visit root_path
      expect(page).to have_content('Nandos')
      expect(page).to have_content('Add new')
      expect(page).to have_content('Categories')
    end

    it "Should navigate to recipe's new page" do
      visit root_path
      click_link 'Add new'
      expect(current_path).to eq(new_category_path)
    end
  end

  describe 'show page' do
    before :each do
      @user = User.create(name: 'Grabrielle', email: 'gabrielle@test.com', password: '123456789')
      @category = @user.categories.create(name: 'Nandos')
      @payment = @category.payments.create(name: 'Chips', amount: 10, user_id: @user.id)

      visit new_user_session_path
      fill_in 'Email', with: 'gabrielle@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check categories#show path' do
      visit "/categories/#{@category.id}"
      expect(current_path).to eq("/categories/#{@category.id}")
      expect(page).to have_text('Nandos')
    end

    it 'Should display all user category details' do
      visit "/categories/#{@category.id}"
      expect(page).to have_content('Nandos')
      expect(page).to have_content('10')
      expect(page).to have_content('Chips')
      expect(page).to have_content('Add new')
      expect(page).to have_content('TOTAL TRANSACTIONS')
      expect(page).to have_content('TOTAL PAYMENT')
    end

    it "Should navigate to recipe food's new page" do
      visit "/categories/#{@category.id}"
      click_link 'Add new'
      expect(current_path).to eq("/categories/#{@category.id}/payments/new")
    end
  end
end
