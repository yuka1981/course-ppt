class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_password

  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account],
        # password 與加密過的比對是否一樣 -> SHA1 的特質
        # password: bigbang(options[:password]))
        password: Digest::SHA1.hexdigest("x" + options[:password] + "y"))

      # 這邊不加 else 也會回傳 nil
    # else
    #   return false
    end
  end
  
  private
  def encrypt_password
                            # 這邊 self 可以省略 -> user 實體裡的方法 
    self.password = bigbang(self.password)
  end

  def bigbang(string)
    # 給它加點料
    string = "x" + string + "y"
    Digest::SHA1.hexdigest(string)
  end
end
