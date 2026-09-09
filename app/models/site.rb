class Site < ApplicationRecord
	has_many :rooms, dependent: :destroy
end
