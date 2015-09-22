require 'test_helper'

class CommentTest < ActiveSupport::TestCase
# there's got to be a more automated way to do this...?
	test "humanized_rating_conversion" do
		rate1 = Comment.new(:rating => '1_star')
		assert_match(rate1.humanized_rating, "one star")

		rate2 = Comment.new(:rating => '2_stars')
		assert_match(rate2.humanized_rating, "two stars") 

		rate3 = Comment.new(:rating => '3_stars')
		assert_match(rate3.humanized_rating, "three stars") 

		rate4 = Comment.new(:rating => '4_stars')
		assert_match(rate4.humanized_rating, "four stars") 

		rate5 = Comment.new(:rating => '5_stars')
		assert_match(rate5.humanized_rating, "five stars") 

	end

end
