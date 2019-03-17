class ListItem < ActiveRecord::Base
	belongs_to :list

	scope :un_archive, -> { where(archive: true)}
end
