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
  describe '#follow_btn' do
    context 'When the user to follow is the current user' do
      def current_user
        User.new(id: 1, username: 'user', fullname: 'user')
      end
      it 'displays a gray dull button' do
        gray_button = button_to 'follow', \
                                follow_path, \
                                params: { followed_id: current_user.id }, disabled: true, class: 'chef-btn-disabled'
        expect(follow_btn(current_user)).to eql gray_button
      end
    end
    context 'When the user to follow is not the current' do
      def current_user
        User.new(username: 'user2', fullname: 'user2')
      end
      it 'displays a button to unfollow' do
        user1 = User.new(username: 'user1', fullname: 'user1')
        user1.followings.build(followed_id: user1.id, follower_id: current_user.id)
        follow_button = button_to 'follow', follow_path, params: { followed_id: user1.id }, class: 'chef-btn-1'
        expect(follow_btn(user1)).to eql follow_button
      end
    end
  end
end
