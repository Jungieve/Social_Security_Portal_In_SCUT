class User
    #属性访问器，定义set&get方法
    attr_accessor :name, :email
    def initialize(attributes = {})
        @name = attr_accessor[:name]
        @email = attr_accessor[:email]
    end
    
    def formatted_email
        "#{@name} < #{@email}>"
    end
    
end