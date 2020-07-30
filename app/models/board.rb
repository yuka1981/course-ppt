class Board < ApplicationRecord

    acts_as_paranoid

    has_many :posts

    # validates :title, presence: true
    validates :title, presence: true, length: { minimum: 2 }

    # 不管什麼查詢都會套用這個
    # default_scope { where(deleted_at: nil) }
    # scope :available, -> { where(deleted_at: nil) }

    # def destroy
    #   update(deleted_at: Time.now)
    # end
end
