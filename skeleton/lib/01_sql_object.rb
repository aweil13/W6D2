require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
      return @columns if @columns
      table = DBConnection.execute2(<<-SQL)
        select * from #{self.table_name}
      SQL
      @columns = table.first.map{|col| col.to_sym} 
  end

def self.finalize!
      self.columns.each do |column|
          define_method(column) do
            self.attributes[column]
          end
          define_method("#{column}=") do |val = nil|
            self.attributes[column] = val
          end
      end
end

  def self.table_name=(table_name)
    
  end

  def self.table_name
     self.to_s.downcase + "s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    
    params.each do |attr_name, value|
      name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(name)
      self.send("#{name}=", value)  
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
