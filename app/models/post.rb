class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :title, presence: true
  validates :serial, uniqueness: true
  # validates :serial, uniqueness: true, allow_nil: true

  # model callback life cycle: 新增跟更新
  # save -> 
  # valid -> 
  # before_validation -> 
  # validate -> 
  # after_validation -> 
  # before_save -> 
  # (before_create -> create -> after_create [update 不會走這段]) -> 
  # after_save -> 
  # after_commit

  before_create :create_serial

  # 這邊是要放在 helper 或是放在 model？
  def display_username
    user.nil? ? "未知" : user.account
  end

  private
  # self.serial 指的是 post model 中的 serial 欄位
  def create_serial
    self.serial = serial_generator(10)
    # 原型 self.serial=(serial_generator(10))
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
