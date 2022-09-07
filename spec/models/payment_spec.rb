require 'rails_helper'

RSpec.describe Payment, type: :model do
  user = User.create(name: 'Grabrielle')
  category = Category.create(user_id: user.id, name: 'Nandos')
  subject { Payment.new(category_id: category.id, user_id: user.id, name: 'Chips', amount: 10) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
