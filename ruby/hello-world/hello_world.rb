class HelloWorld
    def self.hello(name=nil)
      "Hello, #{name ? name : "World"}!"
    end
end
