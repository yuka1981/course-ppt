class Post < ApplicationRecord
  belongs_to :board

  validates :title, presence: true
  validates :serial, uniqueness: true

  before_save :create_serial

  private
  # self.serial 指的是 post model 中的 serial 欄位
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
