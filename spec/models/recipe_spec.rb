require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'Associations' do
    it { should belong_to :user }
  end

  context 'Validations' do
    it { should validate_presence_of :description }
  end
end
