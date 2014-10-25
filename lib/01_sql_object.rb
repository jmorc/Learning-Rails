require_relative 'db_connection'
require 'active_support/inflector'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    query = DBConnection::execute2(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL
  
    symbols = []
    query.first.each do |el|
      symbols << el.to_sym
    end

    symbols
  end

  def self.finalize!
    cols = self.columns

    cols.each do |col|
      setter_name = col.to_s + '='

      define_method(col) do
        self.attributes[col]
      end
      
      define_method(setter_name) do |arg|
        self.attributes[col] = arg 
      end
    end
  
  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    query = DBConnection.execute(<<-SQL)
    SELECT *
    FROM "#{self.table_name}"
    SQL
 
    my_objects = []
    query.each do |q|
      my_objects << self.new(q)
    end
    
    my_objects
  end

  def self.parse_all(results)
    my_objects =[]
    results.each do |result|
      my_objects << self.new(result)
    end
    
    my_objects
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL)
    SELECT *
    FROM "#{self.table_name}"
    WHERE id = #{id}
    SQL
    found_obj = self.new(query.first)
    
    found_obj
  end

  def initialize(params = {})
    legit_cols = self.class.columns
  
    params.each do |col, val|
      unless  legit_cols.include?(col.to_sym)
        raise "unknown attribute '#{col}'"
      end
      
   method = col.to_s + '='
   method = method.to_sym
   self.send(method, val) 
   
    end
  end

  def attributes
    @attributes ||= {}
  
  end

  def attribute_values
    cols = self.class.columns
    
    vals = cols.map do |col|
      self.send(col)
    end
  
    vals    
  end

  def insert
    cols = self.class.columns
    col_names = cols.join(", ")
    question_marks = ["?"] * cols.count
    question_marks = question_marks.join(', ')
    
    my_attributes = attribute_values
    # p my_attributes
    p self.class.table_name
    query = DBConnection.execute(<<-SQL, *my_attributes )
    INSERT INTO
      "#{self.class.table_name}" (#{col_names})
    VALUES
      (?, ?, ?)
      SQL
   
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
