class Place < ActiveRecord::Base

	# start added for pagination
	#def self.search(search, page)
  	#	paginate :per_page => 5, :page => page,
    #       		 :conditions => ['name like ?', "%#{search}%"],
    #       		 :order => 'name'
	# end
	# end added for pagination

	# 20150909 15:29 to replace pagination bit from above
	# found here: http://stackoverflow.com/questions/18667615/deprecation-warning-apply-finder-options
	# Note: this is using JSON hash syntax
	def self.search(search, page)
  		order('name').where('name LIKE ?', "%#{search}%").paginate(page: page, per_page: 5)
	end
	# to replace pagination bit from above... this may break pagination

	# Adding association to Users table
	belongs_to :user
	# Adding association to Comments table:
	has_many :comments 
	# Adding connections to lat lng for Geocoder
	geocoded_by :address
	after_validation :geocode
	# Field/data validations for New Record:
	validates :name, :presence => true, :length => {:minimum => 3}
	validates :address, :presence => true
	validates :description, :presence => true, :length => {:minimum => 5}


end
