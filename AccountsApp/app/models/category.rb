class Category < ApplicationRecord
    belongs_to :category_grp
    has_many :postdatum
end
