class User < ActiveRecord::Base
    #rails回调before_save,把所有的电子地址转换成小写字母的形式
    before_save { self.email = email.downcase }
    validates :name, presence: true, length:{maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum:255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password,length:{ minimum: 6}
end
