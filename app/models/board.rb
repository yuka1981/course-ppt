class Board < ApplicationRecord
    # validates :title, presence: true
    validates :title, presence: true, length: { minimum: 2 }
end
