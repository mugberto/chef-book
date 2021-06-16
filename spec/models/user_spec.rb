require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.create(username: 'user1userna', fullname: 'user1fullname')
    @user2 = User.create(username: 'user2userna', fullname: 'user2fullname')
    @user3 = User.create(username: 'user3userna', fullname: 'user3fullname')
  end
  context 'Associations' do
    it { should have_many :followers }
    it { should have_many :people_he_follows }
    it { should have_many :recipes }
  end
  context 'Validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :fullname }
  end
  describe '#followed_user?' do
    it 'truthy if the current_user is followed the user' do
      @user1.followers = [@user2, @user3]
      expect(@user2.followed_user?(@user1)).to eql true
    end
    it 'truthy if the current_user is followed the user' do
      @user1.followers = [@user2, @user3]
      expect(@user1.followed_user?(@user2)).not_to eql true
    end
  end
end
