require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

	test "submit comment" do
		user = FactoryGirl.create(:user)
		place = FactoryGirl.create(:place, :user => user)
		user2 = FactoryGirl.create(:user)
		sign_in user2
		assert_difference 'place.comments.count' do
			#FactoryGirl.create(:comment, :place => place, :user => user2)
			post :create, :place_id => place.id, :comment => { :rating  => '5_stars', :message => "You spin me round"}
		end
		assert_redirected_to place_path(place.id)
		comment = Comment.last
		assert_equal user2, comment.user
	end

end
