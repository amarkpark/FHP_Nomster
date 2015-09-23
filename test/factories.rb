# factories.rb

FactoryGirl.define do
	factory :user do
		sequence :email do |n|
			"usertest#{n}@testloopbackdomain.com"
		end
		password "testmetestme"
		password_confirmation "testmetestme"
	end

	factory :place do
		name "Spinning Wheels"
		address "3408 N. Broadway, Chicago, IL 60657"
		description "Helps keep wheels in true."
		association :user
	end

	factory :comment do
		message "Yeehaw!"
		rating "5_stars"
		association :user
		association :place
	end
end