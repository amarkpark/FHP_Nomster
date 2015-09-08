class Place < ActiveRecord::Base

	# start added for pagination
	def self.search(search, page)
  		paginate :per_page => 5, :page => page,
           		 :conditions => ['name like ?', "%#{search}%"],
           		 :order => 'name'
	end
	# end added for pagination

	# Adding association to Users table
	belongs_to :user
	validates :name, :presence => true, :length {:minimum => 3}
	validates :address, :presence => true
	validates :description, :presence => true, :length {:minimum => 5}

end
