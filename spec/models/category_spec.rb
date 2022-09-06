require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.create(name: 'Grabrielle')
  subject do
    Category.new(user_id: user.id, name: 'Nandos')
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'total_payments should be equal to 0' do
    expect(subject.total_payments).to eq 0
  end
end
