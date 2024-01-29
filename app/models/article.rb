class Article < ApplicationRecord
    belongs_to :category
    validates :publication_date, presence: true, on: :create
    attr_readonly :publication_date
end
