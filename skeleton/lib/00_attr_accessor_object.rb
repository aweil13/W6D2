class AttrAccessorObject


  
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method("#{name}") do 
        instance_variable_get("@#{name}")  # instance_variable_get and set are methods in ruby itself
      end
      define_method("#{name}=") do |obj|
        instance_variable_set("@#{name}", obj) #second arg is placeholder for whatever the user invokes it with
      end    
    end
  end
end
