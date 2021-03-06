class Board < ApplicationRecord

    acts_as_paranoid

    # 有設定 act_as_paranoid 的狀態下，下面這行沒有作用
    # has_many :posts, dependent: :destroy
    has_many :posts

    has_many :board_masters
    has_many :users, through: :board_masters

    # validates :title, presence: true
    validates :title, presence: true, length: { minimum: 2 }

    # 不管什麼查詢都會套用這個
    # default_scope { where(deleted_at: nil) }
    # scope :available, -> { where(deleted_at: nil) }

    # def destroy
    #   update(deleted_at: Time.now)
    # end
end
