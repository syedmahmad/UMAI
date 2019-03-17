class List < ActiveRecord::Base
	has_many :list_items, :dependent => :destroy

	scope :un_archive, -> { where(archive: true)}
end
