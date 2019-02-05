class Gossip < ApplicationRecord
	belongs_to :user
	has_many :join_table_gossip_tags
	has_many :tags, through: :join_table_gossip_tags

		validates :title,
			format: { with: /(.*[a-z]){3}/i, message: " should be longer than 3 characters" }

		validates :content,
			format: { with: /(.*[a-z]){3}/i, message: " should be longer than 3 characters" }


end
