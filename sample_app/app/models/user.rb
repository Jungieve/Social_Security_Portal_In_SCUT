class User < ActiveRecord::Base
    attr_accessor :remember_token
    #rails回调before_save,把所有的电子地址转换成小写字母的形式
    before_save { self.email = email.downcase }
    validates :name, presence: true, length:{maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum:255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password,length:{ minimum: 6}
    
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    #为了持久会话，在数据库中记住用户
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    #如果指定的令牌和摘要匹配，返回true
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
end
