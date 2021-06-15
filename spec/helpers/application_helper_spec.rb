require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  helper_method :current_user

  describe '#login_menu' do
    context 'when a user is signed in' do
      def current_user
        User.new(username: 'Username', fullname: 'User')
      end
      it 'should display the menu' do
        menu_items = '<span>Hi User!</span><a class="btn btn-light btn-sm ms-3"'\
        ' rel="nofollow" data-method="delete" href="/sessions/1">Log out</a>'
        expect(log_in_menu).to eql menu_items
      end
    end

    context 'when no user is signed in' do
      def current_user; end

      it 'should display nothing' do
        menu_items = ''
        expect(log_in_menu).to eql menu_items
      end
    end
  end

  describe '#avatar' do
    context 'when a no image link is provided' do
      def current_user
        User.new(username: 'Username', fullname: 'User')
      end
      it 'displays a place holder image' do
        place_holder = image_tag 'https://raw.githubusercontent.com/mugberto/chefbook-images/'\
        'c63eb908b48acba9f5ead4ee181c7a81c111de1e/Images/avatar-1577909.svg',\
                                 class: 'rounded-circle w-100'
        expect(avatar).to eql place_holder
      end
    end

    context 'when an image link is provided' do
      def current_user
        photo_url = 'https://raw.githubusercontent.com/mugberto/chefbook-images/'\
        'c63eb908b48acba9f5ead4ee181c7a81c111de1e/Images/avatar-1577909.svg'
        User.new(username: 'Username', fullname: 'User', photo: photo_url)
      end
      it 'displays a user photo' do
        image = image_tag current_user.photo, class: 'avatar-image w-100 rounded-circle'
        expect(avatar).to eql image
      end
    end
  end
end
