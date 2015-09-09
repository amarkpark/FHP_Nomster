# geocoder.rb initializer for geocoder gem Lesson 29 ~AMP

Geocoder.configure(
	:lookup => :bing,
	:api_key => ENV['GEOCODER_API_KEY'],
	:timeout => 15,
)