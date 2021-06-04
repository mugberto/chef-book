require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many :followers }
    it { should have_many :people_he_follows }
  end
  context 'Validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :fullname }
  end
end
