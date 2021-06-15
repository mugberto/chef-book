require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  helper_method :current_user
  before(:all) do
    @user1 = User.create(username: 'user1username', fullname: 'user2fullname')
    @user2 = User.create(username: 'user2username', fullname: 'user2fullname')
    @user3 = User.create(username: 'user3username', fullname: 'user3fullname')
    @user1.followers = [@user2]
  end
  describe '#follow_btn' do
    context 'When the user to follow is the current user' do
      def current_user
        @user1
      end
      it 'displays a gray dull button' do
        gray_button = button_to 'follow', \
                                follow_path, \
                                params: { followed_id: current_user.id }, disabled: true, class: 'chef-btn-disabled'
        expect(follow_btn(@user1)).to eql gray_button
      end
    end

    context 'When the user to follow is followed by the current' do
      def current_user
        @user2
      end
      it 'displays a button to unfollow' do
        unfollow_button = button_to 'unfollow', \
                                    unfollow_path, \
                                    params: { followed_id: @user1.id }, method: :delete, class: 'chef-btn-1'
        expect(follow_btn(@user1)).to eql unfollow_button
      end
    end

    context 'When the user to follow is not followed by the current' do
      def current_user
        @user3
      end
      it 'displays a button to follow' do
        follow_button = button_to 'follow', follow_path, params: { followed_id: @user1.id }, class: 'chef-btn-1'
        expect(follow_btn(@user1)).to eql follow_button
      end
    end
  end
end
