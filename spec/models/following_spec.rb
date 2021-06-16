require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Associations' do
    it { should belong_to :follower }
    it { should belong_to :whom_he_follows }
  end
end
