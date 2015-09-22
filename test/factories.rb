# factories.rb

FactoryGirl.define do
	factory :user do
		email "usertest@testloopback.tld"
		password "testmetestme"
		password_confirmation "testmetestme"
	end
end